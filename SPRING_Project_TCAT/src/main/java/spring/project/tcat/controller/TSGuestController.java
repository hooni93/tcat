package spring.project.tcat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.project.tcat.service.HostService;
import spring.project.tcat.service.TSGuestService;

@Controller
public class TSGuestController {
	@Autowired
	TSGuestService TSGService;
	@Autowired
	HostService hService;

	// 게스트 정보수정 페이지(비밀번호 확인)
	@RequestMapping("myModifyForm")
	public String myModifyForm(HttpServletRequest req, Model model) {
		System.out.println("myModifyForm");

		return "tcat/memberMyPage/myModifyForm";
	}

	// 게스트 비밀번호 체크
	@RequestMapping("pwdCheck")
	public String pwdCheck(HttpServletRequest req, Model model) {
		System.out.println("pwdCheck");

		System.out.println("ssssssssssssssssss" + req.getParameter("member_pwd"));
		TSGService.pwdCheck(req, model);

		return "tcat/memberMyPage/myModifyForm";
	}

	// 게스트 정보가져오기
	@RequestMapping("myModifyPro")
	public String myModifyPro(HttpServletRequest req, Model model) {
		System.out.println("myModify");

		TSGService.myModifyPro(req, model);

		return "tcat/memberMyPage/myModify";
	}

	// 게스트 정보수정
	@RequestMapping("myModifyUpdate")
	public String myModifyUpdate(HttpServletRequest req, Model model) {
		System.out.println("myModifyUpdate");

		TSGService.myModifyUpdate(req, model);

		return "tcat/memberMyPage/myModifyForm";
	}

	// 회사 소개
	@RequestMapping("intro")
	public String intro(HttpServletRequest req, Model model) {
		System.out.println("intro");

		return "tcat/introCompany/intro";
	}

	// 회사 소개
	@RequestMapping("introCompany")
	public String introCompany(HttpServletRequest req, Model model) {
		System.out.println("introCompany");

		return "tcat/introCompany/introCompany";
	}

	// 회사 오시는 길
	@RequestMapping("introPath")
	public String introPath(HttpServletRequest req, Model model) {
		System.out.println("introPath");

		return "tcat/introCompany/introPath";
	}

	// 이메일 인증
	@RequestMapping("GuestEmailCheck")
	public String GuestEmailCheck(HttpServletRequest req, Model model) {
		System.out.println("GuestEmailCheck");
		
		hService.emailCheack(req, model);
		
		return "tcat/memberMyPage/GuestEmailCheck";
	}
}
