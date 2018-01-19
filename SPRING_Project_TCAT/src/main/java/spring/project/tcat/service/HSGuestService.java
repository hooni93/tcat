package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface HSGuestService {
	//아이디 있는지 체크
	public void MemberIdCheack(HttpServletRequest req,Model model);
	//게스트 가입
	public void insertMember(HttpServletRequest req,Model model);
}
