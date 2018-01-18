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
	
	//아이디,비밀번호 찾기 폼
	@RequestMapping("findForm")
	public String findForm(HttpServletRequest req, Model model) {
		System.out.println("findForm");
		return "tcat/memberFind/findForm";
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
		mhService.findResult(req,model);
		return "tcat/memberFind/findResult";
	}
	
	/////////////////////////////////////////////////////////////
	
	//
	@RequestMapping("myPage")
	public String myPage(HttpServletRequest req, Model model) {
		System.out.println("myPage");
		return "tcat/memberMyPage/myPage";
	}
	//마이페이지 메인
	@RequestMapping("myPageMain")
	public String myPageMain(HttpServletRequest req, Model model) {
		System.out.println("myPageMain");
		return "tcat/memberMyPage/myPageMain";
	}
}
