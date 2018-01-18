package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface TSGuestService {

	//회원정보 수정
	public void myModify(HttpServletRequest req,Model model);
	
}
