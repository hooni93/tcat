package spring.project.tcat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.project.tcat.service.TSGuestService;

@Controller
public class TSGuestController {
	@Autowired
	TSGuestService TSGService;
	
	//게스트 정보수정 비밀번호 체크
		@RequestMapping("myModifyForm")
		public String myModifyForm(HttpServletRequest req, Model model) {
			System.out.println("myModifyForm");
			
			return "tcat/memberMyPage/myModifyForm";
		}
		//게스트 정보수정
		@RequestMapping("pwdCheck")
		public String pwdCheck(HttpServletRequest req, Model model) {
			System.out.println("pwdCheck");
			
			TSGService.pwdCheck(req, model);
			
			return "tcat/memberMyPage/myModifyForm";
		}
		
	//게스트 정보수정
	@RequestMapping("myModifyPro")
	public String myModifyPro(HttpServletRequest req, Model model) {
		System.out.println("myModify");
		
		TSGService.myModifyPro(req, model);
		
		return "tcat/memberMyPage/myModify";
	}
	
}
