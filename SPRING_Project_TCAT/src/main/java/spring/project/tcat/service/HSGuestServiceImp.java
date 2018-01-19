package spring.project.tcat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.persistence.HSGuestDAO;

@Service
public class HSGuestServiceImp implements HSGuestService{
	
	@Autowired
	HSGuestDAO HSDao;

	@Override
	public void MemberIdCheack(HttpServletRequest req, Model model) {
		String member_id=req.getParameter("member_id");
		int IdCheack=0;
		IdCheack=HSDao.MemberIdCheack(member_id);
		req.setAttribute("IdCheack", IdCheack);
		req.setAttribute("member_id", member_id);
	}

	@Override
	public void insertMember(HttpServletRequest req, Model model) {
		String member_id=req.getParameter("member_id"); 		//아이디+
		String member_pwd=req.getParameter("member_pwd"); 		//비밀번호+
		String member_name=req.getParameter("member_name"); 		//이름+
		String member_hp=req.getParameter("member_hp"); 		//연락처+
		
		String postNum=req.getParameter("postNum");
		String detailAddr=req.getParameter("detailAddr");
		String addr=req.getParameter("addr"); 		//주소-daum주소검색
		String member_addr="["+postNum+"]"+addr+" "+detailAddr;
		
		String member_email=req.getParameter("member_email"); 		//이메일+
		String member_gender=req.getParameter("member_gender"); 		//성별
		String member_birth=req.getParameter("member_birth"); 		//생년월일
		
		MemberVO dto=new MemberVO();
		dto.setMember_addr(member_addr);
		dto.setMember_birth(member_birth);
		dto.setMember_email(member_email);
		dto.setMember_gender(member_gender);
		dto.setMember_hp(member_hp);
		dto.setMember_id(member_id);
		dto.setMember_name(member_name);
		dto.setMember_pwd(member_pwd);
		System.out.println(
				"member_addr:"+member_addr+"\n"+
				"member_birth:"+member_birth+"\n"+
				"member_email:"+member_email+"\n"+
				"member_gender:"+member_gender+"\n"+
				"member_hp:"+member_hp+"\n"+
				"member_id:"+member_id+"\n"+
				"member_pwd:"+member_pwd+"\n"
		);
		
		int cnt=0;
		cnt=HSDao.insertMember(dto);
		req.setAttribute("cnt", cnt);

	}
	

}
