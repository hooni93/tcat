package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MoGuestService {
	
	//핫리스트 출력
	public void hotList(HttpServletRequest req,Model model);
	//좌석정보 가져오기
	public void ticketSeat(HttpServletRequest req,Model model);
	//사진게시판 리스트 가져오기
	public void photoBoarderList(HttpServletRequest req,Model model);
	//사진게시판 답글 달기
	public void photoBoarderCommentWrite(HttpServletRequest req,Model model);
	
	
}
