package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.CategoryVO;
import spring.project.tcat.VO.HostVO;
import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.ProductRankVO;
import spring.project.tcat.VO.SaleVO;
import spring.project.tcat.VO.SelectHellInfoVO;
import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.VO.TcatDiscBuyVO;
import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.VO.TcatTicketingVO;
import spring.project.tcat.VO.detailPageVO;
import spring.project.tcat.config.Configuration;

@Repository
public class HostDAOImp implements HostDAO {

	//최근 가입 회원 숫자
	@Override
	public int latelyJoinMemberCnt(Map<String,Object> map) {
		// TODO Auto-generated method stub
		int cnt=0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		System.out.println(map.get("today"));
		System.out.println(map.get("yesterday"));
		cnt=dao.latelyJoinMemberCnt(map);
		System.out.println("=========="+cnt);
		return cnt;
	}
	//최근 가입 회원 리스트
	@Override
	public ArrayList<MemberVO> latelyJoinMember(Map<String, Object> map) {
		// TODO Auto-generated method stub
		ArrayList<MemberVO> dtos=null;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		dtos=dao.latelyJoinMember(map);
		return dtos;
	}
	//휴면카테고리 회원 리스트 숫자
	@Override
	public int sleepMemberCnt(int Hcnt) {
		// TODO Auto-generated method stub
		int cnt=0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt=dao.sleepMemberCnt(Hcnt);
		return cnt;
	}
	//휴면카테고리 회원 리스트
	@Override
	public ArrayList<MemberVO> sleepMember(Map<String, Object> map) {
		// TODO Auto-generated method stub
		ArrayList<MemberVO> dtos=null;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		dtos=dao.sleepMember(map);
		return dtos;
	}
	
	//휴면회원처리
	@Override
	public int sleepMemberPro(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int cnt=0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt=dao.sleepMemberPro(map);
		return cnt;
	}

	//검색수량
	@Override
	public int memberManagerSerchListCnt(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int cnt=0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt=dao.memberManagerSerchListCnt(map);
		System.out.println("검색수량: "+ cnt);
		return cnt;
	}
	
	
	
