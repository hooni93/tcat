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
	
	//관람후기 전체목록
	public void CommentList(HttpServletRequest req, Model model);
	
	//관람후기 (해당 공연 목록)
	public void selectComment(HttpServletRequest req, Model model);
	
	//관람/후기 글 쓰기
	public void commentWrite(HttpServletRequest req, Model model);
	
	//상품후기 (해당 상품 목록)
	public void selectCommentS(HttpServletRequest req, Model model);
		
	//상품/후기 글 쓰기
	public void commentWriteS(HttpServletRequest req, Model model);
}
