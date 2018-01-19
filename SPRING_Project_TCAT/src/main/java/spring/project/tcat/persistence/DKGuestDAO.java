package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.project.tcat.VO.TcatBoardVO;

public interface DKGuestDAO {
	
	//글갯수구하기
	public int getQnaBoardCnt(); 
	
	//게시글 목록 조회
	public ArrayList<TcatBoardVO> getQnaBoardList(Map<String, Object> map);
	
	
	//상세페이지
	
	//조회수 증가
	
	//비밀번호 확인
	
	//게시글 수정
	
	
}
