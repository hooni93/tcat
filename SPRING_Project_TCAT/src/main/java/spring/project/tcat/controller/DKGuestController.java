package spring.project.tcat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.project.tcat.service.DKGuestService;

@Controller
public class DKGuestController {
	
	@Autowired
	DKGuestService dkService;
	
	@RequestMapping("qnaBoardList")
	public String qnaBoardList(HttpServletRequest req,Model model) {
		System.out.println("qnaBoardList");
		
		
		
		return "qna";
	}
	
}
