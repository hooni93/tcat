package spring.project.tcat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.project.tcat.service.JMHGuestService;

@Controller
public class JMHGuestController {
	@Autowired
	JMHGuestService mhService;

	//////// 보류단계
	// memberFind
	@RequestMapping("memberFind")
	public String memberFind(HttpServletRequest req, Model model) {
		System.out.println("memberFind");
		return "tcat/memberFind/memberFind";
	}

	// 아이디 비밀번호 찾지 이메일인증 코드 보내기
	@RequestMapping("findId")
	public String findIdPwd(HttpServletRequest req, Model model) {
		System.out.println("findId");
		mhService.findIdPwd(req, model);
		return "tcat/memberFind/findId";
	}

	// 인증번호 체크
	@RequestMapping("findResult")
	public String findResult(HttpServletRequest req, Model model) {
		System.out.println("findResult");
		// 결과에 따라 주소값결정
		mhService.findResult(req, model);
		return "tcat/memberFind/findId";
	}

	@RequestMapping("findResultPage")
	public String findResultPage(HttpServletRequest req, Model model) {
		System.out.println("findResultPage");
		System.out.println(req.getParameter("member_id") + "/" + req.getParameter("member_pwd"));
		model.addAttribute("member_id", req.getParameter("member_id"));
		model.addAttribute("member_pwd", req.getParameter("member_pwd"));
		return "tcat/memberFind/findResultPage";
	}

	/////////////////////////////////////////////////////////////
	// 서브메뉴 및 ajax div
	@RequestMapping("myPage")
	public String myPage(HttpServletRequest req, Model model) {
		System.out.println("myPage");
		return "tcat/memberMyPage/myPage";
	}

	// 마이페이지 메인
	@RequestMapping("myPageMain")
	public String myPageMain(HttpServletRequest req, Model model) {
		System.out.println("myPageMain");
		// 해당 아이디 정보 가져오기
		mhService.myPageInfo(req, model);
		return "tcat/memberMyPage/myPageMain";
	}

	//////////////////////////////////////////////////////////////
	// memberLogin 모달 로그인 창
	@RequestMapping("memberLogin")
	public String memberLogin(HttpServletRequest req, Model model) {
		System.out.println("memberLogin");
		return "tcat/memberLogin/memberLogin";
	}

	// 로그인 처리 loginPro
	@RequestMapping("loginPro")
	public String loginPro(HttpServletRequest req, Model model) {
		System.out.println("loginPro");
		mhService.loginPro(req, model);
		return "tcat/memberLogin/loginPro";
	}

	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpServletRequest req, Model model) {
		System.out.println("logout");
		req.getSession().removeAttribute("login_id");
		return "tcat/guestMain/guestPage";
	}

	////////////////////////////////////////////////////////////////////
	// musicalList 뮤지컬 리스트
	@RequestMapping("musicalList")
	public String musicalList(HttpServletRequest req, Model model) {
		System.out.println("musicalList");
		mhService.getPerfList(req, model);
		return "tcat/musical/musicalList";
	}

	// classicList 클래식 리스트
	@RequestMapping("classicList")
	public String classicList(HttpServletRequest req, Model model) {
		System.out.println("classicList");
		mhService.getPerfList(req, model);
		return "tcat/classic/classicList";
	}

	// 콘서트 리스트
	@RequestMapping("concertList")
	public String concertList(HttpServletRequest req, Model model) {
		System.out.println("concertList");
		mhService.getPerfList(req, model);
		return "tcat/concert/concertList";
	}

	// 연극 리스트
	@RequestMapping("dramaList")
	public String dramaList(HttpServletRequest req, Model model) {
		System.out.println("dramaList");
		mhService.getPerfList(req, model);
		return "tcat/drama/dramaList";
	}

	// 무용 발레 리스트
	@RequestMapping("danceList")
	public String danceList(HttpServletRequest req, Model model) {
		System.out.println("danceList");
		mhService.getPerfList(req, model);
		return "tcat/dance/danceList";
	}

	// 스토어 리스트
	@RequestMapping("storeList")
	public String storeList(HttpServletRequest req, Model model) {
		System.out.println("storeList");
		mhService.getStoreList(req, model);
		return "tcat/store/storeList";
	}
	
	//상세페이지
	@RequestMapping("contentMain")
	public String contentMain(HttpServletRequest req, Model model) {
		System.out.println("contentMain");
		//해당 공연 위시리스트 여부 가져오기
		mhService.getWishListIn(req, model);
		//상품정보 가져오기
		mhService.getContent(req, model);
		return "tcat/content/contentMain";
	}
	@RequestMapping("contentMain_store")
	public String contentMain_store(HttpServletRequest req, Model model) {
		System.out.println("contentMain_store");
		//해당 공연 위시리스트 여부 가져오기
		mhService.getWishListIn(req, model);
		//상품정보 가져오기
		mhService.getContent_store(req, model);
		return "tcat/content/contentMain_store";
	}
	
	//위시리스트 추가 addWishList
	@RequestMapping("addWishList")
	public String addWishList(HttpServletRequest req, Model model) {
		System.out.println("addWishList");
		mhService.addWishList(req, model);
		return "tcat/content/contentMain";
	}
	//delWishList 위시리스트 삭제
	@RequestMapping("delWishList")
	public String delWishList(HttpServletRequest req, Model model) {
		System.out.println("delWishList");
		mhService.delWishList(req, model);
		return "tcat/content/contentMain";
	}
	//wishList 위시리스트 목록
	@RequestMapping("wishList")
	public String wishList(HttpServletRequest req, Model model) {
		System.out.println("wishList");
		//mhService.delWishList(req, model);
		return "tcat/wishList/wishList";
	}
	
	//결제취소 buyCancel
	@RequestMapping("buyCancel")
	public String buyCancel(HttpServletRequest req, Model model) {
		System.out.println("buyCancel");
		mhService.buyCancel(req, model);
		return "tcat/memberMyPage/buyCancelPro";
	}
	
	//perfRefund 환불요청
	@RequestMapping("perfRefund")
	public String perfRefund(HttpServletRequest req, Model model) {
		System.out.println("perfRefund");
		mhService.perfRefund(req, model);
		return "tcat/memberMyPage/perfRefundPro";
	}
	
}
