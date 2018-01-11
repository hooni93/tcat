package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.config.Configuration;

@Repository
public class HostDAOImp implements HostDAO {
	
	//////////////////////////////////////18.01.11 명훈//////////////////////////////////////////////////
	//출력할 공연상품 갯수 가져오기
	@Override
	public int perProductCnt(Map<String, Object> map) {
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		int cnt = dao.perProductCnt(map);
		return cnt;
	}
	
	//출력할 스토어상품 갯수 가져오기
	@Override
	public int storeProductCnt(Map<String, Object> map) {
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		int cnt = dao.storeProductCnt(map);
		return cnt;
	}
	// 공연 상품 출력
	@Override
	public ArrayList<TcatPerformanceVO> perProduct(Map<String, Object> map) {
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		ArrayList<TcatPerformanceVO> performances = dao.perProduct(map);
		return performances;
	}
	//스토어 상품 출력
	@Override
	public ArrayList<TcatPerDiscVO> storeProduct(Map<String, Object> map) {
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		ArrayList<TcatPerDiscVO> discs = dao.storeProduct(map);
		return discs;
	}
	//////////////////////////////////////18.01.11 명훈//////////////////////////////////////////////////
	
	/////////////////////////////////// 태성 1/9 start /////////////////////////////////////////
	// 카테고리별 상품개수
	@Override
	public int getCate(String category) {
	
	int cnt = 0;
	System.out.println("ServiceImpl - category:" + category);
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	cnt = dao.getCate(category);
	
	return cnt;
	}
	
	// 스토어 상품 개수
	@Override
	public int getStore(String category) {
	
	int cnt = 0;
	System.out.println("ServiceImpl - category:" + category);
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	cnt = dao.getStore(category);
	
	return cnt;
	}
	
	@Override
	public int getArticleCnt(String Hcnt) {
	int cnt = 0;
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	cnt = dao.getStore(Hcnt);
	return cnt;
	}
	
	// 카테고리별 출력문
	public ArrayList<TcatPerformanceVO> musiList(Map<String, Object> map) {
	ArrayList<TcatPerformanceVO> dtos = null; // 큰 바구니
	
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	dtos = dao.musiList(map);
	
	return dtos;
	}
	
	// 스토어 출력문
	public ArrayList<TcatPerformanceVO> storeList(Map<String, Object> map) {
	ArrayList<TcatPerformanceVO> dtos = null; // 큰 바구니
	
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	dtos = dao.storeList(map);
	
	return dtos;
	}
	
	// 상품 진열
	@Override
	public ArrayList<TcatPerformanceVO> getArticleList(Map<String, Object> map) {
	ArrayList<TcatPerformanceVO> dtos = null; // 큰 바구니
	String Hcnt =(String)map.get("Hcnt");
	map.put("s", Hcnt);
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	dtos = dao.storeList(map);
	return dtos;
	}
	/////////////////////////////////// 태성 1/9 end /////////////////////////////////////////
	
	/////////////////////////////////// 태성 1/10 start /////////////////////////////////////////
	// 우선순위 수정(스토어제외)
	@Override
	public int Cfirst_grade(Map<String, String > map) {
	int cnt=0;
	
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	cnt = dao.Cfirst_grade(map);
	
	return cnt;
	}
	// 우선순위 수정(스토어만)
	@Override
	public int Sfirst_grade(Map<String, String > map) {
	int scnt = 0;
	
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	scnt = dao.Sfirst_grade(map);
	
	return scnt;
	}
	/////////////////////////////////// 태성 1/10 end /////////////////////////////////////////
	
	////////////////////////////////////현석 1/11  //////////////////////////////////////////

	@Override
	public int performanceCnt() {
		int cnt=0;
		
		HostDAO dao=Configuration.getMapper(HostDAO.class);
		cnt=dao.performanceCnt();
		
		return cnt;
	}

	@Override
	public ArrayList<TcatPerformanceVO> performanceList(Map<String, Integer> map) {
		ArrayList<TcatPerformanceVO> dtos=null;
		HostDAO dao=Configuration.getMapper(HostDAO.class);
		dtos=dao.performanceList(map);
		return dtos;
	}

	@Override
	public void insertPerformance(Map<String,Object> map) {
		HostDAO dao=Configuration.getMapper(HostDAO.class);
		dao.insertPerformance(map);
	}

	@Override
	public void insertRemainingSeat(Map<String,Object> map) {
		HostDAO dao=Configuration.getMapper(HostDAO.class);
		dao.insertRemainingSeat(map);
	}

	@Override
	public int selectPer_id() {
		int per_id=0;
		HostDAO dao=Configuration.getMapper(HostDAO.class);
		per_id=dao.selectPer_id();
		return per_id;
	}

	@Override
	public int perDiscCnt() {
		int cnt=-0;
		HostDAO dao=Configuration.getMapper(HostDAO.class);
		cnt=dao.perDiscCnt();
		return cnt;
	}

	@Override
	public ArrayList<TcatPerDiscVO> perDiscList(Map<String,Object> map) {
		ArrayList<TcatPerDiscVO> desc=null;
		HostDAO dao=Configuration.getMapper(HostDAO.class);
		desc=dao.perDiscList(map);
		return desc;
	}

	@Override
	public void insertStore(TcatPerDiscVO dto) {
		HostDAO dao=Configuration.getMapper(HostDAO.class);
		dao.insertStore(dto);		
	}
	////////////////////////////////////현석 1/11  end//////////////////////////////////////////
	
	////////////////  HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-11 성영민  ///////////////
	//hotlist
		@Override
		public ArrayList<TcatPerformanceVO> hotList() {
			ArrayList<TcatPerformanceVO> dtos=null;
			
			System.out.println("hotDao");
			HostDAO dao= Configuration.getMapper(HostDAO.class);
			dtos=dao.hotList();
			return dtos;
		}
	//////////////// HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-11 성영민  //////////////
	
		///////////////////////  동금 1/9  ///////////////////////////
		//상품갯수 불러오기
		@Override
		public int getPerfoCnt() {
			int cnt=0;
			
			HostDAO dao = Configuration.getMapper(HostDAO.class);
			cnt = dao.getPerfoCnt();
			
			return cnt;
		}
		
		//상품리스트 불러오기
		/*@Override
		public ArrayList<TcatPerformanceVO> getPerfo(Map<String, Integer> map) {
			System.out.println("stockDelete11");
			ArrayList<TcatPerformanceVO> dtos = null;
			System.out.println("stockDelete12");
			HostDAO dao = Configuration.getMapper(HostDAO.class);
			dtos = dao.getPerfo(map);
			System.out.println("stockDelete13");
			
			return dtos;
		}*/
		///////////////////////  동금 1/9  ///////////////////////////

}
