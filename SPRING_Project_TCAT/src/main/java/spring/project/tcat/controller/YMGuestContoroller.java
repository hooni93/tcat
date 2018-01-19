package spring.project.tcat.controller;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.project.tcat.service.YMGuestService;


@Controller
public class YMGuestContoroller {
	@Autowired
	YMGuestService YMService;
	
	//멤버포인트
	@RequestMapping("memberPoint")
	public String memberPoint(HttpServletRequest req,Model model) {
		System.out.println("memberPoint");
		YMService.memberRating(req, model);
		return "tcat/memberMyPage/memberPoint";
	}
	
}
