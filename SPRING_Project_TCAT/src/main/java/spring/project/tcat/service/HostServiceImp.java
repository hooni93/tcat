
package spring.project.tcat.service;

import java.io.File;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.project.tcat.VO.CategoryVO;
import spring.project.tcat.VO.HostVO;
import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.ProductRankVO;
import spring.project.tcat.VO.SelectHellInfoVO;
import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.VO.TcatDiscBuyVO;
import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.VO.TcatTicketingVO;
import spring.project.tcat.persistence.HostDAO;
import spring.project.tcat.persistence.HostDAOImp;

@Service
public class HostServiceImp implements HostService {

	@Autowired
	HostDAOImp hDao;
	@Autowired
	private JavaMailSender mailSender;
	
	
	//최근가입회원 화면 
	@Override
	public void join_retireMember(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		System.out.println("HostServiceImp - join_retireMember");
		int cnt=0; 
		SimpleDateFormat date=new SimpleDateFormat("yy/MM/dd");
		 Date today=new Date();
		 Date yesterDay=new Date();
		 today.setTime(today.getTime()+((long) 1000*60*60*24)); //365 년
		 yesterDay.setTime(today.getTime()-((long) 1000*60*60*24*7)); //작년 365
		 String todayStr=date.format(today);
		 String yesterDayStr=date.format(yesterDay);
		 Map<String,Object> map=new HashMap<String,Object>();
		 map.put("today", todayStr);
		 map.put("yesterday", yesterDayStr);
		 cnt=hDao.latelyJoinMemberCnt(map);
		 System.out.println(todayStr);
		 System.out.println(yesterDayStr);
		 System.out.println(cnt);
		 //게시판구조
			int pageSize = 10; // 한 페이지당 출력할 글 갯수
			int pageBlock = 3; // 한 블럭당 페이지 갯수
			int start = 0; // 현재 페이지 글시작번호
			int end = 0; // 현재 페이지 글마지막번호
			int number = 0; // 출력할 글번호
			String pageNum = null; // 페이지번호
			int currentPage = 0; // 현재페이지
			int pageCount = 0; // 페이지 갯수
			int startPage = 0; // 시작페이지
			int endPage = 0; // 마지막 페이지
			
			model.addAttribute("cnt", cnt);
			
			pageNum = req.getParameter("pageNum");
			
			if (pageNum == null) {
			pageNum = "1"; // 첫페이지 1페이지로 설정
			}
			currentPage = (Integer.parseInt(pageNum)); // 현재페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
			start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호
			end = start + pageSize - 1; // 현재페이지 끝번호
			if (end > cnt) {
			end = cnt;
			}
			number = cnt - (currentPage - 1) * pageSize;
			if (cnt > 0) {
			// 게시글 목록 조회
			map.put("start", start);
			map.put("end", end);
			ArrayList<MemberVO> dtos=hDao.latelyJoinMember(map);
			model.addAttribute("dtos", dtos);
			System.out.println("=================================");
			}
			
			
			startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
			if (currentPage % pageBlock == 0) {
			startPage -= pageBlock; // (5%3) == 0
			}
			endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6
			if (endPage > pageCount) {
			endPage = pageCount;
			}
			

			model.addAttribute("cnt", cnt);
			model.addAttribute("number", number);
			model.addAttribute("pageNum", pageNum);
			
			if (cnt > 0) {

			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
			}

	}

	
	
	
	
	
//휴면회원 리스트
		@Override
	public void sleepMember(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
			System.out.println("HostServiceImp - sleepMember");
				int cnt=0; 
			 //게시판구조
				int pageSize = 10; // 한 페이지당 출력할 글 갯수
				int pageBlock = 3; // 한 블럭당 페이지 갯수
				int start = 0; // 현재 페이지 글시작번호
				int end = 0; // 현재 페이지 글마지막번호
				int number = 0; // 출력할 글번호
				String pageNum = null; // 페이지번호
				int currentPage = 0; // 현재페이지
				int pageCount = 0; // 페이지 갯수
				int startPage = 0; // 시작페이지
				int endPage = 0; // 마지막 페이지
				int Hcnt=0;
				try {
				Hcnt=Integer.parseInt(req.getParameter("Hcnt"));
				}catch(NumberFormatException e) {
					Hcnt=1;
				}
				if(Hcnt==0) {
					Hcnt=1;
				}
				System.out.println(Hcnt);
				cnt=hDao.sleepMemberCnt(Hcnt);
				System.out.println(cnt);
				model.addAttribute("cnt", cnt);
				
				pageNum = req.getParameter("pageNum");
				
				if (pageNum == null) {
				pageNum = "1"; // 첫페이지 1페이지로 설정
				}
				currentPage = (Integer.parseInt(pageNum)); // 현재페이지
				pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
				start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호
				end = start + pageSize - 1; // 현재페이지 끝번호
				if (end > cnt) {
				end = cnt;
				}
				number = cnt - (currentPage - 1) * pageSize;
				if (cnt > 0) {
				// 게시글 목록 조회
				Map<String,Object> map=new HashMap<String,Object>();
				map.put("start", start);
				map.put("end", end);
				map.put("Hcnt", Hcnt);
				System.out.println("+++++++++++++++++");
				ArrayList<MemberVO> dtos=hDao.sleepMember(map);
				model.addAttribute("dtos", dtos);
				System.out.println("=================================");
				}
				startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
				if (currentPage % pageBlock == 0) {
				startPage -= pageBlock; // (5%3) == 0
				}
				endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6
				if (endPage > pageCount) {
				endPage = pageCount;
				}
				

				model.addAttribute("cnt", cnt);
				model.addAttribute("number", number);
				model.addAttribute("pageNum", pageNum);
				
				if (cnt > 0) {

				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("pageBlock", pageBlock);
				model.addAttribute("pageCount", pageCount);
				model.addAttribute("currentPage", currentPage);
				}

	}

		//휴면회원 처리
		@Override
		public void sleepMemberPro(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			System.out.println("HostServiceImp - sleepMemberPro");
			String url=req.getParameter("reUrl");
			String member_id=req.getParameter("member_id");
			int Hcnt=0;
			System.out.println("=========="+member_id);
			System.out.println(url);
			if(url.equals("sleepMember")) {
				Hcnt=2;
			}else if(url.equals("sleepMemberCancer")) {
				Hcnt=1;
			}else if(url.equals("sleepMemberRetired")) {
				Hcnt=3;
			}else if(url.equals("retireMemberRecuvery")) {
				Hcnt=1;
			}
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("Hcnt", Hcnt);
			map.put("member_id", member_id);
			hDao.sleepMemberPro(map);
		}
		//검색정보
		@Override
		public void memberManagerSerchList(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			System.out.println("HostServiceImp - memberManagerSerchList");
			String sCnt=req.getParameter("sCnt");
			String keyword="";
			if(sCnt.equals("4")) {
				if(req.getParameter("keyword").equals("남자") || req.getParameter("keyword").equals("남")) {
					keyword="1";
				}else {
					keyword="2";
				}
			}else {
				keyword="%"+req.getParameter("keyword")+"%";				
			}
			int Hcnt=0;
			try {
			Hcnt=Integer.parseInt(req.getParameter("Hcnt"));
			}catch(NumberFormatException e) {
				Hcnt=1;
			}
			int cnt=0;
			Map<String,Object> map= new HashMap<String,Object>();
			map.put("sCnt", sCnt);
			map.put("Hcnt", Hcnt);
			map.put("keyword", keyword);
			cnt=hDao.memberManagerSerchListCnt(map);
			if (cnt > 0) {
				model.addAttribute("cnt", cnt);
				ArrayList<MemberVO> dtos=hDao.memberManagerSerchList(map);
				model.addAttribute("dtos", dtos);
				model.addAttribute("serch",1);
				}
			
		}
		//hall정보 인서트
		@Override
		public void insertHall(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			int cnt=0;
			String hall_name=req.getParameter("hall_name"); //홀이름
			String postNum=req.getParameter("postNum"); //우편번호
			String addr=req.getParameter("addr"); //주소
			String detailAddr=req.getParameter("detailAddr"); //상세주소
			String vipSeat=req.getParameter("VIPseat"); //시트
			String rSeat=req.getParameter("Rseat"); //시트
			String sSeat=req.getParameter("Sseat"); //시트
			String aSeat=req.getParameter("Aseat"); //시트
			String bSeat=req.getParameter("Bseat"); //시트
			String seatrow=req.getParameter("seatrow");
			String seatcolumn=req.getParameter("seatcolumn");
			
			String province="";
			String city="";
			String address="";
			String seat_line=seatrow+"_"+seatcolumn;
			String[] addArr=addr.split(" ");
			for(int i=0;i<addArr.length;i++) {
				if(i==0) {
					province=addArr[0];
				}else if(i==1){
					city=addArr[1];
				
			}else {
				address+= i==3 ? addArr[i] : " "+ addArr[i] ;
			}	
		}
		address=address+" "+detailAddr ;
		TcatPerformanceVO vo=new TcatPerformanceVO();
		vo.setProvince(province);
		vo.setCity(city);
		vo.setPostNum(postNum);
		vo.setAddress(address);
		int okCnt=0;
		int place_num=hDao.placeNum();
		vo.setPlace_num(place_num);
		okCnt=hDao.placeInsert(vo);
		if(okCnt==1) {
		vo.setHall_name(hall_name);
		vo.setPlace_num(place_num);
		vo.setVIP_seat(vipSeat);
		vo.setR_seat(rSeat);
		vo.setS_seat(sSeat);
		vo.setA_seat(aSeat);
		vo.setB_seat(bSeat);
		vo.setSeat_line(seat_line);
		
		cnt=hDao.insertHall(vo);
		}
		
			model.addAttribute("cnt",cnt);
			
		}

		@Override
		public void hallDelete(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			System.out.println("HostServiceImp - hallDelete");
			int cnt=0; 
		 //게시판구조
			int pageSize = 10; // 한 페이지당 출력할 글 갯수
			int pageBlock = 3; // 한 블럭당 페이지 갯수
			int start = 0; // 현재 페이지 글시작번호
			int end = 0; // 현재 페이지 글마지막번호
			int number = 0; // 출력할 글번호
			String pageNum = null; // 페이지번호
			int currentPage = 0; // 현재페이지
			int pageCount = 0; // 페이지 갯수
			int startPage = 0; // 시작페이지
			int endPage = 0; // 마지막 페이지
			
			cnt=hDao.hallDeleteCnt();
			System.out.println(cnt);
			model.addAttribute("cnt", cnt);
			pageNum = req.getParameter("pageNum");
			
			if (pageNum == null) {
			pageNum = "1"; // 첫페이지 1페이지로 설정
			}
			currentPage = (Integer.parseInt(pageNum)); // 현재페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
			start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호
			end = start + pageSize - 1; // 현재페이지 끝번호
			if (end > cnt) {
			end = cnt;
			}
			number = cnt - (currentPage - 1) * pageSize;
			if (cnt > 0) {
			// 게시글 목록 조회
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			System.out.println(start);
			System.out.println(end);
			ArrayList<TcatPerformanceVO> dtos=hDao.hallDelete(map);
			model.addAttribute("dtos", dtos);
			System.out.println("=================================");
			}
			startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
			if (currentPage % pageBlock == 0) {
			startPage -= pageBlock; // (5%3) == 0
			}
			endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6
			if (endPage > pageCount) {
			endPage = pageCount;
			}
			

			model.addAttribute("cnt", cnt);
			model.addAttribute("number", number);
			model.addAttribute("pageNum", pageNum);
			
			if (cnt > 0) {

			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
			}

			
			
		}

