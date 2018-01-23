package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.config.Configuration;

@Repository
public class DKGuestDAOImpl implements DKGuestDAO{
	
	//Q&A글갯수구하기
	@Override
	public int getQnaBoardCnt(Map<String, Object> map) {
		int cnt=0;
		System.out.println("qnaBoardList7");
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		System.out.println("qnaBoardList8");
		cnt = dao.getQnaBoardCnt(map);
		System.out.println("qnaBoardList9");
		return cnt;
	}
	
	//Q&A게시글 목록 조회
	@Override
	public ArrayList<TcatBoardVO> getQnaBoardList(Map<String, Object> map) {
		ArrayList<TcatBoardVO> dtos = null;
		System.out.println("qnaBoardList9_1");
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		dtos = dao.getQnaBoardList(map);
		System.out.println("qnaBoardList10");
		return dtos;
	}
	
	//상세페이지
	@Override
	public TcatBoardVO getQnaContent(int service_num) {
		TcatBoardVO dto = null;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		dto = dao.getQnaContent(service_num);
		
		return dto;
	}
	
	//1:1게시판 글갯수 구하기
	@Override
	public int getQnaOneToOneCnt(Map<String, Object> map) {
		int cnt=0;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		cnt = dao.getQnaOneToOneCnt(map);
		
		return cnt;
	}
	
	//1:1게시판 게시글 목록조회
	@Override
	public ArrayList<TcatBoardVO> getQnaOneToOneList(Map<String, Object> map) {
		ArrayList<TcatBoardVO> dtos = null;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		dtos = dao.getQnaOneToOneList(map);
		
		return dtos;
	}
	
	
	
	
	//조회수 증가
	/*@Override
	public void qnaReadCnt(int service_num) {
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		dao.qnaReadCnt(service_num);
		
	}*/
	
	
	
}
