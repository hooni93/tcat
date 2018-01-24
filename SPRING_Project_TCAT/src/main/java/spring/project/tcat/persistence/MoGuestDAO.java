package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.VO.TcatPerformanceVO;

public interface MoGuestDAO {

	//핫리스트 가져오기 
		public ArrayList<TcatPerformanceVO> hotList(String category);
	//좌석정보 가져오기	
		public ArrayList<TcatPerformanceVO> ticketSeat(Map<String,Object> map);
	//사진게시판 리스트 숫자 가져오기
		public int photoBoarderListCnt();
	//사진게시판 리스트 가져오기
		public ArrayList<TcatBoardVO> photoBoarderList(Map<String,Object> map);
	//사진게시판 답글 달기
		public int photoBoarderCommentWrite(TcatBoardVO vo);
	//사진게시판 답글 가져오기
		public ArrayList<TcatBoardVO> photoBoarderComment();
	//사진게시판 업로드
		public int insertPhotoBoarder(TcatBoardVO vo);
	//사진게시판 삭제
		public int photoBorderDelete(int notice_num);
	//사진게시판 수정
		public int noMoPhotoBoarder(TcatBoardVO vo);
		
}
