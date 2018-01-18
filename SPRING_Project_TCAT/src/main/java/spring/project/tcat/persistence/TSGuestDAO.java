package spring.project.tcat.persistence;

import java.util.Map;

import spring.project.tcat.VO.MemberVO;

public interface TSGuestDAO {
	
	//아이디 확인
	public int idCheck(String login_id); 
	// 회원정보 수정(비밀번호 체크)
	public int pwdCheck(Map<String, Object> map);

	// 회원정보 상세페이지
	public MemberVO myModify(String login_id);
	// host 구분
	public int HostCnt(String login_id);
	public int updateMember(MemberVO vo);
}
