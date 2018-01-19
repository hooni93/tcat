package spring.project.tcat.persistence;



import org.springframework.stereotype.Repository;


import spring.project.tcat.config.Configuration;

@Repository
public class YMGuestDAOImpl implements YMGuestDAO{
	
	//고객 구매횟수
	@Override
	public int mRating(String strId) {
		int cnt=0;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		cnt=dao.mRating(strId);
		return cnt;
	}
	//등급 업데이트
	@Override
	public int mRatingUpdate(String strId) {
		int upCnt=0;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		upCnt=dao.mRatingUpdate(strId);
		return upCnt;
	}
	@Override
	public int mRatingUpdate1(String strId) {
		int upCnt=0;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		upCnt=dao.mRatingUpdate(strId);
		return upCnt;
	}

	

}
