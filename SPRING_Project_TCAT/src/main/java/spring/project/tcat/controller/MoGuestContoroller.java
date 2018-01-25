package spring.project.tcat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		MGService.guestMainList(req, model);
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
		System.out.println("여기가 마지노선이다");
		return "tcat/Ticketing/ticketSeat";
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
	//사진게시판 게시하기 
	@RequestMapping("insertPhotoBoarder")
	public String insertPhotoBoarder(MultipartHttpServletRequest req,Model model) {
		System.out.println("insertPhotoBoarder");
		MGService.insertPhotoBoarder(req, model);
		MGService.photoBoarderList(req, model);
		return "tcat/Boarder/photoBoarder";
	}
	//사진게시판 삭제
	@RequestMapping("photoBorderDelete")
	public String photoBorderDelete(HttpServletRequest req,Model model) {
		System.out.println("photoBorderDelete");
		MGService.photoBorderDelete(req, model);
		MGService.photoBoarderList(req, model);
		return "tcat/Boarder/photoBoarder";
	}
	
	//사진게시판 수정
	@RequestMapping("noMoPhotoBoarder")
	public String noMoPhotoBoarder(MultipartHttpServletRequest req,Model model) {
		System.out.println("noMoPhotoBoarder");
		MGService.noMoPhotoBoarder(req, model);
		MGService.photoBoarderList(req, model);
		return "tcat/Boarder/photoBoarder";
	}
	
	//영상 게시판 가져오기
		@RequestMapping("movieBoarder")
		public String movieBoarder(HttpServletRequest req,Model model) {
			System.out.println("movieBoarder");
			MGService.movieBoarderList(req, model);
			return "tcat/Boarder/movieBoarder";
		}
	
	//영상게시판 답글 달기
	@RequestMapping("MovieBoarderCommentWrite")
	public String MovieBoarderCommentWrite(HttpServletRequest req,Model model) {
		System.out.println("MovieBoarderCommentWrite");
		MGService.MovieBoarderCommentWrite(req, model);
		MGService.movieBoarderList(req, model);
		return "tcat/Boarder/movieBoarder";
	}
	
	//영상게시판 게시하기 
	@RequestMapping("insertMovieBoarder")
	public String insertMovieBoarder(MultipartHttpServletRequest req,Model model) {
		System.out.println("insertMovieBoarder");
		MGService.insertMovieBoarder(req, model);
		MGService.movieBoarderList(req, model);
		return "tcat/Boarder/movieBoarder";
	}
	
	//사진게시판 삭제
	@RequestMapping("movieBorderDelete")
	public String movieBorderDelete(HttpServletRequest req,Model model) {
		System.out.println("movieBorderDelete");
		MGService.movieBorderDelete(req, model);
		MGService.movieBoarderList(req, model);
		return "tcat/Boarder/movieBoarder";
	}
	
	//핫카테고리 구현
	@RequestMapping("hotCategory")
	public String hotCategory(HttpServletRequest req,Model model) {
		System.out.println("hotCategory");
		MGService.hotList(req, model);
		return "tcat/guestMain/hotCategory";
	}
	
	//메인화면 무비 영상 
	@RequestMapping("movieMain")
	public String movieMain(HttpServletRequest req,Model model) {
		System.out.println("movieMain");
		String movie_url=req.getParameter("movie_url");
		System.out.println(movie_url);
		model.addAttribute("movie_url", movie_url);
		return "tcat/guestMain/movieMain";
	}
	
	
	
}
