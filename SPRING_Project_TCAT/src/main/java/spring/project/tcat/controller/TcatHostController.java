package spring.project.tcat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.project.tcat.service.HostService;

@Controller
public class TcatHostController {

	@Autowired
	HostService hService;
	
	@RequestMapping("hostPage")
	public String hostPage(HttpServletRequest req,Model model) {
		System.out.println("hostPage");
		return "tcat/hostMain/hostPage";
	}
	@RequestMapping("hostMain")
	public String hostMain(HttpServletRequest req,Model model) {
		System.out.println("hostMain");
		return "tcat/hostMain/hostMain";
	}
	
}
