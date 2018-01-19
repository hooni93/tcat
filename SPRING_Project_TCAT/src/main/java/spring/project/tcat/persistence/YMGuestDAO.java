package spring.project.tcat.persistence;

import java.util.Map;

public interface YMGuestDAO {
	
	//고객 구매횟수 
	public int mRating(String strId);
	//등급 업데이트
	public int mRatingUpdate(Map<String,Object> map);
}
