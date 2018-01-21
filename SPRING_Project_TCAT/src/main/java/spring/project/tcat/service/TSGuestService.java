package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface TSGuestService {

	//회원정보 수정 (비밀번호 체크)
	public void pwdCheck(HttpServletRequest req,Model model);
	
	//회원정보 상세페이지
	public void myModifyPro(HttpServletRequest req,Model model);
	
	//회원정보 수정
	public void myModifyUpdate(HttpServletRequest req,Model model);
	
	//관람후기 목록
	public void CommentList(HttpServletRequest req,Model model);
}
