package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface HSGuestService {
	//아이디 있는지 체크
	public void MemberIdCheack(HttpServletRequest req,Model model);
	//게스트 가입
	public void insertMember(HttpServletRequest req,Model model);
	//날짜별 리스트 가져오기
	public void daySearch(HttpServletRequest req,Model model);
	//지역별 리스트 가져오기
	public void placeList(HttpServletRequest req,Model model);
	//장바구니에 담기
	public void insertCart(HttpServletRequest req,Model model);
	//장바구니 리스트 가져오기
	public void cartList(HttpServletRequest req,Model model);
	//예매할 상세정보 가져오기
	public void payList(HttpServletRequest req,Model model);
	//스토어 구매
	public void sussessPay(HttpServletRequest req,Model model);
	//회차 클릭했을때 그회차의 남은좌석 가져오기
	public void RemainingSeats(HttpServletRequest req,Model model);
}
