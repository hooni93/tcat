package spring.project.tcat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.project.tcat.service.HostService;

@Controller
public class TcatHostController {

	@Autowired
	HostService hService;
	
	//호스트 메인화면 호출
	@RequestMapping("hostMain_side")
	public String hostMain_side(HttpServletRequest req,Model model) {
		System.out.println("hostMain_side");
		return "tcat/hostMain/hostMain_side";
	}
	//호스트 메인화면
	@RequestMapping("hostMain")
	public String hostMain(HttpServletRequest req,Model model) {
		System.out.println("hostMain");
		return "tcat/hostMain/hostMain";
	}
	//회원 가입탈퇴 관리 메인화면 호출
	@RequestMapping("join_retireMember_side")
	public String join_retireMember_side(HttpServletRequest req,Model model) {
		System.out.println("join_retireMember_side");
		return "tcat/memberManage/join_retireMember_side";
	}
	//최근 가입회원 화면
	@RequestMapping("join_retireMember")
	public String join_retireMember(HttpServletRequest req,Model model) {
		System.out.println("join_retireMember");
		return "tcat/memberManage/join_retireMember";
	}
	//회원탈퇴 상세
	@RequestMapping("retireMemberConfirm")
	public String retireMemberConfirm(HttpServletRequest req,Model model) {
		System.out.println("retireMemberConfirm");
		return "tcat/memberManage/retireMemberConfirm";
	}
	//호스트 멤버 가입
	@RequestMapping("hostMemberJoin")
	public String hostMemberJoin(HttpServletRequest req,Model model) {
		System.out.println("hostMemberJoin");
		return "tcat/memberManage/hostMemberJoin";
	}
	//호스트 멤버 탈퇴 관리
	@RequestMapping("hostMemberRetire")
	public String hostMemberRetire(HttpServletRequest req,Model model) {
		System.out.println("hostMemberRetire");
		return "tcat/memberManage/hostMemberRetire";
	}
	
////////////////////////18.01.11 명훈/////////////////////////////
//연극상품 나열
@RequestMapping("productList_perf")
public String productList_perf(HttpServletRequest req,Model model) {
System.out.println("productList_perf");
//상품목록 나열
hService.productList(req,model);
return "tcat/productList/productList_perf";
}
//스토어 상품 나열
@RequestMapping("productList_store")
public String productList_store(HttpServletRequest req,Model model) {
System.out.println("productList_store");
//상품목록 나열
hService.productList(req,model);
return "tcat/productList/productList_store";
}

////////////////////////18.01.11 명훈/////////////////////////////	
////////////////////////18.01.  명훈 추가/////////////////////////////
//상품페이지 with 사이드바
@RequestMapping("productList_side")
public String productList_side(HttpServletRequest req,Model model) {
System.out.println("productList_side");
return "tcat/productList/productList_side";
}
////////////////////////18.01. 명훈 추가끝/////////////////////////////
	
	/////////////////////////////////// 태성 1/9 start /////////////////////////////////////////
	// HOST//상품관리//카테고리별 상품진열관리 --  카테고리별 상품진열 관리 (우선순위를 정해서 카테고리별로 상품진열하기)

	@RequestMapping("categoryList_side")
	public String categoryList_side(HttpServletRequest req,Model model) {
		
		System.out.println("categoryList_side");
		
		return "tcat/productList/categoryList_side";
	}
	@RequestMapping("categoryList")
	public String categoryList(HttpServletRequest req,Model model) {
		
		System.out.println("categoryList");
		hService.categoryList(req, model);
				
		return "tcat/productList/categoryList";
	}
	////////////////////////////////////태성 1/9 end/ /////////////////////////////////////////
	
	////////////////////////////////////태성 1/10 start/ /////////////////////////////////////////
	//HOST//상품관리/카테코리별 상품진열관리 -- 우선순위 변경
	@RequestMapping("Cfirst_grade")
	public String Cfirst_grade(HttpServletRequest req,Model model) {
		
		System.out.println("Cfirst_grade");
		hService.updateGrade(req, model);
		hService.categoryList(req, model);
		return "tcat/productList/categoryList";
	}
	@RequestMapping("Sfirst_grade")
	public String Sfirst_grade(HttpServletRequest req,Model model) {
		
		System.out.println("Sfirst_grade");
		hService.updateGrade(req, model);
		hService.categoryList(req, model);
				
		return "tcat/productList/categoryList";
	}
	//////////////////////////////////// 태성 1/10 end/ /////////////////////////////////////////
	
