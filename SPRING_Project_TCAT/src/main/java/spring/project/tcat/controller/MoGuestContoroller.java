package spring.project.tcat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.project.tcat.service.MoGuestService;

@Controller
public class MoGuestContoroller {
	@Autowired
	MoGuestService MGService;
	
	//게스트 메인 출력
	@RequestMapping("guestPage")
	public String guestPage(HttpServletRequest req,Model model) {
		System.out.println("guestPage");
		return "tcat/guestMain/guestPage";
	}
	//게스트 메인
	@RequestMapping("guestMain")
	public String guestMain(HttpServletRequest req,Model model) {
		System.out.println("guestMain");
		return "tcat/guestMain/guestMain";
	}
	//현석이컴 고물
	
}
