package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.project.tcat.VO.TcatBoardVO;

public interface DKGuestDAO {
	
	//글갯수구하기
	public int getQnaBoardCnt(Map<String, Object> map); 
	
	//게시글 목록 조회
	public ArrayList<TcatBoardVO> getQnaBoardList(Map<String, Object> map);
	
	//상세페이지
	//public TcatBoardVO getQnaContent(int service_num);
	
	//조회수 증가
	//public void qnaReadCnt(int service_num);
	
	//비밀번호 확인
	
	//게시글 수정
	
	
}
