package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.project.tcat.VO.CategoryVO;
import spring.project.tcat.VO.HostVO;
import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.ProductRankVO;
import spring.project.tcat.VO.SelectHellInfoVO;
import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.VO.TcatDiscBuyVO;
import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.VO.TcatTicketingVO;

public interface HostDAO {
	
	//최근가입 회원 숫자 체크
	public int latelyJoinMemberCnt(Map<String,Object> map);
	//최근 가입 회원 리스트
	public ArrayList<MemberVO> latelyJoinMember(Map<String,Object> map);
	//휴면카테고리 회원리스트 숫자
	public int sleepMemberCnt(int Hcnt);
	//휴면카테고리 회원리스트
	public ArrayList<MemberVO> sleepMember(Map<String,Object> map);
	//휴면회원 처리
	public int sleepMemberPro(Map<String,Object> map);
	//검색정보수량
	public int memberManagerSerchListCnt(Map<String,Object> map);
	//검색정보
	public ArrayList<MemberVO> memberManagerSerchList(Map<String,Object> map);
	//지역인서트 넘버키 가져오기
	public int placeNum();
	//지역정보 인서트
	public int placeInsert(TcatPerformanceVO vo);
	//hall 인서트
	public int insertHall(TcatPerformanceVO vo);


	//////////////////////////////////////18.01.16 명훈//////////////////////////////////////////////////
	//출력할 공연상품 갯수 가져오기
	public int perProductCnt(Map<String, Object> map);
	//출력할 스토어상품 갯수 가져오기
	public int storeProductCnt(Map<String, Object> map);
	//공연 상품 출력
	public ArrayList<TcatPerformanceVO> perProduct(Map<String, Object> map);
	//스토어 상품 출력
	public ArrayList<TcatPerDiscVO> storeProduct(Map<String, Object> map);
	//공연 상품 상세정보 - 1건
	public TcatPerformanceVO productDetail_perf(int perf_id);
	//스토어 상품 상세정보 1건 
	public TcatPerDiscVO productDetail_store(int disc_code);
	//orderListCnt 주문목록 갯수
	public int orderListCnt(Map<String, Object> map);
	//orderList 주문목록 가져오기
	public ArrayList<TcatTicketingVO> orderList(Map<String, Object> map);
	//orderList_storeCnt 스토어 주문 갯수
	public int orderList_storeCnt(Map<String, Object> map);
	//orderList_store
	public ArrayList<TcatDiscBuyVO> orderList_store(Map<String, Object> map);
	//////////////////////////////////////18.01.16 명훈 끝//////////////////////////////////////////////////
	
	//////////////////////////////////////18.01. 명훈 시작//////////////////////////////////////////////////
	//상품 랭크 getProductRank_perfCnt
	public int getProductRank_perfCnt();
	//상품 랭크 getProductRank_perfCnt
	public ArrayList<ProductRankVO > productRank_perf(int productNum);
	//스토어 상품 랭크
	public int getProductRank_storeCnt();
	//스토어 상품 랭크
	public ArrayList<ProductRankVO > productRank_store(int productNum);
	
	//중분류 랭크
	public ArrayList<ProductRankVO > mDevRank();
	//소분류 랭크
	public ArrayList<ProductRankVO > sDevRank(String mDev);
	//mDevRank_store 스토어 중분류
	public ArrayList<ProductRankVO > mDevRank_store();
	//스토어 소분류
	public ArrayList<ProductRankVO > sDevRank_store(String mDev);
	//환불 랭크 개수
	public int returnRank_perfCnt();
	//환불 랭크 리스트
	public ArrayList<ProductRankVO > returnRank_perf(int productNum);
	//스토어 환불 랭크
	public int returnRank_storeCnt();
	//스토어 환불 랭크
	public ArrayList<ProductRankVO > returnRank_store(int productNum);
	//장바구니랭크 갯수
	public int cartRankCnt();
	//장바구니 랭크 리스트
	public ArrayList<ProductRankVO > cartRank(int productNum);
	//위시리스트 갯수
	public int wishListRank_perfCnt();
	//위시리스트 리스트
	public ArrayList<ProductRankVO > wishListRank_perf(int productNum);
	//위시리스트 스토어 갯수
	public int wishListRank_storeCnt();
	//위시리스트 스토어 리스트
	public ArrayList<ProductRankVO > wishListRank_store(int productNum);
	//////////////////////////////////////18.01. 명훈 끝//////////////////////////////////////////////////
	



	/////////////////////////////////// 태성 1/9 start ////////////////////////////////////////
	//상품 목록 출력 진열
	public ArrayList<TcatPerformanceVO> getArticleList(Map<String, Object> map);
	//카테고리 상품 개수
	public int getCate(Map<String, Object> map);
	//스토어 상품 개수 
	public int getStore(Map<String, Object> map) ;
	//카테고리별 출력(스토어 제외)
	public ArrayList<TcatPerformanceVO> musiList(Map<String, Object> map);
	//카테고리별 출력(스토어만)
	public ArrayList<TcatPerformanceVO> storeList(Map<String, Object> map);
	////////////////////////////////////태성 1/9 end //////////////////////////////////////////
	
	////////////////////////////////////태성 1/10 start ///////////////////////////////////////
	//우선순위 수정
	public int Cfirst_grade(Map<String, String > map); //뮤지컬,연극,콘서트 우선순위 변경
	public int Sfirst_grade(Map<String, String > map); //스토어 우선순위 변경
	//스텝 변경
	public int Cstep(Map<String, String > map); //뮤지컬,연극,콘서트 스텝변경
	public int Sstep(Map<String, String > map); //스토어 스텝변경
	////////////////////////////////////태성 1/10 end //////////////////////////////////////////
	
