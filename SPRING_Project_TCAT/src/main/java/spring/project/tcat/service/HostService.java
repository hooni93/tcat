package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface HostService {
	
	//최근 가입회원 화면
	public void join_retireMember(HttpServletRequest req,Model model);
	//휴면회원등록
	public void sleepMember(HttpServletRequest req,Model model);
	//휴면회원 처리
	public void sleepMemberPro(HttpServletRequest req,Model model);
	//회원검색리스트
	public void memberManagerSerchList(HttpServletRequest req,Model model);
	//공연장 인서트
	public void insertHall(HttpServletRequest req,Model model);

	//////////////////////////////////////18.01.16 명훈//////////////////////////////////////////////////
	//상품목록 나열
	public void productList(HttpServletRequest req,Model model);
	//공연상품정보 가져오기
	public void  productDetail_perf(HttpServletRequest req,Model model);
	//스토어상품정보 가져오기
	public void  productDetail_store(HttpServletRequest req,Model model);
	//예매 리스트 가져오기
	public void  orderList(HttpServletRequest req, Model model);
	//상품 구매 리스트 가져오기
	public void  orderList_store(HttpServletRequest req, Model model);
	//////////////////////////////////////18.01.16 명훈 끝//////////////////////////////////////////////////
	
	//////////////////////////////////////18.01.17 명훈시작 완//////////////////////////////////////////////////
	//판매량 정렬
	public void productRank_perf(HttpServletRequest req, Model model);
	//스토어 판매량 productRank_store
	public void productRank_store(HttpServletRequest req, Model model);
	
	
	//categoryRank_perf 공연 카테고리 판매량 분석
	public void categoryRank_perf(HttpServletRequest req, Model model);
	//스토어 판매량 카테고리 스토어
	public void categoryRank_store(HttpServletRequest req, Model model);
	
	//returnRank_perf 환불 승인 랭크
	public void returnRank_perf(HttpServletRequest req, Model model);
	//스토어 환불 승인
	public void returnRank_store(HttpServletRequest req, Model model);
	//장바구니 분석
	public void cartRank(HttpServletRequest req, Model model);
	
	//위시리스트
	public void wishListRank_perf(HttpServletRequest req, Model model);
	//위시리스트 스토어
	public void wishListRank_store(HttpServletRequest req, Model model);
	//////////////////////////////////////18.01.17 명훈시작 완//////////////////////////////////////////////////
	
	
	
	
	

	
	/////////////////////////////////// 태성 1/9 start /////////////////////////////
	// HOST//상품관리//카테고리별 상품목록 출력
	public void categoryList(HttpServletRequest req, Model model);
	//////////////////////////////////// 태성 1/9 end//////////////////////////////

	///////////////////////////////// 태성 1/10 start//////////////////////////////
	// HOST//상품관리//카테고리별 상품진열관리 // 우선순위 변경
	public void updateGrade(HttpServletRequest req, Model model);
	
	// HOST//상품관리//카테고리별 상품진열관리 // 스텝변경
	public void changeStep(HttpServletRequest req, Model model);
	//////////////////////////////////// 태성 1/10 end ////////////////////////////
	
	///////////////////////////////// 태성 1/12 start//////////////////////////////
	// HOST//상품관리//상품재고관리
	public void stockManagementList(HttpServletRequest req, Model model);

	// HOST//상품관리//상품재고관리 수정 리스트
	public void stockManagementClickList(HttpServletRequest req, Model model);
	
	// HOST//상품관리//상품재고관리 수정처리
	public void updateStock(HttpServletRequest req, Model model);
	//////////////////////////////////// 태성 1/12 end ////////////////////////////
	


		
	////////////////////////////////////현석 1/11  //////////////////////////////////////////
	//공연정보 리스트 가져오기
	public void performanceList(HttpServletRequest req,Model model);
	//공연정보 추가
	public void performanceInsert(MultipartHttpServletRequest req,Model model);
	//스토어 리스트 가져오기
	public void storeList(HttpServletRequest req,Model model);
	//스토어 재고 추가
	public void insertStore (MultipartHttpServletRequest req,Model model);
	//고객 리스트 가져오기
	public void member_list(HttpServletRequest req,Model model);
	//상세 고객정보 가져오기
	public void detailMember(HttpServletRequest req,Model model);
	//고객정보 수정
	public void detailMember_update(HttpServletRequest req,Model model);
	//호스트 이메일 체크
	public void emailCheack(HttpServletRequest req,Model model);
	//호스트 추가
	public void HostPlus(HttpServletRequest req,Model model);
	//호스트가입에서 id있는지 체크
	public void HostIdCheack(HttpServletRequest req,Model model);
	//관리자 id리스트 가져오기
	public void HostMemberList(HttpServletRequest req,Model model);
	//관리자 삭제
	public void deleteHost(HttpServletRequest req,Model model);
	////////////////////////////////////현석 1/11 end //////////////////////////////////////////

	
	////////////////////////////////////영민 1/11 start //////////////////////////////////////////
	//hot 카테고리
	public void hotMenu(HttpServletRequest req,Model model);
	//hot 카테고리 내리기
	public void hotMenuDelete(HttpServletRequest req,Model model);
	
	//hot 카테고리 올리기
	public void hotMenuUpdate(HttpServletRequest req,Model model);
	////////////////////////////////////영민 1/11 end //////////////////////////////////////////
	

	///////////////////////  동금 1/9 start  //////////////////////// 
	
	// HOST/상품관리/상품삭제  -- update부분
	public void stockDelete(HttpServletRequest req, Model model);
	
	//스토어상품삭제
	public void storeDelete(HttpServletRequest req, Model model);
	
	//상품삭제처리
	public void stockDeletePro(HttpServletRequest req, Model model);
	
	//스토어상품삭제처리
	public void storeDeletePro(HttpServletRequest req, Model model);
	
	
	////////품절상품관리/////////
	//스토어품절상품관리
	public void storeOutOf(HttpServletRequest req, Model model);
	
	//판매중단하기
	public void storeSale_stop(HttpServletRequest req, Model model);
	
	//판매중단해제하기
	public void storeSale_Release(HttpServletRequest req, Model model);
	
	///////////////////////  동금 1/15 end ///////////////////////////
	
	
	///////////////////////  태성 1/21 start ///////////////////////////
	//관람/상품 후기 관리 게시판 목록
	public void commentList(HttpServletRequest req, Model model);
	//관람/상품 후기 삭제
	public void commentDelete(HttpServletRequest req, Model model);
	///////////////////////  태성 1/21 end ///////////////////////////
}