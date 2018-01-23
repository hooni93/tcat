package spring.project.tcat.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.persistence.MoGuestDAOImp;

@Service
public class MoGuestServiceImp implements MoGuestService {

	@Autowired
	MoGuestDAOImp MGDao;
	//핫리스트 가져오기
	@Override
	public void hotList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		String category=null;
		category=req.getParameter("category");
		if(category==null) {
			category="뮤지컬";
		}
		ArrayList<TcatPerformanceVO> dtos=null;
		dtos=MGDao.hotList(category);
		model.addAttribute("dtos", dtos);
	}
	//좌석정보 가져오기
	@Override
	public void ticketSeat(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int per_id=Integer.parseInt(req.getParameter("per_id"));
		int round=Integer.parseInt(req.getParameter("round"));
		String ticet_date=req.getParameter("ticet_date");
		Map<String,Object> map=new HashMap<String,Object>();
		ArrayList<TcatPerformanceVO> dtos=null;
		map.put("per_id", per_id);
		map.put("round", round);
		map.put("ticet_date", ticet_date);
		dtos=MGDao.ticketSeat(map);
		model.addAttribute("dtos", dtos);

	}
	
	
	
	
}