	////////////////////////////////////현석 1/11 / /////////////////////////////////////////
	
	@RequestMapping("registItem")
	public String registItem(HttpServletRequest req,Model model) {
		System.out.println("registItem");
		
		//공연정보 목록 가져오기
		hService.performanceList(req, model);
		
		return "tcat/registItem/registItem";
	}
	
	@RequestMapping("insertPerformance")
	public String insertPerformance(MultipartHttpServletRequest req,Model model) {
		System.out.println("insertPerformance");
		
		hService.performanceInsert(req,model);
		//공연정보 목록 가져오기
		hService.performanceList(req, model);
		
		return "tcat/registItem/registItem";
	}
	
	@RequestMapping("remain_round")
	public String remain_round(HttpServletRequest req,Model model) {
		System.out.println("remain_round");
		
		return "tcat/registItem/remain_round";
	}
	
	@RequestMapping("storeItem")
	public String storeItem(HttpServletRequest req,Model model) {
		System.out.println("storeItem");
		
		req.setAttribute("item", 1);
		hService.storeList(req,model);
		
		return "tcat/registItem/registItem";
	}
	
	@RequestMapping("insertStore")
	public String insertStore(MultipartHttpServletRequest req,Model model) {
		System.out.println("insertStore");
		
		req.setAttribute("item", 1);
		hService.insertStore(req,model);
		hService.storeList(req,model);
		
		return "tcat/registItem/registItem";
	}
	
	
////////////////////////////////////현석 1/11  end/ /////////////////////////////////////////
	
////////////////////// HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-11 성영민 ////////////////////////
	@RequestMapping("hotMenu_side")
	public String hotMenu_side(HttpServletRequest req,Model model) {
		System.out.println("hotMenu_side");
		return "tcat/productList/hotMenu_side";
	}
	
	@RequestMapping("hotMusical")
	public String hotMusical(HttpServletRequest req,Model model) {
		System.out.println("hotMusical");
		hService.hotMenu(req, model);
		return "tcat/productList/hotMusical";
	}
	@RequestMapping("hotConcert")
	public String hotConcert(HttpServletRequest req,Model model) {
		System.out.println("hotConcert");

		return "tcat/productList/hotConcert";
	}
	@RequestMapping("hotDrama")
	public String hotDrama(HttpServletRequest req,Model model) {
		System.out.println("hotDrama");

		return "tcat/productList/hotDrama";
	}
	@RequestMapping("hotClassic")
	public String hotClassic(HttpServletRequest req,Model model) {
		System.out.println("hotClassic");

		return "tcat/productList/hotClassic";
	}
	@RequestMapping("hotStore")
	public String hotStore(HttpServletRequest req,Model model) {
		System.out.println("hotStore");
		
		return "tcat/productList/hotStore";
	}
	
/////////////////// HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-11 성영민  /////////////////////////
	
	///////////////////////  동금 1/9 start  //////////////////////// 
	// HOST/상품관리/상품삭제  
	@RequestMapping("stockDelete_side")
	public String stockDelete_side(HttpServletRequest req,Model model) {
		System.out.println("stockDelete_side");
		return "tcat/productList/stockDelete_side";
	}
	@RequestMapping("stockDelete_perf")
	public String stockDelete_perf(HttpServletRequest req,Model model) {
		System.out.println("stockDelete_perf");
		hService.stockDelete(req, model);
		return "tcat/productList/stockDelete_perf";
	}
	@RequestMapping("stockDelete_store")
	public String stockDelete_store(HttpServletRequest req,Model model) {
	System.out.println("stockDelete_store");
	hService.stockDelete(req, model);
	return "tcat/productList/stockDelete_store";
	}
	
	///////////////////////  동금 1/9 end ///////////////////////////
	
}