		//공연장 서치
		@Override
		public void hallSerchList(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			System.out.println("HostServiceImp - hallSerchList");
			String sCnt=req.getParameter("sCnt");
			String keyword="";

				keyword="%"+req.getParameter("keyword")+"%";				
			
			int cnt=0;
			Map<String,Object> map= new HashMap<String,Object>();
			map.put("sCnt", sCnt);
			map.put("keyword", keyword);
			cnt=hDao.hallSerchListCnt(map);
			if (cnt > 0) {
				model.addAttribute("cnt", cnt);
				ArrayList<TcatPerformanceVO> dtos=hDao.hallSerchList(map);
				model.addAttribute("dtos", dtos);
				model.addAttribute("serch",1);
				}
		}

		@Override
		public void hallDeletePro(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			System.out.println("HostServiceImp - hallDeletePro");
			String hall_id=req.getParameter("hall_id");
			String place_num=req.getParameter("place_num");
			Map<String,Object> map= new HashMap<String,Object>();
			map.put("hall_id", hall_id);
			map.put("place_num", place_num);
			int cnt=0;
			cnt=hDao.placeDeletePro(map);
			if(cnt!=0) {
				cnt=hDao.hallDeletePro(map);
			}

		}
		
		//공연장 수정 데이터 가져오기
		@Override
		public void hallModifyDB(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			System.out.println("HostServiceImp - hallDeletePro");
			String hall_id=req.getParameter("hall_id");
			TcatPerformanceVO vo=hDao.hallModifyDB(hall_id);
			model.addAttribute("vo",vo);
		}
		
		@Override
		public void hallModifyUpdate(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			System.out.println("HostServiceImp - hallModifyUpdate");
			int cnt=0;
			String hall_name=req.getParameter("hall_name"); //홀이름
			String postNum=req.getParameter("postNum"); //우편번호
			String addr=req.getParameter("addr"); //주소
			String detailAddr=req.getParameter("detailAddr"); //상세주소
			String vipSeat=req.getParameter("VIPseat"); //시트
			String rSeat=req.getParameter("Rseat"); //시트
			String sSeat=req.getParameter("Sseat"); //시트
			String aSeat=req.getParameter("Aseat"); //시트
			String bSeat=req.getParameter("Bseat"); //시트
			String seatrow=req.getParameter("seatrow");
			String seatcolumn=req.getParameter("seatcolumn");
			int hall_id=Integer.parseInt(req.getParameter("hall_id"));
			int place_num=Integer.parseInt(req.getParameter("place_num"));
			String province="";
			String city="";
			String address="";
			String seat_line=seatrow+"_"+seatcolumn;
			String[] addArr=addr.split(" ");
			for(int i=0;i<addArr.length;i++) {
				if(i==0) {
					province=addArr[0];
				}else if(i==1){
					city=addArr[1];
				
			}else {
				address+= i==3 ? addArr[i] : " "+ addArr[i] ;
			}	
		}
		address=address+" "+detailAddr ;
		TcatPerformanceVO vo=new TcatPerformanceVO();
		vo.setProvince(province);
		vo.setCity(city);
		vo.setPostNum(postNum);
		vo.setAddress(address);
		int okCnt=0;
		vo.setHall_id(hall_id);
		vo.setPlace_num(place_num);
		okCnt=hDao.placeUpdate(vo);
		if(okCnt==1) {
		vo.setHall_name(hall_name);
		vo.setPlace_num(place_num);
		vo.setVIP_seat(vipSeat);
		vo.setR_seat(rSeat);
		vo.setS_seat(sSeat);
		vo.setA_seat(aSeat);
		vo.setB_seat(bSeat);
		vo.setSeat_line(seat_line);
		
		cnt=hDao.hallModifyUpdate(vo);
		}
		
			model.addAttribute("cnt",cnt);
			
		}






