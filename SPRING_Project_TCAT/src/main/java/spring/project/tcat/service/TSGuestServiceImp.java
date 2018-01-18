package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.project.tcat.persistence.TSGuestDAOImp;

@Service
public class TSGuestServiceImp implements TSGuestService{
	@Autowired
	TSGuestDAOImp tsGDAO;
	
	//회원정보 수정
	@Override
	public void myModify(HttpServletRequest req, Model model) {
		
		
	}

}
