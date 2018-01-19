package spring.project.tcat.persistence;

import spring.project.tcat.VO.MemberVO;

public interface HSGuestDAO {
	public int MemberIdCheack(String member_id);
	
	public int insertMember(MemberVO dto);
}
