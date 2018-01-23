package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.config.Configuration;

@Repository
public class MoGuestDAOImp implements MoGuestDAO{
	
	//핫리스트 가져오기 
	public ArrayList<TcatPerformanceVO> hotList(String category){
		ArrayList<TcatPerformanceVO> dtos=null;
		MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		dtos=dao.hotList(category);
		return dtos;
	}
	//좌석정보 가져오기	

	@Override
	public ArrayList<TcatPerformanceVO> ticketSeat(Map<String,Object> map) {
		// TODO Auto-generated method stub
		ArrayList<TcatPerformanceVO> dtos=null;
		MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		dtos=dao.ticketSeat(map);
		return dtos;
	}
	
	//사진게시판 리스트 숫자 가져오기
	@Override
	public int photoBoarderListCnt() {
		// TODO Auto-generated method stub
		int cnt=0;
		MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		cnt=dao.photoBoarderListCnt();
		return cnt;
	}

	//사진게시판 리스트 가져오기
	@Override
	public ArrayList<TcatBoardVO> photoBoarderList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		 ArrayList<TcatBoardVO> dtos=null;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 dtos=dao.photoBoarderList(map);
		 return dtos;
	}

	//사진게시판 답글 올리기
	@Override
	public int photoBoarderCommentWrite(TcatBoardVO vo) {
		// TODO Auto-generated method stub
		int cnt=0;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 cnt=dao.photoBoarderCommentWrite(vo);
		return cnt;
	}
	
	//사진게시판 답글 가져오기
	
	
	
	
}
