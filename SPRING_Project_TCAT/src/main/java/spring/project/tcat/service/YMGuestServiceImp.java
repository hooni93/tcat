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
		int cnt=0; //구매 갯수
		int upCnt=0; //등급업데이트
		String Rating="";
		String strId = (String) req.getSession().getAttribute("login_id");
		System.out.println("Id:"+strId);
		//멤버아이디의 구매 갯수 출력
		cnt=YMDao.mRating(strId);

		if(cnt<10) {
			upCnt=YMDao.mRatingUpdate(strId);
			System.out.println("upCnt1:-----"+upCnt);
			Rating="C";
			model.addAttribute("Rating", Rating);
		
		}else if(cnt<50) {
			upCnt=YMDao.mRatingUpdate1(strId);
			System.out.println("upCnt2:-----"+upCnt);
			Rating="B";
			model.addAttribute("Rating", Rating);
		}else if(cnt<=1000) {
			
		}
		
	}
}
