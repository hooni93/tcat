package spring.project.tcat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.project.tcat.service.HSGuestService;
@Controller
public class HSGuestController {
	@Autowired
	HSGuestService HSGservice;
	
	//게스트 회원가입
	@RequestMapping("signUp")
	public String SignUp(HttpServletRequest req, Model model) {
		System.out.println("signUp");
		
		return "tcat/signUp/signUp";
	}
	
	//게스트 회원가입
	@RequestMapping("chooseDay")
	public String chooseDay(HttpServletRequest req, Model model) {
		System.out.println("chooseDay");
		
		return "tcat/Ticketing/chooseDay";
	}
	//확인용%%%%
}