	//검색리스트
	@Override
	public ArrayList<MemberVO> memberManagerSerchList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		ArrayList<MemberVO> dtos=null;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		dtos=dao.memberManagerSerchList(map);
		return dtos;
	}
	//지역인서트 넘버키 가져오기
	@Override
	public int placeNum() {
		// TODO Auto-generated method stub
		int cnt=0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt=dao.placeNum();
		return cnt;
	}
	//지역정보 인서트
	@Override
	public int placeInsert(TcatPerformanceVO vo) {
		// TODO Auto-generated method stub
		int cnt=0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt=dao.placeInsert(vo);
		return cnt;
	}

	@Override
	public int insertHall(TcatPerformanceVO vo) {
		// TODO Auto-generated method stub
		int cnt=0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt=dao.insertHall(vo);
		return cnt;
	}
	
	@Override
	public int hallDeleteCnt() {
		// TODO Auto-generated method stub
		int cnt=0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt=dao.hallDeleteCnt();
		return cnt;
	}
	
	@Override
	public ArrayList<TcatPerformanceVO> hallDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		ArrayList<TcatPerformanceVO> dtos=null;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		dtos=dao.hallDelete(map);
		return dtos;
	}
	
	@Override
	public ArrayList<TcatPerformanceVO> hallSerchList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		ArrayList<TcatPerformanceVO> dtos=null;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		dtos=dao.hallSerchList(map);
		return dtos;
	}
	

	@Override
	public int hallSerchListCnt(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int cnt=0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt=dao.hallSerchListCnt(map);
		return cnt;
	}
	
	//플레이스 삭제
	@Override
	public int placeDeletePro(Map<String,Object> map) {
		int cnt=0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt=dao.placeDeletePro(map);
		return cnt;
	}
	//공연장 삭제
	@Override
	public int hallDeletePro(Map<String,Object> map){
		int cnt=0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt=dao.hallDeletePro(map);
		return cnt;
	}

	@Override
	public TcatPerformanceVO hallModifyDB(String hall_id) {
		// TODO Auto-generated method stub
		TcatPerformanceVO vo=new TcatPerformanceVO();
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		vo=dao.hallModifyDB(hall_id);
		return vo;
	}
	
	@Override
	public int placeUpdate(TcatPerformanceVO vo) {
		// TODO Auto-generated method stub
		int cnt=0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt=dao.placeUpdate(vo);
		return cnt;
	}
	@Override
	public int hallModifyUpdate(TcatPerformanceVO vo) {
		// TODO Auto-generated method stub
		int cnt=0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt=dao.hallModifyUpdate(vo);
		return cnt;
	}
	
	
	//////////////////////////////////////18.01.16 명훈//////////////////////////////////////////////////
	//출력할 공연상품 갯수 가져오기
	@Override
	public int perProductCnt(Map<String, Object> map) {
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		int cnt = dao.perProductCnt(map);
		return cnt;
	}
	//출력할 스토어상품 갯수 가져오기
	//스토어 상품 갯수
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
	//공연 상품 상세정보 - 1건
	@Override
	public TcatPerformanceVO productDetail_perf(int perf_id){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		TcatPerformanceVO perf = dao.productDetail_perf(perf_id);
		return perf;
	}
	//스토어 상품 상세정보 - 1건
	@Override
	public TcatPerDiscVO productDetail_store(int disc_code){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		TcatPerDiscVO disc = dao.productDetail_store(disc_code);
		return disc;
	}
	//주문목록 갯수 출력
	@Override
	public int orderListCnt(Map<String, Object> map){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		int cnt = dao.orderListCnt(map);
		return cnt;
	}
	//공연 주문목록(티켓팅)
	@Override
	public ArrayList<TcatTicketingVO> orderList(Map<String, Object> map){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		ArrayList<TcatTicketingVO> orders = dao.orderList(map);
		return orders;
	}
	//스토어 상품 주문목록 갯수
	@Override
	public int orderList_storeCnt(Map<String, Object> map) {
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		int cnt = dao.orderList_storeCnt(map);
		return cnt;
	}
	//스토어 상품 주문목록
	@Override
	public ArrayList<TcatDiscBuyVO> orderList_store(Map<String, Object> map){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		ArrayList<TcatDiscBuyVO> orders = dao.orderList_store(map);
		return orders;
	}
	//////////////////////////////////////18.01.16 명훈 끝//////////////////////////////////////////////////
	//////////////////////////////////////18.01. 명훈 시작 미완//////////////////////////////////////////////////
	//상품 랭크 getProductRank_perfCnt
	@Override
	public int getProductRank_perfCnt(){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		int cnt = dao.getProductRank_perfCnt();
		return cnt;
	}
	//상품 랭크 getProductRank_perfCnt
	@Override
	public ArrayList<ProductRankVO > productRank_perf(int productNum){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		ArrayList<ProductRankVO> ranks = dao.productRank_perf(productNum);
		return ranks;
	}
	@Override
	public int getProductRank_storeCnt(){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		int cnt = dao.getProductRank_storeCnt();
		return cnt;
	}
	@Override
	//상품 랭크 getProductRank_perfCnt
	public ArrayList<ProductRankVO > productRank_store(int productNum){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		ArrayList<ProductRankVO> ranks = dao.productRank_store(productNum);
		return ranks;
	}
	//중분류 랭크
	@Override
	public ArrayList<ProductRankVO > mDevRank(){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		ArrayList<ProductRankVO> mDevRank = dao.mDevRank();
		return mDevRank;
	}
	//소분류 랭크
	@Override
	public ArrayList<ProductRankVO > sDevRank(String mDev){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		ArrayList<ProductRankVO> sDevRank = dao.sDevRank(mDev);
		return sDevRank;
	}
	//mDevRank_store 스토어 중분류
	@Override
	public ArrayList<ProductRankVO > mDevRank_store(){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		ArrayList<ProductRankVO> mDevRank = dao.mDevRank_store();
		return mDevRank;
	}
	//스토어 소분류
	@Override
	public ArrayList<ProductRankVO > sDevRank_store(String mDev){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		ArrayList<ProductRankVO> sDevRank = dao.sDevRank_store(mDev);
		return sDevRank;
	}
	
	//환불 랭크 개수
	public int returnRank_perfCnt() {
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		int cnt = dao.returnRank_perfCnt();
		return cnt;
	}
	//환불 랭크 리스트
	public ArrayList<ProductRankVO > returnRank_perf(int productNum){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		ArrayList<ProductRankVO> ranks = dao.returnRank_perf(productNum);
		return ranks;
	}
	
	//스토어 환불 랭크
	@Override
	public int returnRank_storeCnt() {
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		int cnt = dao.returnRank_storeCnt();
		return cnt;
	}
	//스토어 환불 랭크
	@Override
	public ArrayList<ProductRankVO > returnRank_store(int productNum){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		ArrayList<ProductRankVO> ranks = dao.returnRank_store(productNum);
		return ranks;
	}
	
	//장바구니랭크 갯수
	public int cartRankCnt() {
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		int cnt = dao.cartRankCnt();
		return cnt;
	}
	//장바구니 랭크 리스트
	public ArrayList<ProductRankVO > cartRank(int productNum){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		ArrayList<ProductRankVO> ranks = dao.cartRank(productNum);
		return ranks;
	}
	
	//위시리스트 갯수
	public int wishListRank_perfCnt() {
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		int cnt = dao.wishListRank_perfCnt();
		return cnt;
	}
	//위시리스트 리스트
	public ArrayList<ProductRankVO > wishListRank_perf(int productNum){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		ArrayList<ProductRankVO> ranks = dao.wishListRank_perf(productNum);
		return ranks;
	}
	//위시리스트 스토어 갯수
	public int wishListRank_storeCnt() {
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		int cnt = dao.wishListRank_storeCnt();
		return cnt;
	}
	//위시리스트 스토어 리스트
	public ArrayList<ProductRankVO > wishListRank_store(int productNum){
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		ArrayList<ProductRankVO> ranks = dao.wishListRank_store(productNum);
		return ranks;
	}
	//////////////////////////////////////18.01.15 명훈 끝//////////////////////////////////////////////////
	
	


	/////////////////////////////////// 태성 1/9 start
	
	// 카테고리별 상품개수
	@Override
	public int getCate(Map<String, Object> map) {

		int cnt = 0;
		
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt = dao.getCate(map);

		return cnt;
	}

	// 스토어 상품 개수
	@Override
	public int getStore(Map<String, Object> map) {

		int cnt = 0;
		
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt = dao.getStore(map);

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
		String Hcnt = (String) map.get("Hcnt");
		System.out.println("Hcnt : _____" + Hcnt);
		if(Hcnt==null) {
			map.put("Hcnt", "뮤지컬");
		}
		map.put("s", Hcnt);
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		if (Hcnt.equals("스토어")) {
			dtos = dao.storeList(map);
		} else {
			dtos = dao.musiList(map);
		}
		return dtos;
	}
	/////////////////////////////////// 태성 1/9 end
	/////////////////////////////////// /////////////////////////////////////////

	/////////////////////////////////// 태성 1/10 start
	/////////////////////////////////// /////////////////////////////////////////
	// 우선순위 수정(스토어제외)
	@Override
	public int Cfirst_grade(Map<String, String> map) {
		int cnt = 0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt = dao.Cfirst_grade(map);

		return cnt;
	}

	// 우선순위 수정(스토어만)
	@Override
	public int Sfirst_grade(Map<String, String> map) {

		int scnt = 0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		scnt = dao.Sfirst_grade(map);

		return scnt;
	}
	
	@Override
	public int Cstep(Map<String, String> map) {
		
		int cnt =0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt = dao.Cstep(map);
		
		return cnt;
	}

	@Override
	public int Sstep(Map<String, String> map) {
		int scnt = 0;
		
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		scnt = dao.Sstep(map);

		return scnt;
	}
	/////////////////////////////////// 태성 1/10 end
	
		
		///////////////////////  태성 1/12 start /////////////////////
		//스토어 개수
		@Override
		public int stockStore(Map<String, Object> map) {
			int cnt = 0;
			System.out.println("ServiceImpl - category:" + map);
			HostDAO dao = Configuration.getMapper(HostDAO.class);
			cnt = dao.stockStore(map);
			return cnt;
		}
		//수정재고관리 카테고리별 출력(스토어만)
		@Override
		public ArrayList<TcatPerDiscVO> stockManageListstore(Map<String, Object> map) {
			ArrayList<TcatPerDiscVO> dtos = null; // 큰 바구니
			String Hcnt = (String) map.get("Hcnt");
			map.put("s", Hcnt);
			HostDAO dao = Configuration.getMapper(HostDAO.class);
			dtos = dao.stockManageListstore(map);

			return dtos;
		}
		
		//클릭시 그 해당하는 disc_code만 갯수 
		@Override
		public int clickStockCnt(int disc_code) {
			int cnt = 0;
			
			HostDAO dao = Configuration.getMapper(HostDAO.class);
			cnt = dao.clickStockCnt(disc_code);
			
			return cnt;
		}
		//클릭시 그 해당하는 disc_code만 출력
		@Override
		public ArrayList<TcatPerDiscVO> clickStockList(Map<String, Object> map) {
			ArrayList<TcatPerDiscVO> dtos = null; // 큰 바구니
			
			HostDAO dao = Configuration.getMapper(HostDAO.class);
			dtos = dao.clickStockList(map);
			
			return dtos;
			
		}	
		
		//재고 수정(update문)
		@Override
		public void updateStock(Map<String, Object> map) {
			
			HostDAO dao = Configuration.getMapper(HostDAO.class);
			dao.updateStock(map);
			
		}
