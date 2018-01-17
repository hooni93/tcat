package spring.project.tcat.persistence;

import java.util.Map;

public interface JMHGuestDAO {
	
	//아이디 찾기 이메일 전송
	public void sendIdMail(String member_email, String admit_num);
	//아이디 이메일 유효성
	public int  id_emailChk(Map<String,Object> map);
}
