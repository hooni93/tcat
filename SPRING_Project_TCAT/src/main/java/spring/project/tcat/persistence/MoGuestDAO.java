package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.project.tcat.VO.TcatPerformanceVO;

public interface MoGuestDAO {

	//핫리스트 가져오기 
		public ArrayList<TcatPerformanceVO> hotList(String category);
	//좌석정보 가져오기	
		public ArrayList<TcatPerformanceVO> ticketSeat(Map<String,Object> map);
		
}
