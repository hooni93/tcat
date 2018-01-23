package spring.project.tcat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.project.tcat.service.MoGuestService;

@Controller
public class MoGuestContoroller {
	@Autowired
	MoGuestService MGService;
	
	//게스트 메인 출력
	@RequestMapping("guestPage")
	public String guestPage(HttpServletRequest req,Model model) {
		System.out.println("guestPage");
		return "tcat/guestMain/guestPage";
	}
	//게스트 메인
	@RequestMapping("guestMain")
	public String guestMain(HttpServletRequest req,Model model) {
		System.out.println("guestMain");
		MGService.hotList(req, model);
		return "tcat/guestMain/guestMain";
	}
	//뮤지컬 전체 메인 리스트 페이지 
	@RequestMapping("musicalMain")
	public String musicalMain(HttpServletRequest req,Model model) {
		System.out.println("musicalMain");
		return "tcat/musical/musicalMain";
	}
	//콘서트 전체 메인 리스트 페이지 
	@RequestMapping("concertMain")
	public String concertMain(HttpServletRequest req,Model model) {
		System.out.println("concertMain");
		return "tcat/concert/concertMain";
	}
	//연극 전체 메인 리스트 페이지 
	@RequestMapping("dramaMain")
	public String dramaMain(HttpServletRequest req,Model model) {
		System.out.println("dramaMain");
		return "tcat/drama/dramaMain";
	}
	//클래식 전체 메인 리스트 페이지 
	@RequestMapping("classicMain")
	public String classicMain(HttpServletRequest req,Model model) {
		System.out.println("classicMain");
		return "tcat/classic/classicMain";
	}
	//무용 전체 메인 리스트 페이지 
	@RequestMapping("danceMain")
	public String danceMain(HttpServletRequest req,Model model) {
		System.out.println("danceMain");
		return "tcat/dance/danceMain";
	}
	//스토어 전체 메인 리스트 페이지 
	@RequestMapping("storeMain")
	public String storeMain(HttpServletRequest req,Model model) {
		System.out.println("storeMain");
		return "tcat/store/storeMain";
	}
	//좌석 정보 가져오기
	@RequestMapping("ticketSeat")
	public String ticketSeat(HttpServletRequest req,Model model) {
		System.out.println("ticketSeat");
		MGService.ticketSeat(req, model);
		return "tcat/store/ticketSeat";
	}
	//사진 게시판 가져오기
	@RequestMapping("photoBoarder")
	public String photoBoarder(HttpServletRequest req,Model model) {
		System.out.println("photoBoarder");
		MGService.photoBoarderList(req, model);
		return "tcat/Boarder/photoBoarder";
	}
	//사진게시판 답글 달기
	@RequestMapping("photoBoarderCommentWrite")
	public String photoBoarderCommentWrite(HttpServletRequest req,Model model) {
		System.out.println("photoBoarderCommentWrite");
		MGService.photoBoarderCommentWrite(req, model);
		photoBoarder(req, model);
		return "tcat/Boarder/photoBoarder";
	}
	
	
	
	
	
}
