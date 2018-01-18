package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface JMHGuestService {
	
	//아이디,비밀번호 찾기
	public void findIdPwd(HttpServletRequest req,Model model);
	//아이디, 비밀번호 찾기 결과 
	public void findResult(HttpServletRequest req,Model model);
	//로그인 처리
	public void loginPro(HttpServletRequest req,Model model);
}
