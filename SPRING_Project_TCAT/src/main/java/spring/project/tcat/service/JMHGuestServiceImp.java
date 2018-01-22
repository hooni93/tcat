package spring.project.tcat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatDiscBuyVO;
import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.persistence.HostDAO;
import spring.project.tcat.persistence.JMHGuestDAO;

@Service
public class JMHGuestServiceImp implements JMHGuestService {
	@Autowired
	private JMHGuestDAO mhDAO;
	@Autowired
	private HostDAO hDAO;

	// 아이디,비밀번호 찾기
	@Override
	public void findIdPwd(HttpServletRequest req, Model model) {
		// 웹에서 받아오기
		String member_email = req.getParameter("member_email");
		String member_name = req.getParameter("member_name");
		String member_id = req.getParameter("member_id");
		System.out.println(
				"member_email: " + member_email + "/" + "member_name" + member_name + "/" + "member_id" + member_id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_email", member_email);
		map.put("member_name", member_name);
		map.put("member_id", member_id);
		// DB에 해당 이메일과 이름이 존재하는 확인
		int id_emailChk = mhDAO.id_emailChk(map); // 1: 존재, 0: 존재x
		// 웹으로 체크 결과 전송
		model.addAttribute("id_emailChk", id_emailChk);
		System.out.println("id_emailChk: " + id_emailChk);
		if (id_emailChk == 1) {
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 6; i++) {
				int rIndex = rnd.nextInt(2);
				switch (rIndex) {
				case 0:
					// A~Z 글자 난수
					temp.append((char) ((int) (rnd.nextInt(26)) + 65));
					break;
				default:
					// 0~9 숫자 난수
					temp.append((rnd.nextInt(10)));
					break;
				}
			}
			// 6자 난수 받음
			String admit_code = temp.toString();
			// 세션에 띄우기
			req.getSession().setAttribute("admit_code", admit_code);
			mhDAO.sendIdMail(member_email, admit_code);
		}
	}

	// 아이디비밀번호 찾기 결과
	@Override
	public void findResult(HttpServletRequest req, Model model) {
		// 화면에서 값 받기
		String member_email = req.getParameter("member_email");
		String member_name = req.getParameter("member_name");
		String admit_code = req.getParameter("admit_code");
		String member_id = req.getParameter("member_id");
		String admit_code_key = (String) req.getSession().getAttribute("admit_code");
		System.out.println("admit_code_key: " + admit_code_key);
		// 승인코드 확인
		boolean admit = admit_code.equals(admit_code_key);

		// 값 전달 바구니
		Map<String, Object> map = new HashMap<String, Object>();
		// 승인코드 틀림
		if (admit == false) {
			// model 띄우기
			model.addAttribute("id_emailChk", 1);// 인증번호 전송됨
			model.addAttribute("admit_fail", 1);// 승인 FAIL
		}
		// 승인코드 맞음
		else {
			map.put("member_id", member_id);
			map.put("member_email", member_email);
			map.put("member_name", member_name);
			// 찾는 정보 가져오기
			String member_find = mhDAO.findIdPwd(map);

			// member_id!=null-> pwd
			// member_id==null-> id
			if (member_id == null) {
				model.addAttribute("member_id", member_find);
			} else {
				model.addAttribute("member_pwd", member_find);
			}
			// 띄우기
			model.addAttribute("admit_fail", 0);// 승인 OK
			req.getSession().removeAttribute("admit_code");
		}
	}

	// 로그인 처리
	@Override
	public void loginPro(HttpServletRequest req, Model model) {
		// 값 받기
		String member_id = req.getParameter("member_id");
		String member_pwd = req.getParameter("member_pwd");
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("member_pwd", member_pwd);
		// 로그인 확인
		int loginRs = mhDAO.loginPro(map);
		if (loginRs == 1) {
			// 접속일 갱신, 휴면계정 을 회원으로 스텝 변경
			mhDAO.updateLastDate(map);
			// 세션 태우기
			// 로그인 상태 아이디
			req.getSession().setAttribute("login_id", member_id);
		}
		// 로그인 결과값
		model.addAttribute("loginRs", loginRs);
	}