		////////////////////////////////////// 18.01.16 명훈
		////////////////////////////////////// 시작//////////////////////////////////////////////////
		// 상품목록 나열
		@Override
		public void productList(HttpServletRequest req, Model model) {
			System.out.println("HostServiceImp - productList");
			// 화면에서 원하는 데이터 호출
			String category = req.getParameter("category"); // 대분류
			String mDev = req.getParameter("mDev"); // 중분류
			String sDev = req.getParameter("sDev"); // 소분류
			String keyword = req.getParameter("keyword"); // 검색어
			System.out.println(category + "/" + mDev + "/" + sDev + "/" + keyword);
			// 널체크
			if (category == null) {
				category = "공연";
			}
			if (mDev != null) {
				if (mDev.equals(""))
					mDev = null;
			}
			if (sDev != null) {
				if (sDev.equals(""))
					sDev = null;
			}
			if (keyword != null) {
				if (keyword.equals(""))
					keyword = null;
			}
			System.out.println(category + "/" + mDev + "/" + sDev + "/" + keyword);
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

			// 담을 바구니 생성
			ArrayList<TcatPerformanceVO> performances = new ArrayList<TcatPerformanceVO>();
			ArrayList<TcatPerDiscVO> discs = new ArrayList<TcatPerDiscVO>();

			// 조건
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("category", category);
			map.put("mDev", mDev);
			map.put("sDev", sDev);
			map.put("keyword", keyword);

			// 갯수
			// 1. 스토어
			if (category.equals("스토어")) {
				productCnt = hDao.storeProductCnt(map);
				System.out.println("store - productCnt: " + productCnt);
				// 보여줄ajax url
				// model.addAttribute("url", "productList_store");
			}
			// 2. 공연
			else {
				map.replace("category", "공연");
				productCnt = hDao.perProductCnt(map);
				System.out.println("productCnt: " + productCnt);
				// 보여줄ajax url
				// model.addAttribute("url", "productList_perf");
			}

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
				// 담기
				if (category.equals("스토어")) {
					discs = hDao.storeProduct(map);
					System.out.println("discs: " + discs.size());
					// req 보내기
					model.addAttribute("discs", discs);
				}
				// 2. 공연
				else {
					performances = hDao.perProduct(map);
					// req 보내기
					model.addAttribute("performances", performances);
				}
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
			}
			// 페이지 카테고리 정보
			model.addAttribute("category", category); // 대분류, 카테고리 전송
			model.addAttribute("mDev", mDev); // 소분류
			model.addAttribute("sDev", sDev); // 대분류
			model.addAttribute("keyword", keyword); // 검색어

		}

		// 공연상품정보가져오기
		@Override
		public void productDetail_perf(HttpServletRequest req, Model model) {
			// 화면에서 보낸 per_id 받기
			int per_id = Integer.parseInt(req.getParameter("per_id"));
			// dao에서 정보가져오기
			TcatPerformanceVO perf = hDao.productDetail_perf(per_id);
			// 띄우기
			model.addAttribute("perf", perf);
		}

		// 스토어상품정보가져오기
		@Override
		public void productDetail_store(HttpServletRequest req, Model model) {
			// 화면에서 보낸 per_id 받기
			int disc_code = Integer.parseInt(req.getParameter("disc_code"));
			// dao에서 정보가져오기
			TcatPerDiscVO disc = hDao.productDetail_store(disc_code);
			// 띄우기
			model.addAttribute("disc", disc);
		}

		// 예매 정보 가져오기
		@Override
		public void orderList(HttpServletRequest req, Model model) {
			System.out.println("HostServiceImp - orderList");
			// 화면에서 원하는 데이터 호출
			String ticket_step = req.getParameter("ticket_step"); // 예매 스텝
			String mDev = req.getParameter("mDev"); // 중분류
			String sDev = req.getParameter("sDev"); // 소분류
			String keyword = req.getParameter("keyword"); // 검색어
			String searchCondition = req.getParameter("searchCondition"); // 검색조건
			System.out.println(ticket_step + "/" + mDev + "/" + sDev + "/" + keyword + "/" + searchCondition);

			// 널체크
			if (ticket_step != null) {
				if (ticket_step.equals(""))
					ticket_step = null;
			}
			if (mDev != null) {
				if (mDev.equals(""))
					mDev = null;
			}
			if (sDev != null) {
				if (sDev.equals(""))
					sDev = null;
			}
			if (keyword != null) {
				if (keyword.equals(""))
					keyword = null;
			}
			if (searchCondition != null) {
				if (searchCondition.equals(""))
					searchCondition = null;
			}
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
			map.put("ticket_step", ticket_step);
			map.put("mDev", mDev);
			map.put("sDev", sDev);
			map.put("keyword", keyword);
			map.put("searchCondition", searchCondition);

			// 갯수
			productCnt = hDao.orderListCnt(map);

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
				ArrayList<TcatTicketingVO> orders = new ArrayList<TcatTicketingVO>();
				orders = hDao.orderList(map);
				model.addAttribute("orders", orders);
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
			}
			// 페이지 카테고리 정보
			model.addAttribute("ticket_step", ticket_step); // 대분류, 카테고리 전송
			model.addAttribute("mDev", mDev); // 소분류
			model.addAttribute("sDev", sDev); // 대분류
			model.addAttribute("keyword", keyword); // 검색어
			model.addAttribute("searchCondition", searchCondition);
			System.out.println(ticket_step + "/" + mDev + "/" + sDev);

		}

		// 스토어 구매리스트
		@Override
		public void orderList_store(HttpServletRequest req, Model model) {
			System.out.println("HostServiceImp - orderList_store");
			// 화면에서 원하는 데이터 호출
			String disc_buyStep = req.getParameter("disc_buyStep"); // 구매스텝
			String mDev = req.getParameter("mDev"); // 중분류
			String sDev = req.getParameter("sDev"); // 소분류
			String keyword = req.getParameter("keyword"); // 검색어
			String searchCondition = req.getParameter("searchCondition"); // 검색조건
			System.out.println(disc_buyStep + "/" + mDev + "/" + sDev + "/" + keyword + "/" + searchCondition);

			// 널체크
			if (disc_buyStep != null) {
				if (disc_buyStep.equals(""))
					disc_buyStep = null;
			}
			if (mDev != null) {
				if (mDev.equals(""))
					mDev = null;
			}
			if (sDev != null) {
				if (sDev.equals(""))
					sDev = null;
			}
			if (keyword != null) {
				if (keyword.equals(""))
					keyword = null;
			}
			if (searchCondition != null) {
				if (searchCondition.equals(""))
					searchCondition = null;
			}
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
			map.put("disc_buyStep", disc_buyStep);
			map.put("mDev", mDev);
			map.put("sDev", sDev);
			map.put("keyword", keyword);
			map.put("searchCondition", searchCondition);

			// 갯수
			productCnt = hDao.orderList_storeCnt(map);
			System.out.println("스토어 구매 갯수: " + productCnt);

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
				ArrayList<TcatDiscBuyVO> orders = new ArrayList<TcatDiscBuyVO>();
				orders = hDao.orderList_store(map);
				System.out.println("스토어 구매 갯수: " + orders.size());
				model.addAttribute("orders", orders);
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
			}
			// 페이지 카테고리 정보
			model.addAttribute("disc_buyStep", disc_buyStep); // 대분류, 카테고리 전송
			model.addAttribute("mDev", mDev); // 소분류
			model.addAttribute("sDev", sDev); // 대분류
			model.addAttribute("keyword", keyword); // 검색어
			model.addAttribute("searchCondition", searchCondition);
			System.out.println(disc_buyStep + "/" + mDev + "/" + sDev +"/"+searchCondition+"/"+disc_buyStep+"/"+keyword);
		}
		////////////////////////////////////// 18.01.16 명훈
		////////////////////////////////////// 끝//////////////////////////////////////////////////

		////////////////////////////////////// 18.01. 명훈 시작
		////////////////////////////////////// 미완//////////////////////////////////////////////////
		@Override
		public void productRank_perf(HttpServletRequest req, Model model) {
			// 기본값 세팅
			String showNum = (String) req.getParameter("showNum");
			System.out.println("showNum: " + showNum);
			int productNum = 0;
			if (showNum == null) {
				productNum = 10; // 처음 10개 보여줌
			} else {
				productNum = Integer.parseInt(showNum) + 10;
			}
			// 갯수
			int allcnt = hDao.getProductRank_perfCnt();
			System.out.println("allcnt: " + allcnt);
			// ticket_step 중 1~5 번을 가진 공연의 갯수로 오더
			if (allcnt < productNum)
				productNum = allcnt; // 더보기 시 리스트 양보다 많으면 리스트 갯수까지만 출력
			System.out.println("productNum: " + productNum);

			// 가져오기
			ArrayList<ProductRankVO> ranks = hDao.productRank_perf(productNum);
			System.out.println("ranks: " + ranks.size());
			// 띄우기

			model.addAttribute("ranks", ranks); // 리스트
			model.addAttribute("productNum", productNum); // 보여줄 리스트 갯수
			model.addAttribute("allCnt", allcnt); // 총 리스트 갯수
		}

		// 스토어 판매량
		public void productRank_store(HttpServletRequest req, Model model) {
			// 기본값 세팅
			String showNum = (String) req.getParameter("showNum");
			System.out.println("showNum: " + showNum);
			int productNum = 0;
			if (showNum == null) {
				productNum = 10; // 처음 10개 보여줌
			} else {
				productNum = Integer.parseInt(showNum) + 10;
			}
			// 갯수
			int allcnt = hDao.getProductRank_storeCnt();
			System.out.println("allcnt: " + allcnt);
			// ticket_step 중 1~5 번을 가진 공연의 갯수로 오더
			if (allcnt < productNum)
				productNum = allcnt; // 더보기 시 리스트 양보다 많으면 리스트 갯수까지만 출력
			System.out.println("productNum: " + productNum);

			// 가져오기
			ArrayList<ProductRankVO> ranks = hDao.productRank_store(productNum);
			System.out.println("ranks: " + ranks.size());
			// 띄우기

			model.addAttribute("ranks", ranks); // 리스트
			model.addAttribute("productNum", productNum); // 보여줄 리스트 갯수
			model.addAttribute("allCnt", allcnt); // 총 리스트 갯수
		}

		// 공연 카테고리
		public void categoryRank_perf(HttpServletRequest req, Model model) {
			// 기본값
			String mDev = null;
			// 중분류별 판매 랭킹
			// 뮤지컬,콘서트,연극,클래식
			ArrayList<ProductRankVO> mDevs = hDao.mDevRank();
			model.addAttribute("mDevs", mDevs);
			// 소분류별 판매 랭킹 parameter-> mDev
			// 뮤지컬 - "라이선스","오리지널","창작","넌버벌 퍼포먼스"
			mDev = "뮤지컬";
			ArrayList<ProductRankVO> musicals = hDao.sDevRank(mDev);
			// 콘서트 - "국내뮤지션","해외뮤지션","페스티벌"
			mDev = "콘서트";
			ArrayList<ProductRankVO> concerts = hDao.sDevRank(mDev);
			// 연극 - "대학로","기타"
			mDev = "연극";
			ArrayList<ProductRankVO> dramas = hDao.sDevRank(mDev);
			// 클래식 - "클래식","발레/무용","국악"
			mDev = "클래식";
			ArrayList<ProductRankVO> classics = hDao.sDevRank(mDev);
			// 띄우기
			model.addAttribute("musicals", musicals);
			model.addAttribute("concerts", concerts);
			model.addAttribute("dramas", dramas);
			model.addAttribute("classics", classics);
		}

		// 스토어 카테고리 분석
		@Override
		public void categoryRank_store(HttpServletRequest req, Model model) {
			// 기본값
			String mDev = null;
			// 중분류별 판매 랭킹
			// 음반 컬렉션
			ArrayList<ProductRankVO> mDevs = hDao.mDevRank_store();
			model.addAttribute("mDevs", mDevs);
			// 소분류별 판매 랭킹 parameter-> mDev
			// 음반 - 뮤지컬OST 콘서트LIVE 클래식LIVE
			mDev = "음반";
			ArrayList<ProductRankVO> musics = hDao.sDevRank_store(mDev);
			// 컬렉션 - 전시컬렉션
			mDev = "컬렉션";
			ArrayList<ProductRankVO> collections = hDao.sDevRank_store(mDev);
			// 띄우기
			model.addAttribute("musics", musics);
			model.addAttribute("collections", collections);
		}

		// returnRank_perf 환불 승인 랭크
		public void returnRank_perf(HttpServletRequest req, Model model) {
			// 기본값 세팅
			String showNum = (String) req.getParameter("showNum");
			System.out.println("showNum: " + showNum);
			int productNum = 0;
			if (showNum == null) {
				productNum = 10; // 처음 10개 보여줌
			} else {
				productNum = Integer.parseInt(showNum) + 10;
			}
			// 갯수
			int allcnt = hDao.returnRank_perfCnt();

			System.out.println("allcnt: " + allcnt);
			// ticket_step 중 1~5 번을 가진 공연의 갯수로 오더
			if (allcnt < productNum)
				productNum = allcnt; // 더보기 시 리스트 양보다 많으면 리스트 갯수까지만 출력
			System.out.println("productNum: " + productNum);

			// 가져오기
			ArrayList<ProductRankVO> ranks = hDao.returnRank_perf(productNum);
			System.out.println("ranks: " + ranks.size());
			// 띄우기

			model.addAttribute("ranks", ranks); // 리스트
			model.addAttribute("productNum", productNum); // 보여줄 리스트 갯수
			model.addAttribute("allCnt", allcnt); // 총 리스트 갯수
		}

		// 스토어 환불 승인
		public void returnRank_store(HttpServletRequest req, Model model) {
			// 기본값 세팅
			String showNum = (String) req.getParameter("showNum");
			System.out.println("showNum: " + showNum);
			int productNum = 0;
			if (showNum == null) {
				productNum = 10; // 처음 10개 보여줌
			} else {
				productNum = Integer.parseInt(showNum) + 10;
			}
			// 갯수
			int allcnt = hDao.returnRank_storeCnt();

			System.out.println("allcnt: " + allcnt);
			// ticket_step 중 1~5 번을 가진 공연의 갯수로 오더
			if (allcnt < productNum)
				productNum = allcnt; // 더보기 시 리스트 양보다 많으면 리스트 갯수까지만 출력
			System.out.println("productNum: " + productNum);

			// 가져오기
			ArrayList<ProductRankVO> ranks = hDao.returnRank_store(productNum);
			System.out.println("ranks: " + ranks.size());
			// 띄우기

			model.addAttribute("ranks", ranks); // 리스트
			model.addAttribute("productNum", productNum); // 보여줄 리스트 갯수
			model.addAttribute("allCnt", allcnt); // 총 리스트 갯수
		}
		@Override
		// 장바구니 분석
		public void cartRank(HttpServletRequest req, Model model) {
			// 기본값 세팅
			String showNum = (String) req.getParameter("showNum");
			System.out.println("showNum: " + showNum);
			int productNum = 0;
			if (showNum == null) {
				productNum = 10; // 처음 10개 보여줌
			} else {
				productNum = Integer.parseInt(showNum) + 10;
			}
			// 갯수
			int allcnt = hDao.cartRankCnt();

			System.out.println("allcnt: " + allcnt);
			// ticket_step 중 1~5 번을 가진 공연의 갯수로 오더
			if (allcnt < productNum)
				productNum = allcnt; // 더보기 시 리스트 양보다 많으면 리스트 갯수까지만 출력
			System.out.println("productNum: " + productNum);
			// 가져오기
			ArrayList<ProductRankVO> ranks = hDao.cartRank(productNum);
			System.out.println("ranks: " + ranks.size());
			// 띄우기
			model.addAttribute("ranks", ranks); // 리스트
			model.addAttribute("productNum", productNum); // 보여줄 리스트 갯수
			model.addAttribute("allCnt", allcnt); // 총 리스트 갯수
		}
		//위시리스트
		public void wishListRank_perf(HttpServletRequest req, Model model) {
			// 기본값 세팅
			String showNum = (String) req.getParameter("showNum");
			System.out.println("showNum: " + showNum);
			int productNum = 0;
			if (showNum == null) {
				productNum = 10; // 처음 10개 보여줌
			} else {
				productNum = Integer.parseInt(showNum) + 10;
			}
			// 갯수
			int allcnt = hDao.wishListRank_perfCnt();

			System.out.println("allcnt: " + allcnt);
			// ticket_step 중 1~5 번을 가진 공연의 갯수로 오더
			if (allcnt < productNum)
				productNum = allcnt; // 더보기 시 리스트 양보다 많으면 리스트 갯수까지만 출력
			System.out.println("productNum: " + productNum);
			// 가져오기
			ArrayList<ProductRankVO> ranks = hDao.wishListRank_perf(productNum);
			System.out.println("ranks: " + ranks.size());
			// 띄우기
			model.addAttribute("ranks", ranks); // 리스트
			model.addAttribute("productNum", productNum); // 보여줄 리스트 갯수
			model.addAttribute("allCnt", allcnt); // 총 리스트 갯수
		}
		//위시리스트 스토어
		public void wishListRank_store(HttpServletRequest req, Model model) {
			// 기본값 세팅
			String showNum = (String) req.getParameter("showNum");
			System.out.println("showNum: " + showNum);
			int productNum = 0;
			if (showNum == null) {
				productNum = 10; // 처음 10개 보여줌
			} else {
				productNum = Integer.parseInt(showNum) + 10;
			}
			// 갯수
			int allcnt = hDao.wishListRank_storeCnt();

			System.out.println("allcnt: " + allcnt);
			// ticket_step 중 1~5 번을 가진 공연의 갯수로 오더
			if (allcnt < productNum)
				productNum = allcnt; // 더보기 시 리스트 양보다 많으면 리스트 갯수까지만 출력
			System.out.println("productNum: " + productNum);
			// 가져오기
			ArrayList<ProductRankVO> ranks = hDao.wishListRank_store(productNum);
			System.out.println("ranks: " + ranks.size());
			// 띄우기
			model.addAttribute("ranks", ranks); // 리스트
			model.addAttribute("productNum", productNum); // 보여줄 리스트 갯수
			model.addAttribute("allCnt", allcnt); // 총 리스트 갯수
		}

		////////////////////////////////////// 18.01.15 명훈
		////////////////////////////////////// 끝//////////////////////////////////////////////////







		/////////////////////////////////// 태성 1/9 start
		/////////////////////////////////// /////////////////////////////////////////
		// HOST//상품관리//카테고리별 상품진열관리
		@Override
		public void categoryList(HttpServletRequest req, Model model) {

			int pageSize = 5; // 한 페이지당 출력할 글 개수
			int pageBlock = 3; // 한 블럭당 페이지 개수

			int cnt = 0; // 글 개수
			int start = 0; // 현재 페이지 글시작번호
			int end = 0; // 현재 페이지 글마지막 번호
			int number = 0; // 출력할 글 번호
			String pageNum = null; // 페이지 번호
			int currentPage = 0; // 현재 페이지

			int pageCount = 0; // 페이지 개수
			int startPage = 0; // 시작 페이지
			int endPage = 0; // 마지막 페이지
			int Hcnt = 0;
			String sDev = "";
			String keyword = "";
			// 검색추가(01/16)-------------------

			sDev = req.getParameter("sDev");
			System.out.println("sDev -----> :" + sDev);

			keyword = req.getParameter("keyword");
			System.out.println("keyword -----> :" + keyword);

			String category = "";

			if (sDev == null) {
				sDev = "0";
			}

			if (keyword == null) {
				keyword = "";
			}

			try {
				category = req.getParameter("category");
			} catch (Exception e) {

			}
			if (category == null) {
				category = "뮤지컬";
			}
			System.out.println("Host 서비스 첫번째 출입니다. ");
			if (category.equals("뮤지컬")) {
				Hcnt = 1;
			} else if (category.equals("연극")) {
				Hcnt = 2;
			} else if (category.equals("콘서트")) {
				Hcnt = 3;
			} else if (category.equals("스토어")) {
				Hcnt = 4;
			}

			HostDAO hDao = new HostDAOImp();
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("Hcnt", category); // category에서 보낸 cnt값
			map.put("keyword", keyword);
			map.put("sDev", sDev);
			System.out.println("category" + category + "\n" + "keyword" + map.get("keyword") + "\n" + "sDev" + sDev);

			if (category.equals("스토어")) {
				cnt = hDao.getStore(map);
			} else {
				cnt = hDao.getCate(map);
			}

			System.out.println("cnt :" + cnt);
			pageNum = req.getParameter("pageNum");
			System.out.println("pageNum" + pageNum);

			if (pageNum == null) {
				pageNum = "1"; // 첫페이지를 1페이지로 설정
			}
			System.out.println("pageNum+Host service --> categoryList-->: " + pageNum);
			currentPage = (Integer.parseInt(pageNum)); // 현재 페이지

			// pageCnt = 12 / 5 + 1 // 나머지 2건이 1페이지로 할당되므로 3페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 개수 + 나머지

			// 1 = (1-1) * 5 + 1
			// 6 = (2-1) * 5 + 1
			// 11 = (3-1) * 5 + 1
			// 21 = (5-1) * 5 + 1
			start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호

			// 5 = 1 + 5 - 1;
			// 10 = 6 + 5 - 1;
			// 21 = 17 + 5 - 1;
			end = start + pageSize - 1; // 현재페이지 끝번호

			System.out.println("start : " + start);
			System.out.println("end : " + end);

			if (end > cnt)
				end = cnt;

			// 1 = 25 - (5-1) * 5;
			number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호..최신글(큰페이지)가 1p

			System.out.println("number : " + number);
			System.out.println("cnt : " + cnt);
			System.out.println("currentPage : " + currentPage);
			System.out.println("pageSize : " + currentPage);

			if (cnt > 0) {
				/* Map<String, Object> map = new HashMap<String, Object>(); */
				map.put("start", start);
				map.put("end", end);
				System.out.println("end !!!!!!!!!----->:" + end);
				/*
				 * map.put("Hcnt", category); // category에서 보낸 cnt값 map.put("mdev", mDev);
				 * map.put("keyword", keyword);
				 */

				// 표 목록 조회
				System.out.println("map" + map.get("start"));
				ArrayList<TcatPerformanceVO> dtos = hDao.getArticleList(map);
				req.setAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf)작은 바구니 : 게시글 1건
				try {
					System.out.println("****************" + dtos.get(0).getPer_id());
				} catch (Exception e) {

				}
			}

			startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
			if (currentPage % pageBlock == 0)
				startPage -= pageBlock; // (5%3) == 0

			endPage = startPage + pageBlock - 1;// 4+3-1=6
			if (endPage > pageCount)
				endPage = pageCount;

			System.out.println("category=" + category);

			model.addAttribute("sDev", sDev);
			model.addAttribute("keyword",keyword);
			model.addAttribute("category", category); // cnt == 글 개수
			model.addAttribute("Hcnt", Hcnt); // cnt == 글 개수
			model.addAttribute("cnt", cnt); // cnt == 글 개수
			model.addAttribute("number", number); // number == 글번호
			model.addAttribute("pageNum", pageNum); // pageNum 페이지 번호

			if (cnt > 0) {
				model.addAttribute("startPage", startPage); // startPage 시작페이지
				model.addAttribute("endPage", endPage); // 마지막 페이지
				model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 개수
				model.addAttribute("pageCount", pageCount); // 페이지 개수
				model.addAttribute("currentPage", currentPage); // 현재 페이지

			}
		}

		//////////////////////////////////// 태성 1/9 end/ ///////////////////////////////

		/////////////////////////////////// 태성 1/10 start /////////////////////////////
		// 우선순위 변경페이지
		@Override
		public void updateGrade(HttpServletRequest req, Model model) {
			System.out.println("우선순위 업데이트 시작");

			String first_grade = req.getParameter("first_grade");
			String category = req.getParameter("category");
			System.out.println(category + "======================");

			System.out.println("!!!!!!!first_grade!!!!!!-->" + first_grade);
			Map<String, String> map = new HashMap<String, String>();
			if (category.equals("스토어")) {
				String disc_code = req.getParameter("disc_code");
				System.out.println("disc_code==> :" + disc_code);
				map.put("first_grade", first_grade);
				map.put("disc_code", disc_code);
				hDao.Sfirst_grade(map);

			} else {
				String id = req.getParameter("id");
				System.out.println("id==> :" + id);
				map.put("first_grade", first_grade);
				map.put("id", id);
				hDao.Cfirst_grade(map);

			}
			model.addAttribute("category", category);
			model.addAttribute("first_grade", first_grade);
			System.out.println("first_grade22222" + first_grade);

		}

		// 스텝 변경페이지
		@Override
		public void changeStep(HttpServletRequest req, Model model) {
			System.out.println("스텝변경 업데이트 시작");

			String per_step = req.getParameter("per_step");
			String category = req.getParameter("category");
			String disc_step = req.getParameter("disc_step");

			System.out.println(category + "======================");

			System.out.println("HostServiceImp!!!!!!!per_step!!!!!!-->" + per_step);
			System.out.println("HostServiceImp!!!!!!!disc_step!!!!!!-->" + disc_step);

			Map<String, String> map = new HashMap<String, String>();
			if (category.equals("스토어")) {
				String disc_code = req.getParameter("disc_code");
				System.out.println("HostServiceImp-> disc_code==> :" + disc_code);
				map.put("disc_step", disc_step);
				map.put("disc_code", disc_code);
				hDao.Sstep(map);

			} else {
				String id = req.getParameter("id");
				System.out.println("HostServiceImp-> id==> :" + id);
				map.put("per_step", per_step);
				map.put("id", id);
				hDao.Cstep(map);

			}
			model.addAttribute("category", category);
			model.addAttribute("per_step", per_step);
			model.addAttribute("disc_step", disc_step);

		}
		/////////////////////////////////// 태성 1/10 end/////////////////////////////////// 

		

		/////////////////////// 태성 1/12 start ///////////////////////////
		@Override
		public void stockManagementList(HttpServletRequest req, Model model) {
			int pageSize = 5; // 한 페이지당 출력할 글 개수
			int pageBlock = 3; // 한 블럭당 페이지 개수

			int cnt = 0; // 글 개수
			int start = 0; // 현재 페이지 글시작번호
			int end = 0; // 현재 페이지 글마지막 번호
			int number = 0; // 출력할 글 번호
			String pageNum = null; // 페이지 번호
			int currentPage = 0; // 현재 페이지

			int pageCount = 0; // 페이지 개수
			int startPage = 0; // 시작 페이지
			int endPage = 0; // 마지막 페이지
			int Hcnt = 0;

			String sDev = "";
			String keyword = "";
			// 검색추가(01/16)-------------------

			sDev = req.getParameter("sDev");
			System.out.println("sDev -----> :" + sDev);

			keyword = req.getParameter("keyword");
			System.out.println("keyword -----> :" + keyword);

			String category = "";

			if (sDev == null) {
				sDev = "0";
			}

			if (keyword == null) {
				keyword = "";
			}

			try {
				category = req.getParameter("category");
			} catch (Exception e) {

			}
			if (category == null) {
				category = "스토어";
			}
			if (category.equals("스토어")) {
				Hcnt = 4;
			}

			System.out.println("Host 서비스 stockManagement_List 첫번째 줄입니다. ");
			HostDAO hDao = new HostDAOImp();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("Hcnt", category); // category에서 보낸 cnt값
			map.put("keyword", keyword);
			map.put("sDev", sDev);

			System.out.println("Hcnt:" + Hcnt);

			cnt = hDao.stockStore(map);

			System.out.println("cnt :" + cnt);
			pageNum = req.getParameter("pageNum");
			System.out.println("pageNum" + pageNum);

			if (pageNum == null) {
				pageNum = "1"; // 첫페이지를 1페이지로 설정
			}
			System.out.println("pageNum----->" + pageNum);
			currentPage = (Integer.parseInt(pageNum)); // 현재 페이지

			// pageCnt = 12 / 5 + 1 // 나머지 2건이 1페이지로 할당되므로 3페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 개수 + 나머지

			// 1 = (1-1) * 5 + 1
			// 6 = (2-1) * 5 + 1
			// 11 = (3-1) * 5 + 1
			// 21 = (5-1) * 5 + 1
			start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호

			// 5 = 1 + 5 - 1;
			// 10 = 6 + 5 - 1;
			// 21 = 17 + 5 - 1;
			end = start + pageSize - 1; // 현재페이지 끝번호

			System.out.println("start : " + start);
			System.out.println("end : " + end);

			if (end > cnt)
					end = cnt;

			// 1 = 25 - (5-1) * 5;
			number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호..최신글(큰페이지)가 1p

			System.out.println("number : " + number);
			System.out.println("cnt : " + cnt);
			System.out.println("currentPage : " + currentPage);
			System.out.println("pageSize : " + currentPage);

			if (cnt > 0) {
				map.put("start", start);
				map.put("end", end);

				// 표 목록 조회
				System.out.println("123456789map123456789" + map.get("start"));
				ArrayList<TcatPerDiscVO> dtos = hDao.stockManageListstore(map);
				req.setAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf)작은 바구니 : 게시글 1건
		}

			startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
			if (currentPage % pageBlock == 0)
				startPage -= pageBlock; // (5%3) == 0

			endPage = startPage + pageBlock - 1;// 4+3-1=6
			if (endPage > pageCount)
				endPage = pageCount;

			model.addAttribute("sDev", sDev);
			model.addAttribute("keyword",keyword);
			model.addAttribute("category", category); // cnt == 글 개수
			model.addAttribute("Hcnt", Hcnt); // cnt == 글 개수
			model.addAttribute("cnt", cnt); // cnt == 글 개수
			model.addAttribute("number", number); // number == 글번호
			model.addAttribute("pageNum", pageNum); // pageNum 페이지 번호

			if (cnt > 0) {
				model.addAttribute("startPage", startPage); // startPage 시작페이지
				model.addAttribute("endPage", endPage); // 마지막 페이지
				model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 개수
				model.addAttribute("pageCount", pageCount); // 페이지 개수
				model.addAttribute("currentPage", currentPage); // 현재 페이지
			}
		}
		/////////////////////// 태성 1/12 end ///////////////////////////

		@Override
		public void stockManagementClickList(HttpServletRequest req, Model model) {
			int pageSize = 1; // 한 페이지당 출력할 글 개수
			int pageBlock = 1; // 한 블럭당 페이지 개수

			int cnt = 0; // 글 개수
			int start = 0; // 현재 페이지 글시작번호
			int end = 0; // 현재 페이지 글마지막 번호
			int number = 0; // 출력할 글 번호
			String pageNum = null; // 페이지 번호
			int currentPage = 0; // 현재 페이지

			int pageCount = 0; // 페이지 개수
			int startPage = 0; // 시작 페이지
			int endPage = 0; // 마지막 페이지
			int disc_code = Integer.parseInt(req.getParameter("disc_code"));

			System.out.println("Host 서비스 stockManagement_List 첫번째 줄입니다. ");
			System.out.println("disc_code---->!!!! : " + disc_code);

			cnt = hDao.clickStockCnt(disc_code);

			System.out.println("cnt :" + cnt);
			pageNum = req.getParameter("pageNum");
			System.out.println("pageNum" + pageNum);

			if (pageNum == null) {
				pageNum = "1"; // 첫페이지를 1페이지로 설정
			}
			System.out.println("pageNum----->" + pageNum);
			currentPage = (Integer.parseInt(pageNum)); // 현재 페이지

			// pageCnt = 12 / 5 + 1 // 나머지 2건이 1페이지로 할당되므로 3페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 개수 + 나머지

			// 1 = (1-1) * 5 + 1
			// 6 = (2-1) * 5 + 1
			// 11 = (3-1) * 5 + 1
			// 21 = (5-1) * 5 + 1
			start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호

			// 5 = 1 + 5 - 1;
			// 10 = 6 + 5 - 1;
			// 21 = 17 + 5 - 1;
			end = start + pageSize - 1; // 현재페이지 끝번호

			System.out.println("start : " + start);
			System.out.println("end : " + end);

			if (end > cnt)
				end = cnt;

			// 1 = 25 - (5-1) * 5;
			number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호..최신글(큰페이지)가 1p

			System.out.println("number : " + number);
			System.out.println("cnt : " + cnt);
			System.out.println("currentPage : " + currentPage);
			System.out.println("pageSize : " + currentPage);

			if (cnt > 0) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("start", start);
				map.put("end", end);
				map.put("disc_code", disc_code);

				// 표 목록 조회
				ArrayList<TcatPerDiscVO> dtos = hDao.clickStockList(map);

				req.setAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf)작은 바구니 : 게시글 1건
			}

			startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
			if (currentPage % pageBlock == 0)
				startPage -= pageBlock; // (5%3) == 0

			endPage = startPage + pageBlock - 1;// 4+3-1=6
			if (endPage > pageCount)
				endPage = pageCount;
			model.addAttribute("disc_code", disc_code);
			model.addAttribute("cnt", cnt); // cnt == 글 개수
			model.addAttribute("number", number); // number == 글번호
			model.addAttribute("pageNum", pageNum); // pageNum 페이지 번호

			if (cnt > 0) {
				model.addAttribute("startPage", startPage); // startPage 시작페이지
				model.addAttribute("endPage", endPage); // 마지막 페이지
				model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 개수
				model.addAttribute("pageCount", pageCount); // 페이지 개수
				model.addAttribute("currentPage", currentPage); // 현재 페이지
			}
		}
		// 재고 수정
		@Override
		public void updateStock(HttpServletRequest req, Model model) {
			System.out.println("재고  업데이트 시작");

			int disc_code = Integer.parseInt(req.getParameter("disc_code"));
			int disc_count = Integer.parseInt(req.getParameter("disc_count"));

			System.out.println("disc_code---->" + disc_code);
			System.out.println("disc_count---->" + disc_count);

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("disc_code", disc_code);
			map.put("disc_count", disc_count);

			hDao.updateStock(map);

			model.addAttribute("disc_code", disc_code);
			model.addAttribute("disc_count", disc_count);
		}



		//////////////////////////////////// 현석 1/11////////////////////////////////////

			// 공연정보 가져오기
			@Override
			public void performanceList(HttpServletRequest req, Model model) {
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

				cnt = hDao.performanceCnt();
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
					Map<String, Integer> map = new HashMap<String, Integer>();
					map.put("start", start);
					map.put("end", end);
					ArrayList<TcatPerformanceVO> dtos = hDao.performanceList(map);
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
				// 카테고리 목록 가져오기
				ArrayList<CategoryVO> SDtos = hDao.cateList();
				
				
				// 공연지역 가져오기
				ArrayList<SelectHellInfoVO> HDtos = hDao.HellList();

				req.setAttribute("SDtos", SDtos);
				req.setAttribute("HDtos", HDtos);

			}

			@Override
			public void performanceInsert(MultipartHttpServletRequest req, Model model) {
				
				MultipartFile file = req.getFile("perf_Image");

				String realDir = "E:\\Team_project\\projectGit\\tcat\\SPRING_Project_TCAT\\src\\main\\webapp\\resources\\image\\performance\\";
				String saveDir = req.getRealPath("/resources/image/performance/");
				try {

					file.transferTo(new File(saveDir + file.getOriginalFilename()));
					FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
					FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

					int data = 0;

					while ((data = fis.read()) != -1) {
						fos.write(data);
					}
					fis.close();
					fos.close();

					String perf_title = req.getParameter("perf_title");
					int cateNum = Integer.parseInt(req.getParameter("cateNum"));
					String perf_Image = file.getOriginalFilename();
					String startDate = req.getParameter("startDate");
					String endDate = req.getParameter("endDate");
					int hall_id = Integer.parseInt(req.getParameter("hall_id"));
					String first_grade = req.getParameter("first_grade");
					String remain_round = req.getParameter("remain_round");
					int possible_age = Integer.parseInt(req.getParameter("possible_age"));
					int VIP_seatPrice=Integer.parseInt(req.getParameter("VIP_seatPrice"));
					int R_seatPrice=Integer.parseInt(req.getParameter("R_seatPrice"));
					int S_seatPrice=Integer.parseInt(req.getParameter("S_seatPrice"));
					int A_seatPrice=Integer.parseInt(req.getParameter("A_seatPrice"));
					int B_seatPrice=Integer.parseInt(req.getParameter("B_seatPrice"));
					
					String sDate[] = startDate.split("/");
					startDate = sDate[2] + "/" + sDate[0] + "/" + sDate[1];
					String eDate[] = endDate.split("/");
					endDate = eDate[2] + "/" + eDate[0] + "/" + eDate[1];

					Map<String, Object> map = new HashMap<String, Object>();
					map.put("perf_title", perf_title);
					map.put("cateNum", cateNum);
					map.put("perf_Image", perf_Image);
					map.put("startDate", startDate);
					map.put("endDate", endDate);
					map.put("hall_id", hall_id);
					map.put("first_grade", first_grade);
					map.put("remain_round", remain_round);
					map.put("possible_age", possible_age);
					map.put("VIP_seatPrice", VIP_seatPrice);
					map.put("R_seatPrice", R_seatPrice);
					map.put("S_seatPrice", S_seatPrice);
					map.put("A_seatPrice", A_seatPrice);
					map.put("B_seatPrice", B_seatPrice);
					
					System.out.println("=======================================\n" + "perf_title=" + map.get("perf_title")
							+ "\n" + "cateNum=" + map.get("cateNum") + "\n" + "perf_Image=" + map.get("perf_Image") + "\n"
							+ "startDate=" + map.get("startDate") + "\n" + "endDate=" + map.get("endDate") + "\n" + "hall_id="
							+ map.get("hall_id") + "\n" + "first_grade=" + map.get("first_grade") + "\n" + "remain_round="
							+ map.get("remain_round") + "\n" + "possible_age=" + map.get("possible_age") + "\n"
							+ "=======================================\n");
					hDao.insertPerformance(map);

					int detail_num = hDao.SearchDetail_num();
					hDao.insertDetailP_DEFAULT(detail_num);

					
				} catch (Exception e) {
					e.printStackTrace();
					int error=1;
					req.setAttribute("error", error);
				}

			}

			@Override
			public void storeList(HttpServletRequest req, Model model) {
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

				cnt = hDao.perDiscCnt();
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
					ArrayList<TcatPerDiscVO> dtos = hDao.perDiscList(map);
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
				// 카테고리 목록 가져오기
				ArrayList<CategoryVO> SDtos = hDao.cateListStore();

				req.setAttribute("SDtos", SDtos);
			}

			@Override
			public void insertStore(MultipartHttpServletRequest req, Model model) {
				MultipartFile file = req.getFile("disc_image");

				String realDir = "E:\\Team_project\\projectGit\\tcat\\SPRING_Project_TCAT\\src\\main\\webapp\\resources\\image\\store\\";
				String saveDir = req.getRealPath("/resources/image/store/");
				try {

					file.transferTo(new File(saveDir + file.getOriginalFilename()));

					FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
					FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

					int data = 0;

					while ((data = fis.read()) != -1) {
						fos.write(data);
					}
					fis.close();
					fos.close();

					TcatPerDiscVO dto = new TcatPerDiscVO();

					String disc_title = req.getParameter("disc_title");
					int disc_price = Integer.parseInt(req.getParameter("disc_price"));
					String disc_image = file.getOriginalFilename();
					String disc_con = req.getParameter("disc_con");
					int cateNum = Integer.parseInt(req.getParameter("cateNum"));
					String first_grade = req.getParameter("first_grade");
					String disc_step = "1";
					int disc_count = Integer.parseInt(req.getParameter("disc_count"));

					dto.setDisc_title(disc_title);
					dto.setDisc_price(disc_price);
					dto.setDisc_image(disc_image);
					dto.setDisc_con(disc_con);
					dto.setDisc_count(disc_count);
					dto.setCateNum(cateNum);
					dto.setFirst_grade(first_grade);
					dto.setDisc_step(disc_step);

					System.out.println("==================================\n" + "disc_code : " + dto.getDisc_code() + "\n"
							+ "disc_title : " + dto.getDisc_title() + "\n" + "disc_price : " + dto.getDisc_price() + "\n"
							+ "disc_image : " + dto.getDisc_image() + "\n" + "disc_con : " + dto.getDisc_con() + "\n"
							+ "sale_div : " + dto.getDisc_count() + "\n" + "cateNum : " + dto.getCateNum() + "\n"
							+ "first_grade : " + dto.getFirst_grade() + "\n" + "disc_step : " + dto.getDisc_step() + "\n"
							+ "==================================\n");
					hDao.insertStore(dto);

				} catch (Exception e) {
					e.printStackTrace();
					int error=1;
					req.setAttribute("error2", error);
				}

			}

			// 2018-01-15---------------------------------------------------------------
			// 고객 리스트 가져오기
			@Override
			public void member_list(HttpServletRequest req, Model model) {
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

				cnt = hDao.member_cnt();
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
					ArrayList<MemberVO> dtos = hDao.member_list(map);
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
			//상세 고객정보 가져오기
			@Override
			public void detailMember(HttpServletRequest req, Model model) {
				String member_id=req.getParameter("member_id");
				MemberVO dto=new MemberVO();
				dto=hDao.detailMember(member_id);
				
				req.setAttribute("dto", dto);		
			}
			
			//고객정보 수정
			@Override
			public void detailMember_update(HttpServletRequest req, Model model) {
				String member_id=req.getParameter("member_id");
				String member_pwd=req.getParameter("member_pwd");
				String member_hp=req.getParameter("member_hp");
				String member_email=req.getParameter("member_email");
				String member_name=req.getParameter("member_name");
				String rating =req.getParameter("Rating");
				int point =Integer.parseInt(req.getParameter("point"));
				String member_addr=req.getParameter("member_addr");
				
				MemberVO dto=new MemberVO();
				dto.setMember_id(member_id);
				dto.setMember_pwd(member_pwd);
				dto.setMember_hp(member_hp);
				dto.setMember_email(member_email);
				dto.setMember_name(member_name);
				dto.setRating(rating);
				dto.setPoint(point);
				dto.setMember_addr(member_addr);
				System.out.println(dto.getMember_id());
				int cnt=hDao.detailMember_update(dto);
				
				req.setAttribute("cnt", cnt);
			}
			//호스트 이메일 체크
			@Override
			public void emailCheack(HttpServletRequest req, Model model) {
				String email = req.getParameter("email");
				
				int result = 0;

				
					req.getSession().setAttribute("email", email);

					Random rnd = new Random();
					result = rnd.nextInt(10000) + 1000;

					if (result > 10000) {
						result = result - 1000;
					}

					req.getSession().setAttribute("result", result);

					sendmail(email, result);

					req.setAttribute("result", result);
					req.setAttribute("email", email);		
					
				
			}
			public void sendmail(String email, int result) {
				try {
					SimpleMailMessage message = new SimpleMailMessage();
					message.setFrom("admin@nambi.com");
					message.setTo(email);
					message.setSubject("이메일 인증");
					message.setText("키를 입력해 인증을 완료하세요. " + "key=" + result);

					mailSender.send(message);
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			//2018-01-16--------------------------------------------------------
			//호스트 추가
			@Override
			public void HostPlus(HttpServletRequest req, Model model) {
				String host_id=req.getParameter("host_id");
				String host_pwd=req.getParameter("host_pwd");
				String host_name=req.getParameter("host_name");
				String host_Department=req.getParameter("host_Department");
				String host_grade=req.getParameter("host_grade");
				String host_email=req.getParameter("host_email");
				String host_phone=req.getParameter("host_phone");
				String host_authority=req.getParameter("host_authority");
				System.out.println("host_id"+host_id);
				Map<String,Object> map =new HashMap<String,Object>();
				map.put("host_id", host_id);
				map.put("host_pwd", host_pwd);
				map.put("host_name", host_name);
				map.put("host_Department", host_Department);
				map.put("host_grade", host_grade);
				map.put("host_email", host_email);
				map.put("host_phone", host_phone);
				map.put("host_authority", host_authority);
				
				int HostPlus=0;
				HostPlus=hDao.HostPlus(map);
				
				req.setAttribute("HostPlus", HostPlus);
			}
			//호스트가입 아이디가 있는지 체크하는 부분
			@Override
			public void HostIdCheack(HttpServletRequest req, Model model) {
				String host_id=req.getParameter("host_id");
				System.out.println("-------host_id:"+host_id);
				int cnt=hDao.HostIdCheack(host_id);
				
				req.setAttribute("cnt", cnt);
				System.out.println("cnt:"+cnt);
				req.setAttribute("host_id", host_id);
			}
			//호스트 리스트 가져오기
			@Override
			public void HostMemberList(HttpServletRequest req, Model model) {
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

				cnt = hDao.HostMemberListCnt();
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
					ArrayList<HostVO> dtos = hDao.HostMemberList(map);
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
			//호스트 삭제
			@Override
			public void deleteHost(HttpServletRequest req, Model model) {
				String host_id=req.getParameter("host_id");
				System.out.println("host_id:"+host_id);
				int deleteHost=0;
				deleteHost=hDao.deleteHost(host_id);
				
				req.setAttribute("deleteHost", deleteHost);
				
			}
			//////////////////////////////////// 현석 1/11////////////////////////////////////



////////////HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-11 성영민  ////////
		@Override
		public void hotMenu(HttpServletRequest req, Model model) {
			int step=0;//조건비교
			int hotCnt=0; //핫리스트 5개 출력
			int cnt=0; //글 갯수
			
			int pageSize=3; //한 페이지당 출력할 글 갯수
			int pageBlock= 2; //한 블럭당 페이지 갯수
			
			int start=0; //현재 페이지 글시작번호
			int end=0; //현재 페이지 글 마지막번호
			String pageNum=null; //페이지 번호
			int currentPage = 0; //현재 페이지
			
			int pageCount = 0; //페이지 갯수
			int startPage= 0;	//시작 페이지
			int endPage=0;	//마지막 페이지
			
			String url=(String)req.getAttribute("url"); //사이드바 구분
			System.out.println("url:$$$$$$$$$"+url);
			String mDev="";
			String sDev=req.getParameter("sDev");
			String keyword = req.getParameter("keyword");
			
			if(sDev==null) {
	            sDev="0";
	         }

	         if(keyword==null) {
	            keyword="";
	         }
	         if(url==null) {
	        	 url="hotMusical";
	         }
	         
	         if(url.equals("hotMusical")) {
	        	 mDev="뮤지컬";
	         }else if(url.equals("hotConcert")) {
	        	 mDev="콘서트";
	         }else if(url.equals("hotDrama")) {
	        	 mDev="연극";
	         }else if(url.equals("hotClassic")) {
	        	 mDev="클래식";
	         }else if(url.equals("hotStore")) {
	        	 mDev="스토어";
	         }
	        Map<String,Object> map2 = new HashMap<String,Object>();
	        map2.put("step", 1);
			map2.put("mDev", mDev);
	         
			cnt=hDao.hotNoArticleCnt(map2);
			System.out.println("cnt====="+cnt);
			pageNum=req.getParameter("pageNum");
			if(pageNum == null) {
				pageNum ="1";
			}
			currentPage=(Integer.parseInt(pageNum));
			pageCount = (cnt/ pageSize)+(cnt% pageSize > 0 ? 1: 0);  //페이지 갯수 + 나머지
	 		start=(currentPage -1)* pageSize+1;
	 		end= start + pageSize -1;
	 		if(end > cnt) end=cnt;
			
			
			
			hotCnt=hDao.hotArticleCnt();
			System.out.println("goCnt:"+hotCnt);
			if(hotCnt==0) {
				ArrayList <TcatPerformanceVO> dtos= null;
				dtos=hDao.hotList();
					for(int i =0; i<dtos.size(); i++) {
						int per_id=dtos.get(i).getPer_id();
						hotCnt= hDao.hotUpdate(per_id);
					}
				}else if(hotCnt>0) {
				//goCnt가 1이상이면 아래 문장 실행
					Map<String,Object> map=new HashMap<String, Object>();
					map.put("step", step);
					map.put("mDev", mDev);
					ArrayList <TcatPerformanceVO> vo= hDao.hotLast(map);
					model.addAttribute("vo", vo);
				
					if(cnt > 0) {
					step=1;
					map.put("step", step);
					map.put("start", start);
		 			map.put("end", end);
		 			map.put("mDev", mDev);
					map.put("sDev",sDev);
					map.put("keyword", keyword);
		 			
					System.out.println("여기 후에cnt:"+step);
					ArrayList <TcatPerformanceVO> full= hDao.hotLast(map);
					System.out.println("1여기 후에cnt:"+step);
					model.addAttribute("full", full);
				}
			}
			startPage=(currentPage/pageBlock)* pageBlock +1; // (5/3)* 3+ 1= 4
	 		if(currentPage % pageBlock ==0) startPage -= pageBlock; // (5%3)==0
	 		endPage = startPage + pageBlock -1; // 4+3 -1 =6
	 		if(endPage> pageCount) endPage = pageCount;
	 		
	 		
	 		model.addAttribute("cnt",cnt);
	 		model.addAttribute("pageNum",pageNum);
	 		
	 		if(cnt>0) {
	 			model.addAttribute("startPage",startPage);
	 			model.addAttribute("endPage",endPage);
	 			model.addAttribute("pageBlock",pageBlock);
	 			model.addAttribute("pageCount",pageCount);
	 			model.addAttribute("currentPage",currentPage);
	 		}
	 		
	 			req.setAttribute("url1", url);
	 			System.out.println("url:-------"+url);
		}
		//hot 메뉴 내리기
		@Override
		public void hotMenuDelete(HttpServletRequest req, Model model) {
			int deleteCnt=0;
			//파라미터값에 Hcnt는 넘길땐 per_id로 넘기고 get방식에서 만들어논 키값으로 넘겨서 Hcnt에 
			//per_id가 들어있다
			
			/*ArrayList <TcatPerformanceVO> dtos= null;
			dtos=hDao.hotList();
			dtos.size();
			System.out.println("dtos:"+dtos.size());*/
			
			 int strPer_id=Integer.parseInt(req.getParameter("Hcnt")); 
			 deleteCnt=hDao.hotDeleteList(strPer_id);
			 System.out.println("deleteCnt:"+deleteCnt);
			model.addAttribute("deleteCnt", deleteCnt);
		}
		//hot 메뉴 올리기
				@Override
				public void hotMenuUpdate(HttpServletRequest req, Model model) {
					int updateCnt=0;
					
					/*ArrayList <TcatPerformanceVO> dtos= null;
					dtos=hDao.hotList();
					dtos.size();
					System.out.println("dtos1:"+dtos.size());
					
					if(dtos.size() < 5) {
						
					}*/
					 int strPer_id=Integer.parseInt(req.getParameter("Hcnt"));
					 updateCnt=hDao.hotUpdateList(strPer_id);
					 System.out.println("updateCnt:"+updateCnt);
					model.addAttribute("updateCnt", updateCnt);
					/*}*/
				}
		/////////////  HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-11 성영민  ///////////////
		
	///////////////////////  동금 1/9 start  //////////////////////// 
	// HOST/상품관리/상품삭제  
	@Override
	public void stockDelete(HttpServletRequest req, Model model) {
	System.out.println("stockDelete()");
	//"%"+req.getparameter(per_id)+"%"
	String mDev = "";
	String url = (String) req.getAttribute("url");
	
	String sDev = req.getParameter("sDev"); 
	System.out.println(sDev);
	String keyword = req.getParameter("keyword");
	System.out.println(keyword);
	
	if(sDev==null) {
		sDev="0";
	}
	
	if(keyword==null) {
		keyword="";
	}
	
	if(url.equals("stockDelete_musical")) {
		mDev = "뮤지컬";
		System.out.println("mDev:"+mDev);
	}else if(url.equals("stockDelete_concert")) {
		mDev= "콘서트";
		System.out.println("mDev:"+mDev);
	}else if(url.equals("stockDelete_classic")) {
		mDev= "클래식";
		System.out.println("mDev:"+mDev);
	}else if(url.equals("stockDelete_drama")) {
		mDev= "연극";
		System.out.println("mDev:"+mDev);
	}
	
	// HOST/상품관리/상품삭제  -- 리스트불러오는 부분
	
	int pageSize = 3; // 한 페이지당 출력할 글 갯수
	int pageBlock = 3; // 한 블럭당 페이지 갯수
	
	int cnt = 0; // 글 갯수
	int start = 0; // 현재 페이지 글시작번호
	int end = 0; // 현재 페이지 글마지막번호
	int number = 0; // 출력할 글번호
	String pageNum = null; // 페이지번호
	int currentPage = 0; // 현재페이지
	
	int pageCount = 0; // 페이지 갯수
	int startPage = 0; // 시작페이지
	int endPage = 0; // 마지막 페이지
	
	System.out.println("stockDelete1");
	
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("mDev", mDev);
	map.put("sDev", sDev);
	map.put("keyword", keyword);
	System.out.println("sDev:"+sDev);
	System.out.println("keyword:"+keyword);
	
	cnt = hDao.getPerfoCnt(map);
	System.out.println("cnt : " + cnt);
	System.out.println("stockDelete2");
	model.addAttribute("cnt", cnt);
	
	
	
	pageNum = req.getParameter("pageNum");
	
	if (pageNum == null) {
	pageNum = "1"; // 첫페이지 1페이지로 설정
	}
	System.out.println("stockDelete2");
	currentPage = (Integer.parseInt(pageNum)); // 현재페이지
	System.out.println("stockDelete3");
	pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
	System.out.println("stockDelete4");
	start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호
	System.out.println("stockDelete5");
	end = start + pageSize - 1; // 현재페이지 끝번호
	System.out.println("stockDelete6");
	if (end > cnt) {
		end = cnt;				
	}
	
	System.out.println("stockDelete7");
	number = cnt - (currentPage - 1) * pageSize;
	
	if (cnt > 0) {
	// 게시글 목록 조회
	//ArrayList<guestCartVO> dtos = dao.getArticleList(start, end);
	System.out.println("stockDelete8");
	
	map.put("start", start);
	map.put("end", end);
	
	
	ArrayList<TcatPerformanceVO> dtos = hDao.getPerfoDeleteList(map);
	
	System.out.println("사이즈:" +dtos.size());
	System.out.println("stockDelete9");
	//req.setAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은바구니 : 게시글 1건
	model.addAttribute("dtos", dtos);	
	System.out.println("이미지 : "+ dtos.get(0).getPerf_Image());
	System.out.println("stockDelete10");
	}
	
	
	startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
	if (currentPage % pageBlock == 0)
	startPage -= pageBlock; // (5%3) == 0
	
	endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6
	if (endPage > pageCount)
	endPage = pageCount;
	
	//req.setAttribute("cnt", cnt); // 책수
	//req.setAttribute("number", number); // 글번호
	//req.setAttribute("pageNum", pageNum); // 페이지번호
	model.addAttribute("cnt", cnt);
	model.addAttribute("number", number);
	model.addAttribute("pageNum", pageNum);
	
	if (cnt > 0) {
	//req.setAttribute("startPage", startPage); // 시작페이지
	//req.setAttribute("endPage", endPage);// 마지막페이지
	//req.setAttribute("pageBlock", pageBlock);// 출력할 페이지 갯수
	//req.setAttribute("pageCount", pageCount);// 페이지 갯수
	//req.setAttribute("currentPage", currentPage);// 현재 페이지
	model.addAttribute("startPage", startPage);
	model.addAttribute("endPage", endPage);
	model.addAttribute("pageBlock", pageBlock);
	model.addAttribute("pageCount", pageCount);
	model.addAttribute("currentPage", currentPage);
	}
	
	}
	
	//스토어상품삭제
	@Override
	public void storeDelete(HttpServletRequest req, Model model) {
	System.out.println("storeDelete()"); 
	
	//"%"+req.getparameter(per_id)+"%"
	String category = "";
	//String mDev = "";
	String url = (String) req.getAttribute("url");
	
	String cDev = req.getParameter("cDev"); 
	System.out.println(cDev);
	String keyword = req.getParameter("keyword");
	System.out.println(keyword);
	
	if(cDev==null) {
		cDev="0";
	}
	
	if(keyword==null) {
		keyword="";
	}
	
	if(url.equals("stockDelete_store")) {
		category = "스토어";
		System.out.println("category:"+category);
	}
	
	// HOST/상품관리/상품삭제  -- 리스트불러오는 부분
	
	int pageSize = 9; // 한 페이지당 출력할 글 갯수
	int pageBlock = 3; // 한 블럭당 페이지 갯수
	
	int cnt = 0; // 글 갯수
	int start = 0; // 현재 페이지 글시작번호
	int end = 0; // 현재 페이지 글마지막번호
	int number = 0; // 출력할 글번호
	String pageNum = null; // 페이지번호
	int currentPage = 0; // 현재페이지
	
	int pageCount = 0; // 페이지 갯수
	int startPage = 0; // 시작페이지
	int endPage = 0; // 마지막 페이지
	
	System.out.println("stockDelete1");
	
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("category", category);
	//map.put("mDev", mDev);
	map.put("cDev", cDev);
	map.put("keyword", keyword);
	System.out.println("cDev:"+cDev);
	System.out.println("keyword:"+keyword);
	
	cnt = hDao.getStoreCnt(map);
	System.out.println("cnt : " + cnt);
	System.out.println("stockDelete2");
	model.addAttribute("cnt", cnt);
	
	
	
	pageNum = req.getParameter("pageNum");
	
	if (pageNum == null) {
	pageNum = "1"; // 첫페이지 1페이지로 설정
	}
	System.out.println("stockDelete2");
	currentPage = (Integer.parseInt(pageNum)); // 현재페이지
	System.out.println("stockDelete3");
	pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
	System.out.println("stockDelete4");
	start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호
	System.out.println("stockDelete5");
	end = start + pageSize - 1; // 현재페이지 끝번호
	System.out.println("stockDelete6");
	if (end > cnt) {
		end = cnt;				
	}
	
	System.out.println("stockDelete7");
	number = cnt - (currentPage - 1) * pageSize;
	
	if (cnt > 0) {
	// 게시글 목록 조회
	//ArrayList<guestCartVO> dtos = dao.getArticleList(start, end);
	System.out.println("stockDelete8");
	
	map.put("start", start);
	map.put("end", end);
	
	
	ArrayList<TcatPerDiscVO> dtos = hDao.getStoreDeleteList(map);
	
	System.out.println("사이즈:" +dtos.size());
	System.out.println("stockDelete9");
	//req.setAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은바구니 : 게시글 1건
	model.addAttribute("dtos", dtos);	
	System.out.println("stockDelete10");
	}
	
	
	startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
	if (currentPage % pageBlock == 0)
	startPage -= pageBlock; // (5%3) == 0
	
	endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6
	if (endPage > pageCount)
	endPage = pageCount;
	
	//req.setAttribute("cnt", cnt); // 책수
	//req.setAttribute("number", number); // 글번호
	//req.setAttribute("pageNum", pageNum); // 페이지번호
	model.addAttribute("cnt", cnt);
	model.addAttribute("number", number);
	model.addAttribute("pageNum", pageNum);
	
	if (cnt > 0) {
	//req.setAttribute("startPage", startPage); // 시작페이지
	//req.setAttribute("endPage", endPage);// 마지막페이지
	//req.setAttribute("pageBlock", pageBlock);// 출력할 페이지 갯수
	//req.setAttribute("pageCount", pageCount);// 페이지 갯수
	//req.setAttribute("currentPage", currentPage);// 현재 페이지
	model.addAttribute("startPage", startPage);
	model.addAttribute("endPage", endPage);
	model.addAttribute("pageBlock", pageBlock);
	model.addAttribute("pageCount", pageCount);
	model.addAttribute("currentPage", currentPage);
	}
	
	
	}
	
	//상품삭제처리
	@Override
	public void stockDeletePro(HttpServletRequest req, Model model) {
	int per_id = Integer.parseInt(req.getParameter("per_id"));
	
	int deleteCnt = hDao.registerDel(per_id);
	model.addAttribute("url", (String)req.getParameter("url"));
	model.addAttribute("deleteCnt", deleteCnt);
		
	}
	
	//스토어상품삭제처리
	@Override
	public void storeDeletePro(HttpServletRequest req, Model model) {
	int disc_code = Integer.parseInt(req.getParameter("disc_code"));
	
	int deleteCnt = hDao.storeRegisterDel(disc_code);
	model.addAttribute("url", (String)req.getParameter("url"));
	model.addAttribute("deleteCnt", deleteCnt);
	}
	
	//스토어품절상품관리
	@Override
	public void storeOutOf(HttpServletRequest req, Model model) {
	System.out.println("storeOutOf()"); 
	
	hDao.storediscCount();
	
	//"%"+req.getparameter(per_id)+"%"
	String category = "";
	//String mDev = "";
	String url = (String) req.getAttribute("url");
	
	String cDev = req.getParameter("cDev"); 
	System.out.println(cDev);
	String keyword = req.getParameter("keyword");
	System.out.println(keyword);
	
	if(cDev==null) {
		cDev="0";
	}
	
	if(keyword==null) {
		keyword="";
	}
	
	if(url.equals("stockOutOf_store")) {
		category = "스토어";
		System.out.println("category:"+category);
	}
	
	// HOST/상품관리/상품삭제  -- 리스트불러오는 부분
	
	int pageSize = 9; // 한 페이지당 출력할 글 갯수
	int pageBlock = 3; // 한 블럭당 페이지 갯수
	
	int cnt = 0; // 글 갯수
	int start = 0; // 현재 페이지 글시작번호
	int end = 0; // 현재 페이지 글마지막번호
	int number = 0; // 출력할 글번호
	String pageNum = null; // 페이지번호
	int currentPage = 0; // 현재페이지
	
	int pageCount = 0; // 페이지 갯수
	int startPage = 0; // 시작페이지
	int endPage = 0; // 마지막 페이지
	
	System.out.println("stockoutof1");
	
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("category", category);
	//map.put("mDev", mDev);
	map.put("cDev", cDev);
	map.put("keyword", keyword);
	System.out.println("cDev:"+cDev);
	System.out.println("keyword:"+keyword);
	
	cnt = hDao.storeOutOfCnt(map);
	System.out.println("cnt : " + cnt);
	System.out.println("stockDelete2");
	model.addAttribute("cnt", cnt);
	
	
	
	pageNum = req.getParameter("pageNum");
	
	if (pageNum == null) {
	pageNum = "1"; // 첫페이지 1페이지로 설정
	}
	currentPage = (Integer.parseInt(pageNum)); // 현재페이지
	pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
	start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호
	end = start + pageSize - 1; // 현재페이지 끝번호
	if (end > cnt) {
		end = cnt;				
	}
	
	number = cnt - (currentPage - 1) * pageSize;
	
	if (cnt > 0) {
	// 게시글 목록 조회
	//ArrayList<guestCartVO> dtos = dao.getArticleList(start, end);
	
	map.put("start", start);
	map.put("end", end);
	
	
	ArrayList<TcatPerDiscVO> dtos = hDao.storeOutOfList(map);
	
	/*for(int i=0; i<=dtos.size(); i++) {
		if(dtos.get(i).getDisc_count()==0) {
			
		}
	}*/
	
	System.out.println("사이즈:" +dtos.size());
	//req.setAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은바구니 : 게시글 1건
	model.addAttribute("dtos", dtos);	
	}
	
	
	startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
	if (currentPage % pageBlock == 0)
	startPage -= pageBlock; // (5%3) == 0
	
	endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6
	if (endPage > pageCount)
	endPage = pageCount;
	
	//req.setAttribute("cnt", cnt); // 책수
	//req.setAttribute("number", number); // 글번호
	//req.setAttribute("pageNum", pageNum); // 페이지번호
	model.addAttribute("cnt", cnt);
	model.addAttribute("number", number);
	model.addAttribute("pageNum", pageNum);
	
	if (cnt > 0) {
	//req.setAttribute("startPage", startPage); // 시작페이지
	//req.setAttribute("endPage", endPage);// 마지막페이지
	//req.setAttribute("pageBlock", pageBlock);// 출력할 페이지 갯수
	//req.setAttribute("pageCount", pageCount);// 페이지 갯수
	//req.setAttribute("currentPage", currentPage);// 현재 페이지
	model.addAttribute("startPage", startPage);
	model.addAttribute("endPage", endPage);
	model.addAttribute("pageBlock", pageBlock);
	model.addAttribute("pageCount", pageCount);
	model.addAttribute("currentPage", currentPage);
	}
	
	}
	
	//스토어판매중단
	@Override
	public void storeSale_stop(HttpServletRequest req, Model model) {
	int disc_code = Integer.parseInt(req.getParameter("disc_code"));
	int cnt = hDao.storeSaleStop(disc_code);
	
	//int deleteCnt = hDao.storeRegisterDel(disc_code);
	model.addAttribute("url", (String)req.getParameter("url"));
	model.addAttribute("cnt", cnt);
	}
	
	//판매중단해제하기
	@Override
	public void storeSale_Release(HttpServletRequest req, Model model) {
	int disc_code = Integer.parseInt(req.getParameter("disc_code"));
	int cnt = hDao.storeSaleStopRelease(disc_code);
	
	//int deleteCnt = hDao.storeRegisterDel(disc_code);
	model.addAttribute("url", (String)req.getParameter("url"));
	model.addAttribute("cnt", cnt);
	}





///////////////////////  동금 1/17 end ///////////////////////////
///////////////////////  태성 1/21 start ///////////////////////////
	// 관람 후기 목록
	@Override
	public void commentList(HttpServletRequest req, Model model) {
		int pageSize = 10; // 한 페이지당 출력할 글 개수
		int pageBlock = 3; // 한 블럭당 페이지 개수

		int cnt = 0; // 글 개수
		int start = 0; // 현재 페이지 글시작번호
		int end = 0; // 현재 페이지 글마지막 번호
		int number = 0; // 출력할 글 번호
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 개수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지
		String sDev = "";
		String keyword = "";
		
		// 검색추가(01/16)-------------------

		sDev = req.getParameter("sDev");
		System.out.println("sDev -----> :" + sDev);

		keyword = req.getParameter("keyword");
		System.out.println("keyword -----> :" + keyword);

		String category = "";

		if (sDev == null) {
			sDev = "0";
		}

		if (keyword == null) {
			keyword = "";
		}
		System.out.println("TSGuset 관람후기관리 목록 서비스 첫번째 출입니다. ");
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("keyword", keyword);
		map.put("sDev", sDev);
		System.out.println("keyword" + map.get("keyword") + "\n" + "sDev" + sDev);
		cnt = hDao.commentCnt(map);
		/*cnt = hDao.getStore(map);*/
		

		System.out.println("cnt :" + cnt);
		pageNum = req.getParameter("pageNum");
		System.out.println("pageNum" + pageNum);

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 설정
		}
		System.out.println("pageNum+Host service --> categoryList-->: " + pageNum);
		currentPage = (Integer.parseInt(pageNum)); // 현재 페이지

		// pageCnt = 12 / 5 + 1 // 나머지 2건이 1페이지로 할당되므로 3페이지
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 개수 + 나머지

		// 1 = (1-1) * 5 + 1
		// 6 = (2-1) * 5 + 1
		// 11 = (3-1) * 5 + 1
		// 21 = (5-1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호

		// 5 = 1 + 5 - 1;
		// 10 = 6 + 5 - 1;
		// 21 = 17 + 5 - 1;
		end = start + pageSize - 1; // 현재페이지 끝번호

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		// 1 = 25 - (5-1) * 5;
		number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호..최신글(큰페이지)가 1p

		System.out.println("number : " + number);
		System.out.println("cnt : " + cnt);
		System.out.println("currentPage : " + currentPage);
		System.out.println("pageSize : " + currentPage);

		if (cnt > 0) {
			/* Map<String, Object> map = new HashMap<String, Object>(); */
			map.put("start", start);
			map.put("end", end);
			System.out.println("end !!!!!!!!!----->:" + end);
			/*
			 * map.put("Hcnt", category); // category에서 보낸 cnt값 map.put("mdev", mDev);
			 * map.put("keyword", keyword);
			 */

			// 표 목록 조회
			System.out.println("map" + map.get("start"));
			ArrayList<TcatBoardVO> dtos = hDao.commentList(map);
			req.setAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf)작은 바구니 : 게시글 1건
			
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock; // (5%3) == 0

		endPage = startPage + pageBlock - 1;// 4+3-1=6
		if (endPage > pageCount)
			endPage = pageCount;


		model.addAttribute("sDev", sDev);
		model.addAttribute("keyword",keyword);
		model.addAttribute("category", category); // cnt == 글 개수
		model.addAttribute("cnt", cnt); // cnt == 글 개수
		model.addAttribute("number", number); // number == 글번호
		model.addAttribute("pageNum", pageNum); // pageNum 페이지 번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // startPage 시작페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 개수
			model.addAttribute("pageCount", pageCount); // 페이지 개수
			model.addAttribute("currentPage", currentPage); // 현재 페이지

		}
	}


	//관람/상품 후기 삭제!!
	@Override
	public void commentDelete(HttpServletRequest req, Model model) {
		System.out.println("후기삭제 처음 여기 서비스다 여기 오냐?");
		
		int notice_num = Integer.parseInt(req.getParameter("notice_num"));
		int commentDel = hDao.commentDel(notice_num);
		
		System.out.println("후기삭제 두번째 여기 서비스다 여기 오냐?");
		
		model.addAttribute("url", (String)req.getParameter("url"));
		model.addAttribute("commentDel", commentDel);
		
	}
	
	
}
///////////////////////  태성 1/21 end ///////////////////////////