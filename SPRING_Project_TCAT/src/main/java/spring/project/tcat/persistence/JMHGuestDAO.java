package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatDiscBuyVO;
import spring.project.tcat.VO.TcatPerformanceVO;

public interface JMHGuestDAO {
	
	//아이디 찾기 이메일 전송
	public void sendIdMail(String member_email, String admit_code);
	//아이디 이메일 유효성
	public int  id_emailChk(Map<String,Object> map);
	//아이디 찾기
	public String  findIdPwd(Map<String,Object> map);
	
	
	
	//로그인 처리
	public int loginPro(Map<String,String> map);
	//접속일 갱신
	public void updateLastDate(Map<String,String> map);
	
	
	//회원정보 가져오기
	public MemberVO myPageInfo(Map<String,Object> map);
	//해당회원의 구매정보
	public ArrayList<TcatDiscBuyVO> memDiscBuy(Map<String,Object> map);
	
	
	//getPerfList 공연 리스트
	public ArrayList<TcatPerformanceVO> getPerfList(Map<String,Object> map);
	//getPerfListCnt 공연 갯수
	public int getPerfListCnt(Map<String,Object> map);
}