///////////////////////  태성 1/12  end ///////////////////////

		

	

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
		
		//2018.01.14-----------------------------------------------------------------

		@Override
		public ArrayList<CategoryVO> cateList() {
			ArrayList<CategoryVO> dtos=null;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			dtos=dao.cateList();
			return dtos;
		}

		@Override
		public ArrayList<SelectHellInfoVO> HellList() {
			ArrayList<SelectHellInfoVO> dtos=null;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			dtos=dao.HellList();
			return dtos;
		}
		
		@Override
		public ArrayList<CategoryVO> cateListStore() {
			ArrayList<CategoryVO> dtos=null;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			dtos=dao.cateListStore();
			return dtos;
		}
		//상세페이지 찾아오기
		@Override
		public int SearchDetail_num() {
			int detail_num=0;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			detail_num=dao.SearchDetail_num();
			return detail_num;
		}
		//상세페이지 찾아오기 [store]
		@Override
		public int SearchDetail_numStore() {
			int detail_num=0;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			detail_num=dao.SearchDetail_numStore();
			return detail_num;
		}
		@Override
		public void insertDetailP_DEFAULT(int detail_num) {
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			dao.insertDetailP_DEFAULT(detail_num);
		}
		//2018-01-15---------------------------------------------------
		@Override
		public int member_cnt() {
			int cnt=0;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			cnt=dao.member_cnt();
			return cnt;
		}
		@Override
		public ArrayList<MemberVO> member_list(Map<String, Object> map) {
			ArrayList<MemberVO> dtos=null;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			dtos=dao.member_list(map);
			return dtos;
		}
		@Override
		public MemberVO detailMember(String member_id) {
			MemberVO dto=new MemberVO();
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			dto=dao.detailMember(member_id);
			return dto;
		}
		
		@Override
		public int detailMember_update(MemberVO dto) {
			int cnt=0;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			cnt=dao.detailMember_update(dto);
			return cnt;
		}
		//2018-01-16--------------------------------------------------------
		@Override
		public int HostPlus(Map<String, Object> map) {
			int cnt=0;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			cnt=dao.HostPlus(map);
			return cnt;
		}
		@Override
		public int HostIdCheack(String host_id) {
			int cnt=0;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			cnt=dao.HostIdCheack(host_id);
			return cnt;
		}

		@Override
		public int HostMemberListCnt() {
			int cnt=0;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			cnt=dao.HostMemberListCnt();
			return cnt;
		}
		
		@Override
		public ArrayList<HostVO> HostMemberList(Map<String, Object> map) {
			ArrayList<HostVO> dtos=null;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			dtos=dao.HostMemberList(map);
			return dtos;
		}

		@Override
		public int deleteHost(String host_id) {
			int cnt=0;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			cnt=dao.deleteHost(host_id);
			return cnt;
		}
		
		@Override
		public detailPageVO detaillist(int detail_num) {
			detailPageVO dto=null;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			dto=dao.detaillist(detail_num);
			return dto;
		}
		@Override
		public void updateDetail(Map<String, Object> map) {
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			dao.updateDetail(map);
		}
		////////////////////////////////////현석 1/11  end//////////////////////////////////////////
		
	
	////////////////  HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-11 성영민  ///////////////
	
	//hot 갯수 출력
	@Override
	public int hotArticleCnt() {
		int hotCnt=0;
		HostDAO dao= Configuration.getMapper(HostDAO.class);
		hotCnt=dao.hotArticleCnt();
	
		return hotCnt;
	}
	//예매 갯수 출력
	@Override
	public int hotNoArticleCnt(Map<String,Object> map2) {
		int cnt=0;
		HostDAO dao= Configuration.getMapper(HostDAO.class);
		cnt=dao.hotNoArticleCnt(map2);
		return cnt;
	}
	//hotlist
		@Override
		public ArrayList<TcatPerformanceVO> hotList() {
			ArrayList<TcatPerformanceVO> dtos=null;
			
			System.out.println("hotDao");
			HostDAO dao= Configuration.getMapper(HostDAO.class);
			dtos=dao.hotList();
			return dtos;
		}
	//hotUpdate
		@Override
		public int hotUpdate(int per_id) {
			int cnt =0;
			HostDAO dao = Configuration.getMapper(HostDAO.class);
			
			cnt=dao.hotUpdate(per_id);
			return cnt;
			
		}
		//hotLast
		@Override
		public ArrayList<TcatPerformanceVO> hotLast(Map<String,Object> map) {

			ArrayList<TcatPerformanceVO> vo=null;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			
			vo=dao.hotLast(map);
			
		//int a=(int)vo.get(1).getPer_id();
			
			System.out.println("===================");
			return vo;
			
		}
		//hot카테고리 내리기
		@Override
		public int hotDeleteList(int strPer_id) {
			int deleteCnt=0;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			deleteCnt=dao.hotDeleteList(strPer_id);
			return deleteCnt;
		}
		//hot카테고리 올리기
		@Override
		public int hotUpdateList(int strPer_id) {
			int updateCnt=0;

			HostDAO dao=Configuration.getMapper(HostDAO.class);
			updateCnt=dao.hotUpdateList(strPer_id);
			return updateCnt;
		}
	
	//////////////// HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-11 성영민  //////////////
