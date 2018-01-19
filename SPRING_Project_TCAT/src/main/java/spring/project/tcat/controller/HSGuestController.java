package spring.project.tcat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.project.tcat.service.HSGuestService;
import spring.project.tcat.service.HostService;
@Controller
public class HSGuestController {
	@Autowired
	HSGuestService HSGservice;
	@Autowired
	HostService hService;
	
	//게스트 회원가입 폼 페이지
	@RequestMapping("signUp")
	public String SignUp(HttpServletRequest req, Model model) {
		System.out.println("signUp");
		
		return "tcat/signUp/signUp";
	}
	//게스트 id체크
	@RequestMapping("MemberIdCheack")
	public String MemberIdCheack(HttpServletRequest req, Model model) {
		System.out.println("MemberIdCheack");
		
		HSGservice.MemberIdCheack(req, model);
	
		return "tcat/signUp/MemberIdCheack";
	}
	@RequestMapping("GuestEmailCheack")
	public String GuestEmailCheack(HttpServletRequest req, Model model) {
		System.out.println("GuestEmailCheack");
		
		hService.emailCheack(req, model);
		
		return "tcat/signUp/GuestEmailCheack";
	}
	//게스트 회원가입
	@RequestMapping("insertMember")
	public String insertMember(HttpServletRequest req, Model model) {
		System.out.println("insertMember");
		
		HSGservice.insertMember(req,model);
		
		return "tcat/signUp/signUp";
	}

	//예매
	@RequestMapping("Ticketing")
	public String Ticketing(HttpServletRequest req, Model model) {
		System.out.println("Ticketing");
		
		return "tcat/Ticketing/Ticketing";
	}

	
	@RequestMapping("chooseDay")
	public String chooseDay(HttpServletRequest req, Model model) {
		System.out.println("chooseDay");
		
		return "tcat/Ticketing/chooseDay";
	}
	@RequestMapping("NewFile")
	public String NewFile(HttpServletRequest req, Model model) {
		System.out.println("NewFile");
		
		return "tcat/signUp/NewFile";
	}

}
