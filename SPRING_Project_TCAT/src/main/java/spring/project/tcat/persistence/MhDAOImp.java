package spring.project.tcat.persistence;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import spring.project.tcat.config.Configuration;

@Repository
public class MhDAOImp implements MhDAO{
	
	@Autowired
	private JavaMailSender mailSender;

	//아이디 찾기 이메일 전송
	@Override
	public void sendIdMail(String member_email, String admit_num) {
		try {
			SimpleMailMessage msg = new SimpleMailMessage();
			msg.setFrom("admin@Tcat.com");
			msg.setTo(member_email);
			msg.setSubject("아이디찾기 인증번호");
			msg.setText("인증번호 6자리: "+admit_num);
			
			mailSender.send(msg);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	//아이디 이메일 유효성
	public int  id_emailChk(Map<String,Object> map) {
		MhDAO dao = Configuration.getMapper(MhDAO.class);
		int cnt = dao.id_emailChk(map);
		return cnt;
	}

}
