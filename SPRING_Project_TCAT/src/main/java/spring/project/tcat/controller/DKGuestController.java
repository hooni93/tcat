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
	//게시판글 불러오기
	@RequestMapping("qnaBoardList")
	public String qnaBoardList(HttpServletRequest req,Model model) {
		System.out.println("qnaBoardList");
		
		dkService.qnaBoardList(req, model);
		
		return "tcat/serviceCenter/qnaBoardList";
	}
	
}
