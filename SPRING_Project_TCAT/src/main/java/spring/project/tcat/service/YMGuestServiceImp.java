package spring.project.tcat.service;



import java.util.HashMap;
import java.util.Map;

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
		int cnt=0; //구매 갯수
		int upCnt=0; //등급업데이트
		int compare=0; //동적sql 비교
		String Rating="";//등급
		String strId = (String) req.getSession().getAttribute("login_id");
		System.out.println("Id:"+strId);
		//멤버아이디의 구매 갯수 출력
		cnt=YMDao.mRating(strId);
		Map<String,Object> map = new HashMap<String,Object>();
		if(cnt<10) {
			map.put("compare", 1);
			map.put("strId", strId);
			upCnt=YMDao.mRatingUpdate(map);
			System.out.println("upCnt1:-----"+upCnt);
			Rating="C";
			model.addAttribute("Rating", Rating);
		
		}else if(cnt<50) {
			map.put("compare", 2);
			map.put("strId", strId);
			upCnt=YMDao.mRatingUpdate(map);
			System.out.println("upCnt2:-----"+upCnt);
			Rating="B";
			model.addAttribute("Rating", Rating);
			model.addAttribute("cnt", cnt);
		}else if(cnt<100) {
			map.put("compare", 3);
			map.put("strId", strId);
			upCnt=YMDao.mRatingUpdate(map);
			System.out.println("upCnt3:-----"+upCnt);
			Rating="A";
			model.addAttribute("Rating", Rating);
			model.addAttribute("cnt", cnt);
		}else if(cnt<200) {
			map.put("compare", 4);
			map.put("strId", strId);
			upCnt=YMDao.mRatingUpdate(map);
			System.out.println("upCnt4:-----"+upCnt);
			Rating="VIP";
			model.addAttribute("Rating", Rating);
			model.addAttribute("cnt", cnt);
		}
		
	}
}
