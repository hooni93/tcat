package spring.project.tcat.persistence;

import org.springframework.stereotype.Repository;


import spring.project.tcat.config.Configuration;

@Repository
public class YMGuestDAOImpl implements YMGuestDAO{

	@Override
	public int mRating(String strId) {
		int cnt=0;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		cnt=dao.mRating(strId);
		return cnt;
	}

}
