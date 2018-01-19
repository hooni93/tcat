package spring.project.tcat.persistence;

import java.util.ArrayList;

import spring.project.tcat.VO.TcatPerformanceVO;

public interface MoGuestDAO {

	//핫리스트 가져오기 
		public ArrayList<TcatPerformanceVO> hotList(String category);
}
