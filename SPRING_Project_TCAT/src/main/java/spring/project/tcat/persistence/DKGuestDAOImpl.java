package spring.project.tcat.persistence;

import org.springframework.stereotype.Repository;

import spring.project.tcat.config.Configuration;

@Repository
public class DKGuestDAOImpl implements DKGuestDAO{
	
	//글갯수구하기
	@Override
	public int qnaBoardCnt() {
		int cnt=0;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		cnt = dao.qnaBoardCnt();
		
		return cnt;
	}
	
}