	// 마이페이지 정보가져오기
	@Override
	public void myPageInfo(HttpServletRequest req, Model model) {
		// 세션에 로그인된 아이디 받기
		String member_id = (String) req.getSession().getAttribute("login_id");
		System.out.println(member_id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);

		// 회원 정보 받기
		MemberVO myPageInfo = mhDAO.myPageInfo(map);
		model.addAttribute("myPageInfo", myPageInfo);

		// 회원의 배송정보
		ArrayList<TcatDiscBuyVO> db = null;
		map.put("disc_buyStep", 0);// 초기값
		for (int index = 1; index <= 8; index++) {
			// 1:결제 2:상품준비중 3:배송시작 4:배송중 5:배송완료 6:환불요청 7:환불승인 8:교환
			map.replace("disc_buyStep", index);// 구입스텝 변경
			db = mhDAO.memDiscBuy(map);
			int cnt = db.size();
			model.addAttribute("step" + index, cnt);
			model.addAttribute("listStep" + index, db);
			System.out.println("cnt:" + cnt);
		}
	}

	// 공연정보 리스트 가져오기
	public void getPerfList(HttpServletRequest req, Model model) {
		System.out.println("getPerfList");
		// 화면에서 원하는 데이터 호출
		String sDev = req.getParameter("sDev"); // 소분류
		String order = req.getParameter("order"); // 정렬순

		if (order.equals(""))
			order = null;

		// 게시판 구조
		int pageSize = 5; // 한 페이지당 출력할 글의 갯수
		int pageBlock = 10; // 한 블럭당 페이지 갯수
		int start = 0; // 현재 페이지 시작번호
		int end = 0; // 현재 페이지 글 마지막번호
		int number = 0; // 출력할 글번호
		String pageNum = null; // 페이지번호
		int currentPage = 0; // 현재 페이지
		int pageCnt = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지
		int productCnt = 0; // 앨범 갯수

		// 조건
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sDev", sDev);
		map.put("order", order);

		// 갯수
		productCnt = mhDAO.getPerfListCnt(map);
		System.out.println("해당 공연 갯수: " + productCnt);

		// 현재 보고있는 페이지
		pageNum = req.getParameter("pageNum");
		if ((pageNum == null)) {
			pageNum = "1"; // 첫 페이지를 1페이지로 설정
		}
		System.out.println("pageNum: " + pageNum);

		// 현재 페이지
		currentPage = Integer.parseInt(pageNum);
		// 페이지 갯수 = 앨범 갯수 / 페이지에 보여줄 갯수 +(나머지가 존재하면 1페이지 추가)
		pageCnt = (productCnt / pageSize) + (productCnt % pageSize > 0 ? 1 : 0);

		// 현재페이지 글 시작번호
		number = 1 + (currentPage - 1) * pageSize;
		// 1페이지 경우 시작번호는 1
		start = (currentPage - 1) * pageSize + 1;
		// 현재페이지 끝번호
		end = start + pageSize - 1;

		// 만약 페이지 끝번호보다 앨범갯수보다 크면
		if (end > productCnt)
			end = productCnt;

		// 게시글 받아오기
		if (productCnt > 0) {
			// 게시물 가져오기
			map.put("start", start);
			map.put("end", end);
			// 담을 바구니 생성
			ArrayList<TcatPerformanceVO> perfs = mhDAO.getPerfList(map);
			System.out.println("공연 갯수: " + perfs.size());
			model.addAttribute("perfs", perfs);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock; // (5%3) == 0
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}

		// req넘기기

		model.addAttribute("number", number);
		model.addAttribute("productCnt", productCnt);// 글갯수
		model.addAttribute("pageNum", pageNum);// 페이지 번호
		if (productCnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage);// 현재 페이지
			System.out.println("pageCnt" + pageCnt);
		}
		// 페이지 카테고리 정보
		model.addAttribute("sDev", sDev); // 대분류
		model.addAttribute("order", order); // 정렬
	}

	// 스토어 리스 가져오기
	public void getStoreList(HttpServletRequest req, Model model) {
		System.out.println("getPerfList");
		// 화면에서 원하는 데이터 호출
		String sDev = req.getParameter("sDev"); // 소분류
		String order = req.getParameter("order"); // 정렬순

		if (order.equals(""))
			order = null;

		// 게시판 구조
		int pageSize = 5; // 한 페이지당 출력할 글의 갯수
		int pageBlock = 10; // 한 블럭당 페이지 갯수
		int start = 0; // 현재 페이지 시작번호
		int end = 0; // 현재 페이지 글 마지막번호
		int number = 0; // 출력할 글번호
		String pageNum = null; // 페이지번호
		int currentPage = 0; // 현재 페이지
		int pageCnt = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지
		int productCnt = 0; // 앨범 갯수

		// 조건
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sDev", sDev);
		map.put("order", order);

		// 갯수
		productCnt = mhDAO.getStoreListCnt(map);
		System.out.println("해당 공연 갯수: " + productCnt);

		// 현재 보고있는 페이지
		pageNum = req.getParameter("pageNum");
		if ((pageNum == null)) {
			pageNum = "1"; // 첫 페이지를 1페이지로 설정
		}
		System.out.println("pageNum: " + pageNum);

		// 현재 페이지
		currentPage = Integer.parseInt(pageNum);
		// 페이지 갯수 = 앨범 갯수 / 페이지에 보여줄 갯수 +(나머지가 존재하면 1페이지 추가)
		pageCnt = (productCnt / pageSize) + (productCnt % pageSize > 0 ? 1 : 0);

		// 현재페이지 글 시작번호
		number = 1 + (currentPage - 1) * pageSize;
		// 1페이지 경우 시작번호는 1
		start = (currentPage - 1) * pageSize + 1;
		// 현재페이지 끝번호
		end = start + pageSize - 1;

		// 만약 페이지 끝번호보다 앨범갯수보다 크면
		if (end > productCnt)
			end = productCnt;

		// 게시글 받아오기
		if (productCnt > 0) {
			// 게시물 가져오기
			map.put("start", start);
			map.put("end", end);
			// 담을 바구니 생성
			ArrayList<TcatPerDiscVO> discs = mhDAO.getStoreList(map);
			System.out.println("공연 갯수: " + discs.size());
			model.addAttribute("discs", discs);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock; // (5%3) == 0
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}

		// req넘기기

		model.addAttribute("number", number);
		model.addAttribute("productCnt", productCnt);// 글갯수
		model.addAttribute("pageNum", pageNum);// 페이지 번호
		if (productCnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage);// 현재 페이지
			System.out.println("pageCnt" + pageCnt);
		}
		// 페이지 카테고리 정보
		model.addAttribute("sDev", sDev); // 대분류
		model.addAttribute("order", order); // 정렬
	}

	// 공연 상세 정보 가져오기
	public void getContent(HttpServletRequest req, Model model) {
		int per_id = Integer.parseInt(req.getParameter("per_id"));
		//로그인이 된경우에만 조회수 업데이트
		String login_id = (String) req.getSession().getAttribute("login_id");
		if(login_id != null) {
			mhDAO.upHits(per_id);
		}
		TcatPerformanceVO perf = mhDAO.getContent(per_id);

		model.addAttribute("perf", perf);

	}

	// addWishList 위시리스트 추가
	public void addWishList(HttpServletRequest req, Model model) {
		String member_id = (String) req.getSession().getAttribute("login_id");
		String per = req.getParameter("per_id");
		String disc = req.getParameter("disc_code");
		int wish_step = 0;
		int disc_code = 0;
		int per_id = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);

		if (per == null) {
			wish_step = 2; // 스토어
			disc_code = Integer.parseInt(disc);
			map.put("disc_code", disc_code);
			map.put("per_id", 0);
		} else {
			wish_step = 1; // 공연
			per_id = Integer.parseInt(per);
			map.put("per_id", per_id);
			map.put("disc_code", 0);
		}
		map.put("wish_step", wish_step);

		mhDAO.addWishList(map);
	}

	// 해당 위시리스트 삭제
	public void delWishList(HttpServletRequest req, Model model) {
		String member_id = (String) req.getSession().getAttribute("login_id");
		String per = req.getParameter("per_id");
		String disc = req.getParameter("disc_code");
		int wish_step = 0;
		int disc_code = 0;
		int per_id = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);

		if (per == null) {
			disc_code = Integer.parseInt(disc);
			map.put("disc_code", disc_code);
			map.put("per_id", 0);
		} else {
			per_id = Integer.parseInt(per);
			map.put("per_id", per_id);
			map.put("disc_code", 0);
		}

		mhDAO.delWishList(map);
	}

	// getWishListIn 위시리스트 해당 공연 존재 확인
	public void getWishListIn(HttpServletRequest req, Model model) {
		String member_id = (String) req.getSession().getAttribute("login_id");
		String per = req.getParameter("per_id");
		String disc = req.getParameter("disc_code");
		int disc_code = 0;
		int per_id = 0;
		int wishResult = 0;
		if (member_id != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("member_id", member_id);
			if (per == null) {
				disc_code = Integer.parseInt(disc);
				map.put("disc_code", disc_code);
				map.put("per_id", 0);
			} else {
				per_id = Integer.parseInt(per);
				map.put("per_id", per_id);
				map.put("disc_code", 0);
			}

			wishResult = mhDAO.getWishListIn(map);
		}
		model.addAttribute("wishResult", wishResult);
	}

}