////////////////HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-23 성영민  //////////////
		//구매요청 갯수
		@Override
		public int provalCnt() {
			int cnt=0;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			cnt=dao.provalCnt();
			return cnt;
		}
		//구매요청리스트
		@Override
		public ArrayList<TcatTicketingVO> provalList(Map<String, Object> map) {
			ArrayList<TcatTicketingVO> dtos = null;
			HostDAO dao= Configuration.getMapper(HostDAO.class);
			dtos=dao.provalList(map);
			System.out.println("maps"+map);
			return dtos;
		}
		//구매요청 업데이트
		@Override
		public int provalUpdateCnt(int num) {
			int updateCnt=0;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			updateCnt=dao.provalUpdateCnt(num);
			return updateCnt;
		}
		//혜택갯수
		@Override
		public int levelCnt() {
			int cnt=0;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			cnt=dao.levelCnt();
			return cnt;
		}
		//혜택리스트
		@Override
		public ArrayList<SaleVO> levelList(Map<String, Object> map) {
			ArrayList<SaleVO> dtos = null;
			HostDAO dao= Configuration.getMapper(HostDAO.class);
			dtos=dao.levelList(map);
			System.out.println("maps"+map);
			return dtos;
		}
		//혜택삭제
		@Override
		public int levelDeleteCnt(String sale) {
			int deleteCnt=0;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			deleteCnt=dao.levelDeleteCnt(sale);
			return deleteCnt;
		}
		//혜택상세
		@Override
		public ArrayList<SaleVO> levelMemberForm(String sale_div) {
			ArrayList<SaleVO> dto = null;
			HostDAO dao= Configuration.getMapper(HostDAO.class);
			dto=dao.levelMemberForm(sale_div);
			return dto;
		}
		//혜택수정
		@Override
		public int levelUpdateCnt(Map<String, Object> map) {
			int cnt=0;
			HostDAO dao= Configuration.getMapper(HostDAO.class);
			cnt=dao.levelUpdateCnt(map);
			return cnt;
		}
		//혜택등록
		@Override
		public int levelAdd(Map<String, Object> map) {
			int cnt=0;
			HostDAO dao=Configuration.getMapper(HostDAO.class);
			cnt=dao.levelAdd(map);
			return cnt;
		}
