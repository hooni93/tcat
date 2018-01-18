package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface DKGuestService {
	
	//글목록불러오기
	public void qnaBoardList(HttpServletRequest req,  Model model);
	
}
