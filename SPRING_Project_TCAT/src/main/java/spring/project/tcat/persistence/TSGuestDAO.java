package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.VO.TcatPerformanceVO;

public interface TSGuestDAO {
	
	
	// 회원정보 수정(비밀번호 체크)
	public int pwdCheck(Map<String, Object> map);

	// 회원정보 상세페이지
	public MemberVO myModify(String login_id);
	
	//회원정보 ID체크
	public MemberVO memberSelect(String id);
	
	//회원정보 수정
	public int updateMember(MemberVO vo);
	
	//관람후기 개수
	public int comment(Map<String, Object> map);
	//관람후기 목록
	public ArrayList<TcatBoardVO> commentBoard(Map<String, Object> map);
	
	// 게스트 관람/상품후기 등록
	public int commentWrite(TcatBoardVO vo);
	
	// 게스트 관람/후기(해당공연) 개수
	public int selectComment(Map<String, Object> map);
	
	// 게스트 관람/후기 (해당공연) 목록
	public ArrayList<TcatBoardVO> selectCommentBoard(Map<String,Object>map);
	
	// 게스트 상품/상품후기 등록
	public int commentWriteS(TcatBoardVO vo);
		
	// 게스트 상품/후기(해당공연) 개수
	public int selectCommentS(Map<String, Object> map);
		
	// 게스트상품/후기 (해당공연) 목록
	public ArrayList<TcatBoardVO> selectCommentBoardS(Map<String,Object>map);
	
}
