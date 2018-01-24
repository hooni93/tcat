package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatDiscBuyVO;
import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.VO.WishListVO;
import spring.project.tcat.config.Configuration;

@Repository
public class JMHGuestDAOImp implements JMHGuestDAO {

	@Autowired
	private JavaMailSender mailSender;

	// 아이디 찾기 이메일 전송
	@Override
	public void sendIdMail(String member_email, String admit_code) {
		try {
			SimpleMailMessage msg = new SimpleMailMessage();
			msg.setFrom("admin@Tcat.com");
			msg.setTo(member_email);
			msg.setSubject("아이디찾기 인증번호");
			msg.setText("인증번호 6자리:  " + admit_code);

			mailSender.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 아이디 이메일 유효성
	@Override
	public int id_emailChk(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.id_emailChk(map);
		return cnt;
	}

	// 아이디 찾기
	@Override
	public String findIdPwd(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		String member = dao.findIdPwd(map);
		return member;
	}

	// 로그인 처리
	@Override
	public int loginPro(Map<String, String> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.loginPro(map);
		return cnt;
	}

	// 접속일 갱신
	@Override
	public void updateLastDate(Map<String, String> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		dao.updateLastDate(map);
	}

	// 회원정보 가져오기
	@Override
	public MemberVO myPageInfo(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		MemberVO memInfo = dao.myPageInfo(map);
		return memInfo;
	}

	// 해당회원의 구매정보
	@Override
	public ArrayList<TcatDiscBuyVO> memDiscBuy(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<TcatDiscBuyVO> memDiscBuyList = dao.memDiscBuy(map);
		return memDiscBuyList;
	}

	// getPerfList 공연 리스트
	public ArrayList<TcatPerformanceVO> getPerfList(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<TcatPerformanceVO> perfs = dao.getPerfList(map);
		return perfs;
	}

	// getPerfListCnt 공연 갯수
	public int getPerfListCnt(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.getPerfListCnt(map);
		return cnt;
	}

	// 스토어 리스트
	public ArrayList<TcatPerDiscVO> getStoreList(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<TcatPerDiscVO> discs = dao.getStoreList(map);
		return discs;
	}

	// 스토어 갯수
	public int getStoreListCnt(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.getStoreListCnt(map);
		return cnt;
	}

	// getContent 공연 상세정보 가져오기
	public TcatPerformanceVO getContent(int per_id) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		TcatPerformanceVO perf = dao.getContent(per_id);
		return perf;
	}

	// getContent_store 스토어 상세페이지
	public TcatPerDiscVO getContent_store(int disc_code) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		TcatPerDiscVO str = dao.getContent_store(disc_code);
		return str;
	}

	// 로그인 후 상세페이지 조회시 조회수 업
	public void upHits(int per_id) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		dao.upHits(per_id);
	}

	// getWishList 위시리스트
	public ArrayList<WishListVO> getWishList(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<WishListVO> wishs = dao.getWishList(map);
		return wishs;
	}
	// addWishList 위시리스트 추가
	public void addWishList(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		dao.addWishList(map);
	}
	// delWishList
	public void delWishList(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		dao.delWishList(map);
	}

	// getWishListIn 위시리스트 존배여부
	public int getWishListIn(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.getWishListIn(map);
		return cnt;
	}

	// buyCancel 결제 취소
	public int buyCancel(int disc_num) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.buyCancel(disc_num);
		return cnt;
	}

	// 환불요청
	public int perfRefund(int disc_num) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.perfRefund(disc_num);
		return cnt;
	}

}
