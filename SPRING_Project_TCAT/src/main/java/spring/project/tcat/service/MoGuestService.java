package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MoGuestService {
	
	//핫리스트 출력
	public void hotList(HttpServletRequest req,Model model);
}