////////////////HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-23 성영민  //////////////
	///////////////////////  동금 1/9  ///////////////////////////
	//상품갯수 불러오기
	@Override
	public int getPerfoCnt(Map<String, Object> map) {
	int cnt=0;
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	System.out.println("===================================");
	cnt = dao.getPerfoCnt(map);
	System.out.println("===================================");
	
	return cnt;
	}
	
	//상품리스트 불러오기
	@Override
	public ArrayList<TcatPerformanceVO> getPerfoDeleteList(Map<String, Object> map) {
	System.out.println("stockDelete11");
	ArrayList<TcatPerformanceVO> dtos = null;
	System.out.println("stockDelete12");
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	dtos = dao.getPerfoDeleteList(map);
	System.out.println("stockDelete13");
	
	return dtos;
	}
	
	//스토어상품갯수 불러오기
	@Override
	public int getStoreCnt(Map<String, Object> map) {
	int cnt = 0;
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	cnt = dao.getStoreCnt(map);
	
	return cnt;
	}
	
	//스토어상품리스트 불러오기
	@Override
	public ArrayList<TcatPerDiscVO> getStoreDeleteList(Map<String, Object> map) {
	ArrayList<TcatPerDiscVO> dtos = null;
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	dtos = dao.getStoreDeleteList(map);
	return dtos;
	}
	
	//상품삭제 처리페이지
	@Override
	public int registerDel(int per_id) {
	int cnt =0;
	
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	cnt = dao.registerDel(per_id);
	
	return cnt;
	}
	
	//스토어상품삭제 처리페이지
	@Override
	public int storeRegisterDel(int disc_code) {
	int cnt = 0;
	
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	cnt = dao.storeRegisterDel(disc_code);
	
	return cnt;
	}
	
	//스토어상품갯수불러오기
	@Override
	public int storeOutOfCnt(Map<String, Object> map) {
	int cnt = 0;
	
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	cnt = dao.storeOutOfCnt(map);
	
	return cnt;
	}
	
	//스토어상품리스트불러오기
	@Override
	public ArrayList<TcatPerDiscVO> storeOutOfList(Map<String, Object> map) {
	ArrayList<TcatPerDiscVO> dtos = null;
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	dtos = dao.storeOutOfList(map);
	return dtos;
	}
	
	//스토어판매중단
	@Override
	public int storeSaleStop(int disc_code) {
	int cnt = 0;
	
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	cnt = dao.storeSaleStop(disc_code);
	
	return cnt;
	}
	
	//스토어판매중단해제하기
	@Override
	public int storeSaleStopRelease(int disc_code) {
	int cnt = 0;
	
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	cnt = dao.storeSaleStopRelease(disc_code);
	
	return cnt;
	}
	
	//스토어수량0개일때 step=>3
	@Override
	public void storediscCount() {
	
	HostDAO dao = Configuration.getMapper(HostDAO.class);
	dao.storediscCount();
	
	}
