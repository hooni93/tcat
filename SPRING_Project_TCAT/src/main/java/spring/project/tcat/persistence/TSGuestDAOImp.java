package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.config.Configuration;

@Repository
public class TSGuestDAOImp implements TSGuestDAO{
		
	// 회원정보 수정(비밀번호 체크)
	@Override
	public int pwdCheck(Map<String, Object> map) {
		TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);

		int pwdCheck=0;
		
		pwdCheck = dao.pwdCheck(map);
			
		
		return pwdCheck;
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




		@Override
		public MemberVO memberSelect(String id) {
			MemberVO vo=new MemberVO();
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			vo=dao.memberSelect(id);
			return vo;
		}



		// 관람후기 목록
		@Override
		public ArrayList<TcatBoardVO> commentBoard(Map<String, Object> map) {
			ArrayList<TcatBoardVO> dtos = null; // 큰 바구니
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			dtos = dao.commentBoard(map);
			System.out.println("===========================");
			for(int i =0; i<dtos.size(); i++) {
                String perf_image=dtos.get(i).getPerf_image();
                System.out.println("perf_image==="+perf_image);
             }
			System.out.println("===========================");
			return dtos;
		}
		// 관람후기 개수
		@Override
		public int comment(Map<String, Object> map) {
			int cnt = 0;
			
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			cnt = dao.comment(map);

			return cnt;
		}
		//고객단 후기 한줄평 쓰기
		@Override
		public int commentWrite(TcatBoardVO vo) {
			int cnt = 0;
			
			TSGuestDAO dao = Configuration.getMapper(TSGuestDAO.class);
			cnt = dao.commentWrite(vo);
			
			return cnt;
		}

}
