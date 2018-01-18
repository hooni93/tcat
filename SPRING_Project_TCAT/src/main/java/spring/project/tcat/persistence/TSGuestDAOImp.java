package spring.project.tcat.persistence;

import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.config.Configuration;

@Repository
public class TSGuestDAOImp implements TSGuestDAO{
	
	@Override
	public int idCheck(String login_id) {
		int cnt = 0;
		
		TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
		cnt = dao.idCheck(login_id);
		
     	return cnt;
	}

	@Override
	public int HostCnt(String login_id) {
		int hostCnt = 0;
		TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
		hostCnt = dao.HostCnt(login_id);
		
		return hostCnt;
	}
	// 회원정보 수정(비밀번호 체크)
	@Override
	public int pwdCheck(Map<String, Object> map) {
		int cnt = 0;
		TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
		
		int icnt = 0;
		
		icnt = dao.idCheck((String) map.get("login_id"));
		int hostCnt = 0;
		int pwdCheck=0;
		if(icnt > 0) {
			hostCnt = dao.HostCnt((String) map.get("login_id"));
			pwdCheck = dao.pwdCheck(map);
			
			if(pwdCheck >0) {
				cnt = hostCnt;
			}
			
		}else {
			cnt = -1;
		}
		System.out.println("DAO단 cnt --->:"+cnt);
		return cnt;
	}
	
	

	
	// 회원정보 수정
		@Override
		public MemberVO myModify(String login_id) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public int updateMember(MemberVO vo) {
			int cnt = 0;
			System.out.println("여기다 !!!!!");
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			cnt = dao.updateMember(vo);
			System.out.println("여기다 222222!!!!!");
			return cnt;
		}
	




}
