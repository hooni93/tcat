package spring.project.tcat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.persistence.DKGuestDAO;
@Service
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
		
		Map<String, Object> map = new HashMap<String, Object>();
		//글갯수 구하기
		//cnt = 0;
		cnt = dao.getQnaBoardCnt();
		
		//req.setAttribute("cnt", cnt);
		model.addAttribute("cnt", cnt);
		
		System.out.println("cnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";  //첫페이지 1페이지로 설정
		}
		
		//현재페이지
		currentPage = (Integer.parseInt(pageNum));  
		
		//페이지 갯수
		//페이지갯수+나머지  //나머지 갯수가 있으면 한페이지를 더 줘야된다.
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		//현재페이지에서 -1을 하는 이유는 0부터시작하기때문
		start = (currentPage -1) * pageSize +1;
		
		//현재페이지 끝번호
		end = start + pageSize -1;
		
		if(end > cnt) end=cnt;
		
		number = cnt - (currentPage - 1) * pageSize; //출력할 글번호... 최신글(큰 페이지)가 1page 
		
		System.out.println("number : " + number);
		System.out.println("cnt : " + cnt);
		System.out.println("currentPage : " + currentPage);
		System.out.println("pageSize : " + pageSize);
		
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<TcatBoardVO> dtos = dao.getQnaBoardList(map);
		
			model.addAttribute("dtos", dtos);
			
		}
		
		startPage = (currentPage/pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock -1; 
		if(endPage > pageCount) endPage = pageCount;
		
		//req.setAttribute("cnt", cnt); //글갯수
		//req.setAttribute("number", number); //글번호
		//req.setAttribute("pageNum", pageNum); //페이지번호
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		System.out.println("cnt--------"+cnt);
		if(cnt > 0) {
			//req.setAttribute("startPage", startPage);  //시작페이지
			//req.setAttribute("endPage", endPage);//마지막페이지
			//req.setAttribute("pageBlock", pageBlock);//출력할 페이지 갯수
			//req.setAttribute("pageCount", pageCount);//페이지 갯수
			//req.setAttribute("currentPage", currentPage);//현재 페이지
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
		
		}
		
	}

}