///////////////////////  동금 1/17  ///////////////////////////
///////////////////////  태성 1/21 start ///////////////////////////
	// 관리자 - 관람후기 목록 개수
	@Override
	public int commentCnt(Map<String, Object> map) {
		
		int cnt = 0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt = dao.commentCnt(map);
		
		return cnt;
	}
	// 관리자 - 스토어 후기 개수
	@Override
	public int commentCntS(Map<String, Object> map) {
		int cnt = 0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt = dao.commentCntS(map);
		return cnt;
	}
	
	// 관리자 - 관람후기 목록
	@Override
	public ArrayList<TcatBoardVO> commentList(Map<String, Object> map) {
		ArrayList<TcatBoardVO> dtos = null; // 큰 바구니
		String Hcnt = (String) map.get("Hcnt");
		if(Hcnt==null) {
			map.put("Hcnt", "공연");
		}
		map.put("s", Hcnt);
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		if (Hcnt.equals("스토어")) {
			dtos = dao.commentListStore(map);
		} else {
			dtos = dao.commentListView(map);
		}
		return dtos;
	
	}
	// 공연 관람 후기
	@Override
	public ArrayList<TcatBoardVO> commentListView(Map<String, Object> map) {
		ArrayList<TcatBoardVO> dtos = null; // 큰 바구니
		
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		dtos = dao.commentListView(map);
		
		return dtos;
	}
	// 스토어 후기
	@Override
	public ArrayList<TcatBoardVO> commentListStore(Map<String, Object> map) {
		ArrayList<TcatBoardVO> dtos = null; // 큰 바구니
		
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		dtos = dao.commentListStore(map);
		
		return dtos;
	}
	
	
	//관리자 - 관람 후기 삭제
	@Override
	public int commentDel(int notice_num) {
		int cnt = 0;
		
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt = dao.commentDel(notice_num);
		
		return cnt;
	}
