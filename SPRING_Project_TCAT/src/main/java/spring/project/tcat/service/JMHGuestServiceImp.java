package spring.project.tcat.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.project.tcat.persistence.JMHGuestDAO;

@Service
public class JMHGuestServiceImp implements JMHGuestService{
	@Autowired
	JMHGuestDAO mhDAO;
	
	
	//아이디,비밀번호 찾기
	@Override
	public void findIdPwd(HttpServletRequest req,Model model) {
		//웹에서 받아오기
		String member_email = req.getParameter("member_email");
		String member_name = req.getParameter("member_name");
		System.out.println("member_email: "+member_email+"/"+"member_name"+member_name);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("member_email", member_email);
		map.put("member_name", member_name);
		//DB에 해당 이메일과 이름이 존재하는 확인
		int id_emailChk = mhDAO.id_emailChk(map);	//1: 존재, 0: 존재x
		//웹으로 체크 결과 전송
		model.addAttribute("id_emailChk",id_emailChk);
		System.out.println("id_emailChk: "+id_emailChk);
		if(id_emailChk == 1) {
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for(int i = 0; i <6; i++) {
				int rIndex = rnd.nextInt(2);
				switch (rIndex) {
				case 0:
					//A~Z 글자 난수
					temp.append((char) ((int) (rnd.nextInt(26))+65));
					break;
				default:
					//0~9 숫자 난수
					temp.append((rnd.nextInt(10)));
					break;
				}
			}
			//6자 난수 받음
			String admit_num = temp.toString();
			//세션에 띄우기
			req.getSession().setAttribute("admit_num", admit_num);
			
			mhDAO.sendIdMail(member_email,admit_num);
		}
	}
	
	//아이디비밀번호 찾기 결과
	public void findResult(HttpServletRequest req,Model model) {
		
	}
}
