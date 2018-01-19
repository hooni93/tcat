package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import spring.project.tcat.persistence.DKGuestDAO;

public class DKGuestServiceImpl implements DKGuestService{
	
	@Autowired
	DKGuestDAO dao;
	
	
	//글목록불러오기
	@Override
	public void qnaBoardList(HttpServletRequest req, Model model) {
		
		int pageSize = 10;    //한 페이지당 출력할 글 갯수
		int pageBlock = 3;   //한 블럭당 페이지 갯수
		
		int cnt=0;			 //글 갯수
		int start=0;		 //현재 페이지 글시작번호
		int end=0;			 //현재 페이지 글마지막번호
		int number=0;		 //출력할 글번호
		String pageNum = null;  //페이지번호
		int currentPage = 0;    //현재페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0; 		//시작페이지
		int endPage=0;  		//마지막 페이지	
		
		
		
	}

}
