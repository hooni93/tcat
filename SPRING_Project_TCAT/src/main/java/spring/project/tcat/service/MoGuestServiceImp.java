package spring.project.tcat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.persistence.MoGuestDAOImp;

@Service
public class MoGuestServiceImp implements MoGuestService {

	@Autowired
	MoGuestDAOImp MGDao;
	//핫리스트 가져오기
	@Override
	public void hotList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		String category=null;
		category=req.getParameter("category");
		if(category==null) {
			category="뮤지컬";
		}
		ArrayList<TcatPerformanceVO> dtos=null;
		dtos=MGDao.hotList(category);
		model.addAttribute("dtos", dtos);
	}
	//좌석정보 가져오기
	@Override
	public void ticketSeat(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int per_id=Integer.parseInt(req.getParameter("per_id"));
		int round=Integer.parseInt(req.getParameter("round"));
		String ticet_date=req.getParameter("ticet_date");
		System.out.println(per_id);
		System.out.println(round);
		System.out.println(ticet_date);
		System.out.println("============");
		Map<String,Object> map=new HashMap<String,Object>();
		ArrayList<TcatPerformanceVO> dtos=null;
		map.put("per_id", per_id);
		map.put("round", round);
		map.put("ticet_date", ticet_date);
		dtos=MGDao.ticketSeat(map);
		model.addAttribute("dtos", dtos);

	}
	//사진게시판 리스트 가져오기
	@Override
	public void photoBoarderList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int pageSize = 5; // 한 페이지당 출력할 글 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수
		int start = 0; // 현재 페이지 글시작번호
		int end = 0; // 현재 페이지 글마지막번호
		int number = 0; // 출력할 글번호
		String pageNum = null; // 페이지번호
		int currentPage = 0; // 현재페이지
		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지
		int cnt=0;
		
		cnt=MGDao.photoBoarderListCnt();
		
		pageNum = req.getParameter("pageNum");
		
		if (pageNum == null) {
		pageNum = "1"; // 첫페이지 1페이지로 설정
		}
		currentPage = (Integer.parseInt(pageNum)); // 현재페이지
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호
		end = start + pageSize - 1; // 현재페이지 끝번호
		if (end > cnt) {
		end = cnt;
		}
		number = cnt - (currentPage - 1) * pageSize;
		if (cnt > 0) {
		// 게시글 목록 조회
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			ArrayList<TcatBoardVO> dtos=MGDao.photoBoarderList(map);
			model.addAttribute("dtos", dtos);
		}
		startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
		if (currentPage % pageBlock == 0) {
		startPage -= pageBlock; // (5%3) == 0
		}
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6
		if (endPage > pageCount) {
		endPage = pageCount;
		}
		//사진게시판 답글 가져오기
		ArrayList<TcatBoardVO> dtos2=MGDao.photoBoarderComment();
		model.addAttribute("dtos2",dtos2);
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		if (cnt > 0) {

		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPage", currentPage);
		}
	}//메소드 끝
	
	//사진게시판 답글 달기
	@Override
	public void photoBoarderCommentWrite(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		String member_id=req.getParameter("member_id");
		int notice_num=Integer.parseInt(req.getParameter("notice_num"));
		String contents=req.getParameter("contents");
		TcatBoardVO vo=new TcatBoardVO();
		vo.setMember_id(member_id);
		vo.setNotice_num(notice_num);
		vo.setContents(contents);
		int cnt=0;
		cnt=MGDao.photoBoarderCommentWrite(vo);
		if(cnt!=0) {
			System.out.println("답글 업로드 완료");
		}
	}
	
	
	
	
	
}//클래스 끝
