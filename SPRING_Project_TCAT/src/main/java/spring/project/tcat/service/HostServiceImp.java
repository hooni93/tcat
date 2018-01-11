package spring.project.tcat.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.persistence.HostDAO;
import spring.project.tcat.persistence.HostDAOImp;

@Service
public class HostServiceImp implements HostService {

	@Autowired
	HostDAOImp hDao;
	
	//////////////////////////////////////18.01.11 명훈//////////////////////////////////////////////////
	//상품목록 나열
		@Override
		public void productList(HttpServletRequest req, Model model) {
			System.out.println("HostServiceImp - productList");
			
			//화면에서 원하는 데이터 호출
			String category = req.getParameter("category");	//대분류
			String mDev = req.getParameter("mDev");			//중분류
			String sDev = req.getParameter("sDev");			//소분류
			String keyword = req.getParameter("keyword");	//검색어
			System.out.println(category+"/"+mDev+"/"+sDev+"/"+keyword);
			if(mDev!=null) {
				if(mDev.equals("")) mDev = null;
			}
			if(sDev!=null) {
				if(sDev.equals("")) sDev = null;
			}
			if(keyword!=null) {
				if(keyword.equals("")) { keyword = null;}
			}

			System.out.println(category+"/"+mDev+"/"+sDev+"/"+keyword);
			//게시판 구조
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
			
			//담을 바구니 생성
			ArrayList<TcatPerformanceVO> performances = new ArrayList<TcatPerformanceVO>();
			ArrayList<TcatPerDiscVO> 	discs = new ArrayList<TcatPerDiscVO>();
			
			//조건
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("category", category);
			map.put("mDev", mDev);
			map.put("sDev", sDev);
			map.put("keyword", keyword);

			
			//갯수
			//1. 스토어
			if(category.equals("store")) {
				/*productCnt = hDao.storeProductCnt(map);
				System.out.println("store - productCnt: "+productCnt);
				//보여줄 탭 클래스에  active 주기
				model.addAttribute("perActive", "");
				model.addAttribute("storeActive", "active");*/
			}
			//2. 공연
			else {
				map.replace("category", "performance");
				productCnt = hDao.perProductCnt(map);
				System.out.println("productCnt: "+productCnt );
				//보여줄 탭 클래스에  active 주기
				model.addAttribute("perActive", "active");
				model.addAttribute("storeActive", "");
			}
					
			// 현재 보고있는 페이지
			pageNum = req.getParameter("pageNum");
			if ((pageNum == null) || (pageNum== "undefined")) {
				pageNum = "1"; // 첫 페이지를 1페이지로 설정
			}
			
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
			if (end > productCnt) end = productCnt;
			
			
			// 게시글 받아오기
			if (productCnt > 0) {
				// 게시물 가져오기
				map.put("start", start);
				map.put("end", end);
				
				//담기
				if(category.equals("store")) {
					//discs = hDao.storeProduct(map);
					// req 보내기
					//System.out.println("discs: "+discs.get(0).getDisc_price());
					//model.addAttribute("discs", discs);
				}
				//2. 공연
				else {
					discs = hDao.storeProduct(map);
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
			//페이지 카테고리 정보
			model.addAttribute("category",category);	//대분류, 카테고리 전송
			model.addAttribute("mDev",mDev);			//소분류
			model.addAttribute("sDev",sDev);			//대분류
			model.addAttribute("keyword",keyword);		//검색어	
			
		}
		//////////////////////////////////////18.01.11 명훈//////////////////////////////////////////////////
		
		

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
String category="";
try {
category = req.getParameter("category");
} catch (Exception e) {

}
System.out.println("Host 서비스 첫번째 출입니다. ");
HostDAO hDao = new HostDAOImp();
System.out.println("Hcnt:" + Hcnt);
cnt = hDao.getArticleCnt(category);
System.out.println("cnt :" + cnt);
pageNum = req.getParameter("pageNum");
System.out.println("pageNum" + pageNum);

if (pageNum == null) {
pageNum = "1"; // 첫페이지를 1페이지로 설정
}
System.out.println("pageNum123456789" + pageNum);
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
map.put("Hcnt", category); // category에서 보낸 cnt값
// 표 목록 조회
System.out.println("map" + map.get("start"));
ArrayList<TcatPerformanceVO> dtos = hDao.getArticleList(map); 
req.setAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf)작은 바구니 : 게시글 1건
}

startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
if (currentPage % pageBlock == 0)
startPage -= pageBlock; // (5%3) == 0

endPage = startPage + pageBlock - 1;// 4+3-1=6
if (endPage > pageCount)
endPage = pageCount;
if(category.equals("뮤지컬")) {
Hcnt=1;
}
else if(category.equals("연극")) {
Hcnt=2;
}
else if(category.equals("콘서트")) {
Hcnt=3;
}
else if(category.equals("store")) {
Hcnt=4;
}
System.out.println("category="+ category);
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
String category=req.getParameter("category");
System.out.println(category+"======================");
/*int Hcnt = Integer.parseInt(req.getParameter("Hcnt"));*/

System.out.println("!!!!!!!first_grade!!!!!!-->" + first_grade);
Map<String, String> map = new HashMap<String, String>();
if (category.equals("store")) {
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

/////////////////////////////////// 태성 1/10 end /////////////////////////////////////////


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
public void performanceInsert(MultipartHttpServletRequest req, Model model) {
	MultipartFile file = req.getFile("perf_Image");
	System.out.println("11111");
	String realDir = "C:\\Dev\\TCATworkspace\\git\\SPRING_Project_TCAT\\src\\main\\webapp\\resources\\image\\performance\\";
	String saveDir = req.getRealPath("/resources/image/performance/");
	try {
		System.out.println("1");
		file.transferTo(new File(saveDir + file.getOriginalFilename()));
		System.out.println("2");
		FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
		FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
		System.out.println("3");
		int data = 0;
		System.out.println("4");
		while ((data = fis.read()) != -1) {
			fos.write(data);
		}
		fis.close();
		fos.close();
		System.out.println("5");
		String perf_title = req.getParameter("perf_title");
		int category = Integer.parseInt(req.getParameter("category"));
		String perf_Image = file.getOriginalFilename();
		String sale = req.getParameter("sale");
		System.out.println("sale:=====" + sale);
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		int place = Integer.parseInt(req.getParameter("place"));
		int first_grade = Integer.parseInt(req.getParameter("first_grade"));
		int per_step = Integer.parseInt(req.getParameter("per_step"));
		String remain_round = req.getParameter("remain_round");
		int remain_seat = Integer.parseInt(req.getParameter("remain_seat"));
		System.out.println("6");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("perf_title", perf_title);
		map.put("category", category);
		map.put("perf_Image", perf_Image);
		map.put("sale", sale);
		map.put("place", place);
		map.put("first_grade", first_grade);
		map.put("per_step", per_step);
		map.put("remain_round", remain_round);
		map.put("remain_seat", remain_seat);
		System.out.println("7");
		// 시작날짜와 종료날짜에서 /를 제거한다
		String sDate[] = startDate.split("/");
		String eDate[] = endDate.split("/");
		System.out.println("8");
		// 시작날짜와 종료날짜에 -를 붙인다
		String ssDate = sDate[2] + "-" + sDate[0] + "-" + sDate[1];
		String eeDate = eDate[2] + "-" + eDate[0] + "-" + eDate[1];
		map.put("startDate", ssDate);
		map.put("endDate", eeDate);
		System.out.println("ssDate=" + ssDate);
		System.out.println("9");
		// 공연회차에서 ,를 제거한다
		String d[] = remain_round.split(",");
		System.out.println("10");
		// date객체를 가져와서 시작날짜를 date형으로 바꾼다.
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = df.parse(ssDate);
		System.out.println("11");
		// performanceInfo에 값 넣기
		System.out.println(
				"=======================================\n" 
				+ "perf_title=" + map.get("perf_title")	+ "\n" 
				+ "category=" + map.get("category") + "\n" 
				+ "perf_Image=" + map.get("perf_Image") + "\n"
				+ "sale=" + map.get("sale") + "\n" 
				+ "startDate=" + map.get("startDate") + "\n" 
				+ "endDate="+ map.get("endDate") + "\n" 
				+ "place=" + map.get("place") + "\n" 
				+ "first_grade="+ map.get("first_grade") + "\n" 
				+ "per_step=" + map.get("per_step") + "\n"
				+ "=======================================\n");

		hDao.insertPerformance(map);
		System.out.println("12");
		// 캘린더에 시작날짜를 넣는다
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		System.out.println("13");
		// insertPerformance에서 가장 큰수의 per_id를 가져와서 map에 넣는다.
		int per_id = hDao.selectPer_id();
		map.put("per_id", per_id);
		System.out.println("14");
		// 시작날짜와 종료날짜가 같아질때까지 반복문을 돌린다
		while (!ssDate.equals(eeDate)) {
			// 시작날짜를 맵에 담는다.
			map.put("date", ssDate);
			System.out.println("15");

			// 회차수만큼 반복한다.
			for (int i = 0; i < d.length; i++) {
				// 첫번째회차부터 가져와서 맵에 넣고 인서트한다.
				map.put("remain_round", d[i]);
				System.out.println("16");
				System.out.println(
					"per_id=" + map.get("per_id") + "\n" + 
					"remain_round=" + map.get("remain_round") + "\n" + 
					"remain_seat=" + map.get("remain_seat") + "\n" + 
					"date=" + map.get("date") + "\n"
				);

				// RemainingSeatInfo에 값 넣기
				hDao.insertRemainingSeat(map);
			}
			// 시작날짜를 하루만큼 증가시킨다
			cal.add(Calendar.DATE, 1);
			System.out.println("17");
			// 증가시킨 날짜를 업데이트한다.
			ssDate = df.format(cal.getTime());
		}
		System.out.println("18");
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("19");
	}
	System.out.println("20");
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

}

@Override
public void insertStore(MultipartHttpServletRequest req, Model model) {
	MultipartFile file = req.getFile("disc_image");

	String realDir = "C:\\Dev\\TCATworkspace\\git\\SPRING_Project_TCAT\\src\\main\\webapp\\resources\\image\\store\\";
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

		int disc_code = Integer.parseInt(req.getParameter("disc_code"));
		String disc_title = req.getParameter("disc_title");
		int disc_price = Integer.parseInt(req.getParameter("disc_price"));
		String disc_image = file.getOriginalFilename();
		String disc_con = req.getParameter("disc_con");
		String sale_div = req.getParameter("sale_div");
		int cateNum = Integer.parseInt(req.getParameter("cateNum"));
		String first_grade = req.getParameter("first_grade");
		String disc_step = req.getParameter("disc_step");

		dto.setDisc_code(disc_code);
		dto.setDisc_title(disc_title);
		dto.setDisc_price(disc_price);
		dto.setDisc_image(disc_image);
		dto.setDisc_con(disc_con);
		dto.setSale_div(sale_div);
		dto.setCateNum(cateNum);
		dto.setFirst_grade(first_grade);
		dto.setDisc_step(disc_step);

		System.out.println(
				"==================================\n"+
				"disc_code : "+dto.getDisc_code()+"\n"+
				"disc_title : "+dto.getDisc_title()+"\n"+
				"disc_price : "+dto.getDisc_price()+"\n"+
				"disc_image : "+dto.getDisc_image()+"\n"+
				"disc_con : "+dto.getDisc_con()+"\n"+
				"sale_div : "+dto.getSale_div()+"\n"+
				"cateNum : "+dto.getCateNum()+"\n"+
				"first_grade : "+dto.getFirst_grade()+"\n"+
				"disc_step : "+dto.getDisc_step()+"\n"+
				"==================================\n"
		);
		hDao.insertStore(dto);

	} catch (Exception e) {

	}

}
	////////////////////////////////////현석 1/11//////////////////////////////////// 
		

