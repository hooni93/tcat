package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface HostService {

	//////////////////////////////////////18.01.11 명훈//////////////////////////////////////////////////
	//상품목록 나열
	public void productList(HttpServletRequest req,Model model);
	//////////////////////////////////////18.01.11 명훈//////////////////////////////////////////////////
	
	/////////////////////////////////// 태성 1/9 start /////////////////////////////
	// HOST//상품관리//카테고리별 상품목록 출력
	public void categoryList(HttpServletRequest req, Model model);
	//////////////////////////////////// 태성 1/9 end//////////////////////////////

	///////////////////////////////// 태성 1/10 start//////////////////////////////
	// HOST//상품관리//카테고리별 상품진열관리 // 우선순위 변경
	public void updateGrade(HttpServletRequest req, Model model);
	//////////////////////////////////// 태성 1/10 end ////////////////////////////
	
	////////////////////////////////////현석 1/11  //////////////////////////////////////////
	//공연정보 리스트 가져오기
	public void performanceList(HttpServletRequest req,Model model);
	//공연정보 추가
	public void performanceInsert(MultipartHttpServletRequest req,Model model);
	/*//스토어 리스트 가져오기
	public void storeList(HttpServletRequest req,Model model);
	//스토어 재고 추가
	public void insertStore (MultipartHttpServletRequest req,Model model);*/
	////////////////////////////////////현석 1/11 end //////////////////////////////////////////
	
	/*  HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-11 성영민  */
	public void hotMenu(HttpServletRequest req,Model model);
	/*  HOST/상품관리/핫카테고리 상품진열관리 시작-2018-01-11 성영민  */
	
	///////////////////////  동금 1/9 start  //////////////////////// 
	// HOST/상품관리/상품삭제  -- update부분
	public void stockDelete(HttpServletRequest req, Model model);
	///////////////////////  동금 1/9 end ///////////////////////////
	
	
	
	
}
