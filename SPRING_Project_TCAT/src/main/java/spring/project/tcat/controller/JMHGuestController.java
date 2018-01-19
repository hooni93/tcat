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
	//memberFind
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
	
	//인증번호 체크
	@RequestMapping("findResult")
	public String findResult(HttpServletRequest req, Model model) {
		System.out.println("findResult");
		//결과에 따라 주소값결정
		mhService.findResult(req,model);
		return "tcat/memberFind/findId";
	}
	@RequestMapping("findResultPage")
	public String findResultPage(HttpServletRequest req, Model model) {
		System.out.println("findResultPage");
		System.out.println(req.getAttribute("member_find"));
		model.addAttribute("member_find", req.getAttribute("member_find"));
		return "tcat/memberFind/findResultPage";
	}
	
	/////////////////////////////////////////////////////////////
	
	//서브메뉴 및 ajax div
	@RequestMapping("myPage")
	public String myPage(HttpServletRequest req, Model model) {
		System.out.println("myPage");
		return "tcat/memberMyPage/myPage";
	}
	//마이페이지 메인
	@RequestMapping("myPageMain")
	public String myPageMain(HttpServletRequest req, Model model) {
		System.out.println("myPageMain");
		//해당 아이디 정보 가져오기
		mhService.myPageInfo(req,model);
		return "tcat/memberMyPage/myPageMain";
	}
	//////////////////////////////////////////////////////////////
	//memberLogin 모달 로그인 창
	@RequestMapping("memberLogin")
	public String memberLogin(HttpServletRequest req, Model model) {
		System.out.println("memberLogin");
		return "tcat/memberLogin/memberLogin";
	}
	//로그인 처리 loginPro
	@RequestMapping("loginPro")
	public String loginPro(HttpServletRequest req, Model model) {
		System.out.println("loginPro");
		mhService.loginPro(req,model);
		return "tcat/memberLogin/loginPro";
	}
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpServletRequest req, Model model) {
		System.out.println("logout");
		req.getSession().removeAttribute("login_id");
		return "tcat/guestMain/guestPage";
	}
	
}
