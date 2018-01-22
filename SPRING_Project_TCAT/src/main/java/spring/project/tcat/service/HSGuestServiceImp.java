package spring.project.tcat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.project.tcat.VO.CategoryVO;
import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.SelectHellInfoVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.persistence.HSGuestDAO;

@Service
public class HSGuestServiceImp implements HSGuestService{
	
	@Autowired
	HSGuestDAO HSDao;

	@Override
	public void MemberIdCheack(HttpServletRequest req, Model model) {
		String member_id=req.getParameter("member_id");
		int IdCheack=0;
		IdCheack=HSDao.MemberIdCheack(member_id);
		req.setAttribute("IdCheack", IdCheack);
		req.setAttribute("member_id", member_id);
	}

	@Override
	public void insertMember(HttpServletRequest req, Model model) {
		String member_id=req.getParameter("member_id"); 		//아이디+
		String member_pwd=req.getParameter("member_pwd"); 		//비밀번호+
		String member_name=req.getParameter("member_name"); 		//이름+
		String member_hp=req.getParameter("member_hp"); 		//연락처+
		
		String postNum=req.getParameter("postNum");
		String detailAddr=req.getParameter("detailAddr");
		String addr=req.getParameter("addr"); 		//주소-daum주소검색
		String member_addr="["+postNum+"]"+addr+" "+detailAddr;
		
		String member_email=req.getParameter("member_email"); 		//이메일+
		String member_gender=req.getParameter("member_gender"); 		//성별
		String member_birth=req.getParameter("member_birth"); 		//생년월일
		
		MemberVO dto=new MemberVO();
		dto.setMember_addr(member_addr);
		dto.setMember_birth(member_birth);
		dto.setMember_email(member_email);
		dto.setMember_gender(member_gender);
		dto.setMember_hp(member_hp);
		dto.setMember_id(member_id);
		dto.setMember_name(member_name);
		dto.setMember_pwd(member_pwd);
		System.out.println(
				"member_addr:"+member_addr+"\n"+
				"member_birth:"+member_birth+"\n"+
				"member_email:"+member_email+"\n"+
				"member_gender:"+member_gender+"\n"+
				"member_hp:"+member_hp+"\n"+
				"member_id:"+member_id+"\n"+
				"member_pwd:"+member_pwd+"\n"
		);
		
		int cnt=0;
		cnt=HSDao.insertMember(dto);
		req.setAttribute("cnt", cnt);

	}
	
	
	@Override
	public void daySearch(HttpServletRequest req, Model model) {
		int pageSize = 10; // 한 페이지당 출력한 글 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 글시작 번호
		int end = 0; // 현재 페이지 글마지막 번호
		int number = 0; // 출력할 글번호
		String pageNum = null; // 페이지번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지
		
		// 글갯수 구하기
		String searchDate=null;
		searchDate=req.getParameter("date");
		System.out.println("date:000:"+searchDate);
		
		cnt = HSDao.daySearchCnt(searchDate);
		System.out.println("cnt:" + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 설정
		}

		currentPage = Integer.parseInt(pageNum);// 현재 페이지
		// pageCnt = 12/5+1; //나머지 2건이 1페이지로 할당되므로 3페이지
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 갯수=(글갯수/페이지당 글갯수)+(나머지가 있으면1 아니면0)

		// 현재 페이지 1=(1-1)*5+1
		// 6=(2-1)*5+1
		// 11=(3-1)*5+1
		// 21=(5-1)*5+1

		start = (currentPage - 1) * pageSize + 1;// 현재 페이지 시작번호

		// 5=1+5-1;

		end = start + pageSize - 1; // 현재 페이지 끝번호

		System.out.println("start:" + start);
		System.out.println("end:" + end);

		if (end > cnt)
			end = cnt;

		// 21 - (5-1)*5;
		number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호.. 최신글(큰페이지)출력할 글번호
		System.out.println("number:" + number);
		System.out.println("cnt:" + cnt);
		System.out.println("currentPage:" + currentPage);
		System.out.println("pageSize:" + pageSize);

		if (cnt > 0) {
			// 게시글 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("searchDate",searchDate);
			ArrayList<TcatPerformanceVO> dtos=HSDao.daySearchList(map);
			
			System.out.println("R_seatPrice------------"+dtos.get(0).getR_seatPrice());
			req.setAttribute("dtos", dtos);

		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지=(현재 페이지/한 블럭당 페이지 갯수)*한 블럭당 페이지 갯수+1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock; // (현재페이지%한 블럭당 페이지 갯수==0)

		endPage = startPage + pageBlock - 1; // 마지막페이지=시작페이지+한 블럭당 페이지 갯수-1;
		if (endPage > pageCount)
			endPage = pageCount;

		req.setAttribute("cnt", cnt); // 글갯수
		req.setAttribute("number", number);// 글번호
		req.setAttribute("pageNum", pageNum); // 페이지번호

		if (cnt > 0) {
			req.setAttribute("startPage", startPage); // 시작 페이지
			req.setAttribute("endPage", endPage); // 마지막 페이지
			req.setAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			req.setAttribute("pageCount", pageCount); // 페이지 갯수
			req.setAttribute("currentPage", currentPage);// 현재 페이지
		}

	}	

	//지역별 리스트 가져오기
		@Override
		public void placeList(HttpServletRequest req, Model model) {
			int pageSize = 10; // 한 페이지당 출력한 글 갯수
			int pageBlock = 5; // 한 블럭당 페이지 갯수

			int cnt = 0; // 글갯수
			int start = 0; // 현재 페이지 글시작 번호
			int end = 0; // 현재 페이지 글마지막 번호
			int number = 0; // 출력할 글번호
			String pageNum = null; // 페이지번호
			int currentPage = 0; // 현재 페이지

			int pageCount = 0; // 페이지 갯수
			int startPage = 0; // 시작 페이지
			int endPage = 0; // 마지막 페이지
			
			// 글갯수 구하기
			String place=null;
			place=req.getParameter("place");
			System.out.println("place:000:"+place);
			Map<String,Object> map2=new HashMap<String,Object>();
			map2.put("place", place);
			cnt = HSDao.placeCnt(map2);
			System.out.println("cnt:" + cnt);

			pageNum = req.getParameter("pageNum");

			if (pageNum == null) {
				pageNum = "1"; // 첫페이지를 1페이지로 설정
			}

			currentPage = Integer.parseInt(pageNum);// 현재 페이지
			// pageCnt = 12/5+1; //나머지 2건이 1페이지로 할당되므로 3페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 갯수=(글갯수/페이지당 글갯수)+(나머지가 있으면1 아니면0)

			// 현재 페이지 1=(1-1)*5+1
			// 6=(2-1)*5+1
			// 11=(3-1)*5+1
			// 21=(5-1)*5+1

			start = (currentPage - 1) * pageSize + 1;// 현재 페이지 시작번호

			// 5=1+5-1;

			end = start + pageSize - 1; // 현재 페이지 끝번호

			System.out.println("start:" + start);
			System.out.println("end:" + end);

			if (end > cnt)
				end = cnt;

			// 21 - (5-1)*5;
			number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호.. 최신글(큰페이지)출력할 글번호
			System.out.println("number:" + number);
			System.out.println("cnt:" + cnt);
			System.out.println("currentPage:" + currentPage);
			System.out.println("pageSize:" + pageSize);

			if (cnt > 0) {
				// 게시글 목록 조회
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("start", start);
				map.put("end", end);
				map.put("place",place);
				ArrayList<TcatPerformanceVO> dtos=HSDao.placeList(map);
				
				req.setAttribute("dtos", dtos);

			}

			startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지=(현재 페이지/한 블럭당 페이지 갯수)*한 블럭당 페이지 갯수+1;
			if (currentPage % pageBlock == 0)
				startPage -= pageBlock; // (현재페이지%한 블럭당 페이지 갯수==0)

			endPage = startPage + pageBlock - 1; // 마지막페이지=시작페이지+한 블럭당 페이지 갯수-1;
			if (endPage > pageCount)
				endPage = pageCount;

			req.setAttribute("cnt", cnt); // 글갯수
			req.setAttribute("number", number);// 글번호
			req.setAttribute("pageNum", pageNum); // 페이지번호

			if (cnt > 0) {
				req.setAttribute("startPage", startPage); // 시작 페이지
				req.setAttribute("endPage", endPage); // 마지막 페이지
				req.setAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
				req.setAttribute("pageCount", pageCount); // 페이지 갯수
				req.setAttribute("currentPage", currentPage);// 현재 페이지
			}

			
		}
		//장바구니에 담기
		@Override
		public void insertCart(HttpServletRequest req, Model model) {
			String member_id=(String)req.getSession().getAttribute("login_id");
			int disc_code=Integer.parseInt(req.getParameter("disc_code"));
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("member_id", member_id);
			map.put("disc_code", disc_code);
			
			int insertCart=0;
			insertCart=HSDao.insertCart(map);
			
			req.setAttribute("insertCart", insertCart);
		}	
	
}
