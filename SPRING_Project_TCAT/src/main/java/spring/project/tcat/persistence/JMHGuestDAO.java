package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatDiscBuyVO;
import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;

public interface JMHGuestDAO {

	// 아이디 찾기 이메일 전송
	public void sendIdMail(String member_email, String admit_code);

	// 아이디 이메일 유효성
	public int id_emailChk(Map<String, Object> map);

	// 아이디 찾기
	public String findIdPwd(Map<String, Object> map);

	// 로그인 처리
	public int loginPro(Map<String, String> map);

	// 접속일 갱신
	public void updateLastDate(Map<String, String> map);

	// 회원정보 가져오기
	public MemberVO myPageInfo(Map<String, Object> map);

	// 해당회원의 구매정보
	public ArrayList<TcatDiscBuyVO> memDiscBuy(Map<String, Object> map);

	// getPerfList 공연 리스트
	public ArrayList<TcatPerformanceVO> getPerfList(Map<String, Object> map);

	// getPerfListCnt 공연 갯수
	public int getPerfListCnt(Map<String, Object> map);

	// 스토어 리스트
	public ArrayList<TcatPerDiscVO> getStoreList(Map<String, Object> map);

	// 스토어 리스트 갯수
	public int getStoreListCnt(Map<String, Object> map);

	// getContent 공연 상세정보 가져오기
	public TcatPerformanceVO getContent(int per_id);

	// addWishList 위시리스트 추가
	public void addWishList(Map<String, Object> map);

	// delWishList
	public void delWishList(Map<String, Object> map);

	// getWishListIn 위시리스트 존배여부
	public int getWishListIn(Map<String, Object> map);
	
	//로그인 후 상세페이지 조회시 조회수 업
	public void upHits(int per_id);
	
	//buyCancel 결제 취소
	public int  buyCancel(int disc_num);
	
	//환불요청
	public int  perfRefund(int disc_num);

}
