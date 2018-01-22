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
	
	//고객센터메인화면
	@RequestMapping("qnaBoardMain")
	public String qnaBoardMain(HttpServletRequest req,Model model) {
		System.out.println("qnaBoardMain");
		req.getSession().setAttribute("page", "qnaBoardMain");
		return "tcat/serviceCenter/qnaBoardMain";
	}
	
	//게시판글 불러오기
	@RequestMapping("qnaBoardList")
	public String qnaBoardList(HttpServletRequest req,Model model) {
		System.out.println("qnaBoardList");
		req.setAttribute("url", "qnaBoardList");
		dkService.qnaBoardList(req, model);
		req.getSession().setAttribute("page", "qnaBoardList");
		return "tcat/serviceCenter/qnaBoardList";
	}
	
	//1:1게시판불러오기
	//@RequestMapping("qnaOneToOneboard")
	/*public String qnaOneToOneboard(HttpServletRequest req,Model model) {
		System.out.println("qnaOneToOneboard");
		req.setAttribute("url", "qnaOneToOneboard");
		dkService.qnaBoardList(req, model);
		req.getSession().setAttribute("page", "qnaOneToOneboard");
		return "tcat/serviceCenter/qnaoneoneboard";
		
	}*/
	
	//상세글보기
	/*@RequestMapping("qnaContent")
	public String qnaContent(HttpServletRequest req,Model model) {
		System.out.println("qnaContent");
		req.setAttribute("url", "qnaContent");
		dkService.qnaContent(req, model);
		req.getSession().setAttribute("page", "qnaOneToOneboard");
		return "tcat/serviceCenter/qnaContent";
	}*/
	
}
