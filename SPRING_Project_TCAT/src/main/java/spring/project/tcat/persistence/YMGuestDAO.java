package spring.project.tcat.persistence;


public interface YMGuestDAO {
	
	//고객 구매횟수 
	public int mRating(String strId);
	//등급 업데이트
	public int mRatingUpdate(String strId);
	public int mRatingUpdate1(String strId);
}
