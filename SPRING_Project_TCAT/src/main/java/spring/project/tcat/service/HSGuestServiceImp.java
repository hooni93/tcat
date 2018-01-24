package spring.project.tcat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.project.tcat.VO.CartVO;
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
			int cart_count=Integer.parseInt(req.getParameter("cart_count"));
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("member_id", member_id);
			map.put("disc_code", disc_code);
			map.put("cart_count", cart_count);
			
			int insertCart=0;
			insertCart=HSDao.insertCart(map);
			
			req.setAttribute("insertCart", insertCart);
		}
		//장바구니 리스트 가져오기
		@Override
		public void cartList(HttpServletRequest req, Model model) {
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
			String member_id=(String)req.getSession().getAttribute("login_id");
			System.out.println("member_id:"+member_id);
			cnt = HSDao.cartCnt(member_id);
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
				map.put("member_id", member_id);
				ArrayList<CartVO> dtos=HSDao.cartList(map);
				
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

		@Override
		public void payList(HttpServletRequest req, Model model) {
			int per_id=Integer.parseInt(req.getParameter("per_id"));
			
			TcatPerformanceVO vo=new TcatPerformanceVO();
			vo=HSDao.payList(per_id);
			req.setAttribute("vo", vo);
		}

		@Override
		public void sussessPay(HttpServletRequest req, Model model) {
			String member_id=(String)req.getSession().getAttribute("login_id");
			System.out.println("--------member_id:"+member_id);
			String addrChange=null;
			addrChange=req.getParameter("addrChange");
			String member_addr=null;
			String member_name=null;
			String member_hp=null;
			
			Map<String,Object> map2=new HashMap<String,Object>();
			map2.put("member_id", member_id);
			System.out.println("1");
			ArrayList<CartVO> dtos=HSDao.cartListDtos(map2);
			System.out.println("addr"+dtos);
			if(addrChange==null) {
				member_addr=dtos.get(0).getMember_addr();
				member_name=dtos.get(0).getMember_name();
				member_hp=dtos.get(0).getMember_hp();
			}else {
				member_addr=req.getParameter("member_addr");
				member_name=req.getParameter("member_name");
				member_hp=req.getParameter("member_hp");
			}
			System.out.println("2");
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("member_addr", member_addr);
			map.put("member_name", member_name);
			map.put("member_hp", member_hp);
			System.out.println("3");
			//배송정보 추가
			HSDao.insertdelevaryInfo(map);
			System.out.println("4");
			//배송번호 가져오기
			int del_num=HSDao.maxdel_num();
			map.put("del_num", del_num);
			System.out.println("5");
			for(int i=0;i<dtos.size();i++) {
				//상품구입번호[시퀀스]
				//배송번호 del_num
				//구매일자 [sysdate]
				map.put("disc_code", dtos.get(i).getDisc_code());//상품코드 dtos.get(i).getDisc_code()
				map.put("member_id", member_id);//구매자 id member_id
				//구매스텝[1=구매]
				map.put("Rating", dtos.get(i).getRating());//할인조건[rating]
				map.put("buy_count", dtos.get(i).getCart_count());//구매수량 dtos.get(i).getCart_count()
				HSDao.insertStorePay(map);
			}
			System.out.println("6");
			//구매자의 장바구니 목록 제거
			HSDao.cartDel(member_id);
			System.out.println("7");
			req.setAttribute("Pay", 1);
		}

		@Override
		public void RemainingSeats(HttpServletRequest req, Model model) {
			String rd=req.getParameter("round");
			int round=Integer.parseInt(rd.substring(0, 1));
			
			String ticet_date=req.getParameter("ticet_date");
			int per_id=Integer.parseInt(req.getParameter("per_id"));
			System.out.println("round:"+round);
			System.out.println("ticet_date:"+ticet_date);
			System.out.println("per_id:"+per_id);
			
			TcatPerformanceVO dto=new TcatPerformanceVO();
			System.out.println("1");
			dto=HSDao.payList(per_id);
			System.out.println("2");
			System.out.println("vip_seat[물리번호]:"+dto.getVIP_seat());
			
			String vip[]=null;
			String r[]=null;
			String s[]=null;
			String a[]=null;
			String b[]=null;
			if(dto.getVIP_seat()!=null) {
				vip=dto.getVIP_seat().split("/");	
			}
			if(dto.getR_seat()!=null) {
				r=dto.getR_seat().split("/");
			}
			if(dto.getS_seat()!=null) {
				s=dto.getS_seat().split("/");
			}
			if(dto.getA_seat()!=null) {
				a=dto.getA_seat().split("/");
			}
			if(dto.getB_seat()!=null) {
				b=dto.getB_seat().split("/");	
			}
			
			
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("round", round);
			map.put("ticet_date", ticet_date);
			System.out.println("3");
			int vipCount=0;
			int rCount=0;
			int sCount=0;
			int aCount=0;
			int bCount=0;
			System.out.println("4");
			vipCount=HSDao.vipCount(map);
			rCount=HSDao.rCount(map);
			sCount=HSDao.sCount(map);
			aCount=HSDao.aCount(map);
			bCount=HSDao.bCount(map);
			System.out.println("5");
			int RemainingSeatsVIP=0;
			int RemainingSeatsR=0;
			int RemainingSeatsS=0;
			int RemainingSeatsA=0;
			int RemainingSeatsB=0;
			
			if(vip!=null) {
				RemainingSeatsVIP=vip.length-vipCount;	
			}
			if(r!=null) {
				RemainingSeatsR=r.length-rCount;
			}
			if(s!=null) {
				RemainingSeatsS=s.length-sCount;
			}
			if(a!=null) {
				RemainingSeatsA=a.length-aCount;
			}
			if(b!=null) {
				RemainingSeatsB=b.length-bCount;
			}

			req.setAttribute("RemainingSeatsVIP", RemainingSeatsVIP);
			req.setAttribute("RemainingSeatsR", RemainingSeatsR);
			req.setAttribute("RemainingSeatsS", RemainingSeatsS);
			req.setAttribute("RemainingSeatsA", RemainingSeatsA);
			req.setAttribute("RemainingSeatsB", RemainingSeatsB);
			req.setAttribute("vo2", dto);

			
		}	
	
}
