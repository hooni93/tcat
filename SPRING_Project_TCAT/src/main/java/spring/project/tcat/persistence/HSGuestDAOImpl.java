package spring.project.tcat.persistence;

import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.config.Configuration;

@Repository
public class HSGuestDAOImpl implements HSGuestDAO{

	@Override
	public int MemberIdCheack(String member_id) {
		int IdCheack=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		IdCheack=dao.MemberIdCheack(member_id);
		return IdCheack;
	}

	@Override
	public int insertMember(MemberVO dto) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.insertMember(dto);
		return cnt;
	}



}