		////////////  HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-11 성영민  ////////
		@Override
		public void hotMenu(HttpServletRequest req, Model model) {
			ArrayList <TcatPerformanceVO> dtos= hDao.hotList();
			model.addAttribute("dtos", dtos);
		}
		/////////////  HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-11 성영민  ///////////////
		
		///////////////////////  동금 1/9 start  //////////////////////// 
		// HOST/상품관리/상품삭제  
		@Override
		public void stockDelete(HttpServletRequest req, Model model) {
		System.out.println("stockDelete()");
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
		
		cnt = hDao.getPerfoCnt();
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
		if (end > cnt)
		end = cnt;
		System.out.println("stockDelete7");
		number = cnt - (currentPage - 1) * pageSize;
		
		if (cnt > 0) {
		// 게시글 목록 조회
		//ArrayList<guestCartVO> dtos = dao.getArticleList(start, end);
		System.out.println("stockDelete8");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("category", null);
		map.put("mDev", null);
		map.put("sDev", null);
		map.put("keyword", null);
		//ArrayList<TcatPerformanceVO> dtos = hDao.getPerfo(map);
		System.out.println("stockDelete9");
		//req.setAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은바구니 : 게시글 1건
		//model.addAttribute("dtos", dtos);	
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
		
		///////////////////////  동금 1/9 end ///////////////////////////
		
}