///////////////////////  태성 1/21 end///////////////////////////

	//환불 목록 개수 - 공연
	@Override
	public int refundCnt(Map<String, Object> map) {
		int cnt = 0;
		
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		
		cnt = dao.refundCnt(map);
		System.out.println("cnt18려나"+cnt);
		return cnt;
	}
	
	//환불 목록 개수 - 스토어
	@Override
	public int refundSCnt(Map<String, Object> map) {
		int cnt = 0;
		
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt = dao.refundSCnt(map);
		
		return cnt;
	}
	//환불 목록 - 공연
	@Override
	public ArrayList<TcatTicketingVO> refundListA(Map<String, Object> map) {
		ArrayList<TcatTicketingVO> dtos = null; // 큰 바구니
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		dtos = dao.refundListA(map);
		return dtos;
	}
	
	//환불 목록 - 스토어
	@Override
	public ArrayList<TcatDiscBuyVO> refundListB(Map<String, Object> map) {
		ArrayList<TcatDiscBuyVO> dtos = null; // 큰 바구니
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		dtos = dao.refundListB(map);
		return dtos;
	}
	//환불 승인 - 공연
	@Override
	public int refundPerformanceOk(int refundUpdate) {
		int cnt = 0;
		
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt = dao.refundPerformanceOk(refundUpdate);
		
		return cnt;
	}
	//환불 취소 - 공연
	@Override
	public int refundPerformanceCancel(int refundDown) {
		int cnt = 0;
		
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt = dao.refundPerformanceCancel(refundDown);
		
		return cnt;
	}
	//환불 승인 - 스토어
	@Override
	public int refundStoreOk(int refundUpdateS) {
		int cnt = 0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt = dao.refundStoreOk(refundUpdateS);
		return cnt;
	}
	//환불 취소 - 스토어
	@Override
	public int refundStoreCancel(int refundDownS) {
		int cnt = 0;
		HostDAO dao = Configuration.getMapper(HostDAO.class);
		cnt = dao.refundStoreCancel(refundDownS);
		return cnt;
	}

	
	
}