package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.CartVO;
import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatPerformanceVO;
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
	@Override
	public int searchDate(String searchDate) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		
		cnt=dao.searchDate(searchDate);
		return cnt;
	}
	@Override
	public int daySearchCnt(String searchDate) {
		int cnt=0;

		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		if(searchDate==null) {
			cnt=dao.daySearchCnt(searchDate);
		}else {
			cnt=dao.searchDate(searchDate);
		}
		System.out.println("cnt="+cnt);
		return cnt;
	}
	@Override
	public ArrayList<TcatPerformanceVO> searchList(Map<String,Object> map) {
		ArrayList<TcatPerformanceVO> dtos=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dtos=dao.searchList(map);
		return dtos;
	}
	@Override
	public ArrayList<TcatPerformanceVO> daySearchList(Map<String,Object> map) {
		ArrayList<TcatPerformanceVO> dtos=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		if(map.get("searchDate")==null) {
			dtos=dao.daySearchList(map);
		}else {
			dtos=dao.searchList(map);
		}
		
		return dtos;
	}
	//지역별 검색 리스트 갯수 가져오기 place가 null이 들어올때
	@Override
	public int placeNullCnt() {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.placeNullCnt();
		return cnt;
	}
	//지역별 검색 리스트 갯수 가져오기 place가 null이 아닐때
	@Override
	public int placeCnt(Map<String,Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		if(map.get("place")==null) {
			cnt=dao.placeNullCnt();
		}else {
			cnt=dao.placeCnt(map);
		}
		return cnt;
	}

	@Override
	public ArrayList<TcatPerformanceVO> placeNullList(Map<String, Object> map) {
		ArrayList<TcatPerformanceVO> dtos=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dtos=dao.placeNullList(map);
		return dtos;
	}

	@Override
	public ArrayList<TcatPerformanceVO> placeList(Map<String, Object> map) {
		ArrayList<TcatPerformanceVO> dtos=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		if(map.get("place")==null) {
			dtos=dao.placeNullList(map);
		}else {
			dtos=dao.placeList(map);
		}
		return dtos;
	}

	@Override
	public int insertCart(Map<String, Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.insertCart(map);
		return cnt;
	}

	@Override
	public int cartCnt(String member_id) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt =dao.cartCnt(member_id);
		return cnt;
	}

	@Override
	public ArrayList<CartVO> cartList(Map<String, Object> map) {
		ArrayList<CartVO> dtos=null;
		System.out.println("111");
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		System.out.println("222");
		dtos=dao.cartList(map);
		return dtos;
	}

	@Override
	public ArrayList<CartVO> cartListDtos(Map<String,Object> map) {
		ArrayList<CartVO> dtos=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dtos=dao.cartListDtos(map);
		return dtos;
	}

	@Override
	public void insertdelevaryInfo(Map<String, Object> map) {

		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dao.insertdelevaryInfo(map);

	}

	@Override
	public int maxdel_num() {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.maxdel_num();
		return cnt;
	}
	
	@Override
	public TcatPerformanceVO payList(int per_id) {
		TcatPerformanceVO vo=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		vo=dao.payList(per_id);
		return vo;
	}

	@Override
	public int vipCount(Map<String, Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.vipCount(map);
		return cnt;
	}

	@Override
	public int rCount(Map<String, Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.rCount(map);
		return cnt;
	}

	@Override
	public int sCount(Map<String, Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.sCount(map);
		return cnt;
	}

	@Override
	public int aCount(Map<String, Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.aCount(map);
		return cnt;
	}

	@Override
	public int bCount(Map<String, Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.bCount(map);
		return cnt;
	}

	@Override
	public void insertStorePay(Map<String, Object> map) {
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dao.insertStorePay(map);
	}

	@Override
	public void cartDel(String member_id) {
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dao.cartDel(member_id);
	}




}
