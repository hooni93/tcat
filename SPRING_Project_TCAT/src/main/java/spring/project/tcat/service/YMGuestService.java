package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;


import org.springframework.ui.Model;

public interface YMGuestService {
	//등급관리
	public void memberRating(HttpServletRequest req,Model model);
}
