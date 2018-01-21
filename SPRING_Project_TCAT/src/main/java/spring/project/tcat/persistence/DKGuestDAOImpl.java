package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.config.Configuration;

@Repository
public class DKGuestDAOImpl implements DKGuestDAO{
	
	//글갯수구하기
	@Override
	public int getQnaBoardCnt() {
		int cnt=0;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		cnt = dao.getQnaBoardCnt();
		
		return cnt;
	}
	
	//게시글 목록 조회
	@Override
	public ArrayList<TcatBoardVO> getQnaBoardList(Map<String, Object> map) {
		ArrayList<TcatBoardVO> dtos = null;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		dtos = dao.getQnaBoardList(map);
		
		return dtos;
	}
	
	
	
}
