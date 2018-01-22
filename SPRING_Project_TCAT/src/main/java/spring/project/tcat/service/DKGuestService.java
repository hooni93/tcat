package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface DKGuestService {
	
	//글목록불러오기
	public void qnaBoardList(HttpServletRequest req,  Model model);
	
	//상세페이지
	public void qnaContent(HttpServletRequest req,  Model model);
	
	//글수정 상세페이지
	
	//글수정 처리페이지
	
	//글작성 처리페이지
	
	//글삭제 처리페이지
}
