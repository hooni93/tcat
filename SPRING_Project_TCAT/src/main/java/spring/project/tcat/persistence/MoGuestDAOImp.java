package spring.project.tcat.persistence;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.config.Configuration;

@Repository
public class MoGuestDAOImp implements MoGuestDAO{
	
	//핫리스트 가져오기 
	public ArrayList<TcatPerformanceVO> hotList(String category){
		ArrayList<TcatPerformanceVO> dtos=null;
		MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		dtos=dao.hotList(category);
		return dtos;
	}
}
