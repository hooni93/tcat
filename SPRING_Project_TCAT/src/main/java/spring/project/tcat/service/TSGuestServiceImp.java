package spring.project.tcat.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.persistence.TSGuestDAOImp;

@Service
public class TSGuestServiceImp implements TSGuestService{
	@Autowired
	TSGuestDAOImp tsGDAO;
	
	//회원정보 수정 비밀번호 체크
	@Override
	public void pwdCheck(HttpServletRequest req, Model model) {
		String strId = (String) req.getSession().getAttribute("login_id");
		String strPwd = req.getParameter("member_pwd");	
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("strId", strId);
		map.put("strPwd", strPwd);
		
		int pwdCheck = tsGDAO.pwdCheck(map);
		/*
		if(pwdCheck == 1 ) {
			MemberVO vo = tsGDAO.myModify(strId);
			model.addAttribute("vo", vo);
		}
		System.out.println("서비스단 pwdCheck --->:"+pwdCheck);*/
		model.addAttribute("pwdCheck", pwdCheck);
		
	}
	//회원정보 상세 페이지
		@Override
		public void myModifyPro(HttpServletRequest req, Model model) {
		MemberVO vo = new MemberVO();
		
		String id = (String) req.getSession().getAttribute("login_id");
		vo=tsGDAO.memberSelect(id);
		
		req.setAttribute("vo", vo);
	
		}
		@Override
		public void myModifyUpdate(HttpServletRequest req, Model model) {
			String id = (String) req.getSession().getAttribute("login_id");
			
			System.out.println("name"+req.getParameter("name"));
			MemberVO vo = new MemberVO();
			vo.setMember_id(id);
			vo.setMember_pwd(req.getParameter("member_pwd"));
			vo.setMember_name(req.getParameter("member_name"));
			String member_hp = "";
			String hp1 = req.getParameter("hp1");
			String hp2 = req.getParameter("hp2");
			String hp3 = req.getParameter("hp3");

			if (!hp1.equals("") && !hp2.equals("") && !hp3.equals("")) {
				member_hp = hp1 + "-" + hp2 + "-" + hp3;
			}
			vo.setMember_hp(member_hp);
			
			vo.setMember_addr(req.getParameter("member_addr"));
			
			String member_email = "";
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			member_email = email1 + "@" + email2;
			vo.setMember_email(member_email);
			
			/*vo.setMember_gender(req.getParameter("member_gender"));
			vo.setMember_birth(req.getParameter("member_birth"));*/
		
			System.out.println(
						"member_pwd"+vo.getMember_pwd()+"\n"+
						"member_name"+vo.getMember_name()+"\n"+
						"member_hp"+vo.getMember_hp()+"\n"+
						/*"member_addr"+vo.getMember_addr()+"\n"+*/
						"member_email"+vo.getMember_email()+"\n"
			);
			int cnt = tsGDAO.updateMember(vo);
			model.addAttribute("cnt",cnt);
			
		}

}
