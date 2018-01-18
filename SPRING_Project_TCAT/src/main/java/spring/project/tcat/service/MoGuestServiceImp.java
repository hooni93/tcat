package spring.project.tcat.service;

import java.util.ArrayList;

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
	
	
}