	///////////////////////  태성 1/12 start ///////////////////////////
	//수정재고관리 목록개수
	//스토어 상품 개수 
	public int stockStore(Map<String, Object> map) ;
	//수정재고관리 출력
	//수정재고관리 카테고리별 출력(스토어만)
	public ArrayList<TcatPerDiscVO> stockManageListstore(Map<String, Object> map);
	//수정할 개수(disc_code)
	public int clickStockCnt(int per_id);
	//수정할 수 있는 목록
	public ArrayList<TcatPerDiscVO> clickStockList(Map<String, Object> map);
	//재고 수정 처리
	public void updateStock(Map<String, Object> map);
	///////////////////////  태성 1/12 end  ///////////////////////////
	

	
	////////////////////////////////////현석 1/11  //////////////////////////////////////////
	//공연정보 갯수 구하기
	public int performanceCnt();
	//공연정보 리스트 구하기
	public ArrayList<TcatPerformanceVO> performanceList(Map<String,Integer> map);
	//카테고리 리스트 가져오기 [공연]
	public ArrayList<CategoryVO> cateList();
	//카테고리 리스트 가져오기 [스토어]
	public ArrayList<CategoryVO> cateListStore();
	//공연지역 리스트 가져오기
	public ArrayList<SelectHellInfoVO> HellList();
	//상세페이지 번호 찾아오기
	public int SearchDetail_num();
	//상세페이지 생성[초기화]
	public void insertDetailP_DEFAULT(int detail_num);
	//공연정보 추가하기
	public void insertPerformance(Map<String,Object> map);
	//스토어 갯수 구하기
	public int perDiscCnt();
	//스토어 리스트 가져오기
	public ArrayList<TcatPerDiscVO> perDiscList(Map<String,Object> map);
	//스토어 재고 추가
	public void insertStore(TcatPerDiscVO dto);
	//2018-01-15---------------------------------------------------------------------
	//고객정보 갯수 가져오기
	public int member_cnt();
	//고객정보 리스트 가져오기
	public ArrayList<MemberVO> member_list(Map<String, Object> map);
	//고객정보 가져오기
	public MemberVO detailMember(String member_id);
	//고객정보 수정
	public int detailMember_update(MemberVO dto);
	//2018-01-16---------------------------------------------------------------------
	//관리자 추가
	public int HostPlus(Map<String,Object> map);
	//관리자 id있는지 체크
	public int HostIdCheack(String host_id);
	//관리자 리스트 갯수 구하기
	public int HostMemberListCnt();	
	//관리자 리스트 가져오기
	public ArrayList<HostVO> HostMemberList(Map<String,Object> map);
	//관리자 삭제
	public int deleteHost(String host_id);
	
	////////////////////////////////////현석 1/11 end //////////////////////////////////////////


	////////////////////////////////////영민 1/10 start ///////////////////////////////////////
	
	//핫리스트 5개 출력
	public ArrayList <TcatPerformanceVO>hotList();
	//핫리스트 갯수
	public int hotArticleCnt();
	//핫리스트 아닌 갯수
	public int hotNoArticleCnt(Map<String,Object> map);
	//업데이트
	public int hotUpdate(int per_id);
	//전체 리스트
	public ArrayList <TcatPerformanceVO>hotLast(Map<String,Object> map);
	
	//hot 카테고리 내리기
	public int hotDeleteList(int strPer_id);
	
	//hot 카테고리 올리기
	public int hotUpdateList(int strPer_id);
	////////////////////////////////////영민 1/10 end ///////////////////////////////////////
	
	
	
	///////////////////////  동금 1/11  ///////////////////////////
	//상품갯수 불러오기
	public int getPerfoCnt(Map<String, Object> map);
	
	//상품리스트 불러오기
	public ArrayList<TcatPerformanceVO> getPerfoDeleteList(Map<String, Object> map);
	
	//스토어상품갯수 불러오기
	public int getStoreCnt(Map<String, Object> map);
	
	//스토어상품리스트 불러오기
	public ArrayList<TcatPerDiscVO> getStoreDeleteList(Map<String, Object> map);
	
	//상품삭제 처리페이지
	public int registerDel(int per_id);
	
	//스토어상품삭제 처리페이지
	public int storeRegisterDel(int disc_code);
	
	////////품절관리/////////
	//스토어상품갯수불러오기
	public int storeOutOfCnt(Map<String, Object> map);
	
	//스토어상품리스트불러오기
	public ArrayList<TcatPerDiscVO> storeOutOfList(Map<String, Object> map);
	
	//스토어판매중단
	public int storeSaleStop(int disc_code);
	
	//스토어판매중단해제하기
	public int storeSaleStopRelease(int disc_code);
	
	//스토어수량0개일때 step=>3
	public void storediscCount();
	
	///////////////////////  동금 1/15 end ///////////////////////////
		
///////////////////////  태성 1/21 start ///////////////////////////
	// 관람/상품 후기 개수
	public int commentCnt(Map<String, Object>map);
	// 관람/상품 후기 목록
	public ArrayList<TcatBoardVO> commentList(Map<String, Object> map);
	// 관람/상품후기 삭제
	public int commentDel(int notice_num);
/*	// 게스트 관람/상품후기 등록
	public int commentWrite(TcatBoardVO vo);*/
///////////////////////  태성 1/21 end ///////////////////////////
}
