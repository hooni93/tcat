package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;

public interface HostDAO {

	//////////////////////////////////////18.01.11 명훈//////////////////////////////////////////////////
	//출력할 공연상품 갯수 가져오기
	public int perProductCnt(Map<String, Object> map);
	//출력할 스토어상품 갯수 가져오기
	public int storeProductCnt(Map<String, Object> map);
	//공연 상품 출력
	public ArrayList<TcatPerformanceVO> perProduct(Map<String, Object> map);
	//스토어 상품 출력
	public ArrayList<TcatPerDiscVO> storeProduct(Map<String, Object> map);
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	/////////////////////////////////// 태성 1/9 start /////////////////////////////////////////
	//상품 개수 구하기
	public int getArticleCnt(int Hcnt);
	//상품 목록 출력 진열
	public ArrayList<TcatPerformanceVO> getArticleList(Map<String, Object> map);
	//카테고리 상품 개수
	public int getCate(String category);
	//스토어 상품 개수 
	public int getStore(String category) ;
	//카테고리별 출력(스토어 제외)
	public ArrayList<TcatPerformanceVO> musiList(Map<String, Object> map);
	//카테고리별 출력(스토어만)
	public ArrayList<TcatPerformanceVO> storeList(Map<String, Object> map);
	////////////////////////////////////태성 1/9 end //////////////////////////////////////////
	
	////////////////////////////////////태성 1/10 start ///////////////////////////////////////
	//우선순위 수정
	public int Cfirst_grade(Map<String, String > map);
	public int Sfirst_grade(Map<String, String > map);	
	
	////////////////////////////////////태성 1/10 end //////////////////////////////////////////
	
	////////////////////////////////////현석 1/11  //////////////////////////////////////////
	//공연정보 갯수 구하기
	public int performanceCnt();
	//공연정보 리스트 구하기
	public ArrayList<TcatPerformanceVO> performanceList(Map<String,Integer> map);
	//공연정보 추가하기
	public void insertPerformance(Map<String,Object> map);
	//날짜별 잔여석 정보 추가
	public void insertRemainingSeat(Map<String,Object> map);
	//최근 insert한 per_id가져오기
	public int selectPer_id();
	/*//스토어 갯수 구하기
	public int perDiscCnt();
	//스토어 리스트 가져오기
	public ArrayList<TcatPerDiscVO> perDiscList(Map map);
	//스토어 재고 추가
	public void insertStore(TcatPerDiscVO dto);*/
	////////////////////////////////////현석 1/11 end //////////////////////////////////////////
	
	/*  HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-11 성영민  */
	public ArrayList <TcatPerformanceVO>hotList();
	/*  HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-11 성영민  */
	
	
	///////////////////////  동금 1/11  ///////////////////////////
	//상품갯수 불러오기
	public int getPerfoCnt();
	
	//상품리스트 불러오기
	//public ArrayList<TcatPerformanceVO> getPerfo(Map<String, Integer> map);
	///////////////////////  동금 1/11 end ///////////////////////////
	
	
	
	
}
