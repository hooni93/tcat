package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.project.tcat.persistence.YMGuestDAOImpl;
@Service
public class YMGuestServiceImp implements YMGuestService {

	@Autowired
	YMGuestDAOImpl YMDao;
	
	//회원등급관리
	@Override
	public void memberRating(HttpServletRequest req, Model model) {
		int cnt=0;
		String strId = (String) req.getSession().getAttribute("login_id");
		
		//멤버아이디의 구매 갯수 출력
		cnt=YMDao.mRating(strId);
		
		if(cnt==1) {
			
		}
		
	}
}
