package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.project.tcat.VO.TcatBoardVO;

public interface DKGuestDAO {
	
	//Q&A글갯수구하기
	public int getQnaBoardCnt(Map<String, Object> map); 
	
	//Q&A게시글 목록 조회
	public ArrayList<TcatBoardVO> getQnaBoardList(Map<String, Object> map);
	
	//상세페이지
	public TcatBoardVO getQnaContent(int service_num);
	
	//1:1게시판 글갯수 구하기
	public int getQnaOneToOneCnt(Map<String, Object> map); 
	
	//1:1게시판 게시글 목록조회
	public ArrayList<TcatBoardVO> getQnaOneToOneList(Map<String, Object> map);
	
	
	//조회수 증가
	//public void qnaReadCnt(int service_num);
	
	//비밀번호 확인
	
	//게시글 수정
	
	
}
