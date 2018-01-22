package spring.project.tcat.controller;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.project.tcat.service.YMGuestService;


@Controller
public class YMGuestContoroller {
	@Autowired
	YMGuestService YMService;
	
	//멤버포인트
	@RequestMapping("memberPoint")
	public String memberPoint(HttpServletRequest req,Model model) {
		System.out.println("memberPoint");
		YMService.memberRating(req, model);
		return "tcat/memberMyPage/memberPoint";
	}
	//이벤트메인
	@RequestMapping("eventMain")
	public String eventMain(HttpServletRequest req,Model model) {
		System.out.println("eventMain");
		return "tcat/event/eventMain";
	}
	//이벤트리스트
	@RequestMapping("eventList")
	public String eventList(HttpServletRequest req,Model model) {
		System.out.println("eventList");
		YMService.eventGuest(req, model);
		return "tcat/event/eventList";
	}
	//이벤트상세
	@RequestMapping("eventForm")
	public String eventForm(HttpServletRequest req,Model model) {
		System.out.println("eventForm");
		YMService.eventForm(req, model);
		return "tcat/event/eventForm";
	}
	//이벤트삭제
	@RequestMapping("eventDelete")
	public String eventDelete(HttpServletRequest req,Model model) {
		System.out.println("eventDelete");
		YMService.eventDelete(req, model);
		YMService.eventGuest(req, model);
		return "tcat/borderManager/eventHost";
	}
	//이벤트수정
		@RequestMapping("eventUpdate")
		public String eventUpdate(HttpServletRequest req,Model model) {
			System.out.println("eventUpdate");
			YMService.eventForm(req, model);
			YMService.eventGuest(req, model);
			return "tcat/borderManager/eventUpdate";
		}
		//이벤트수정
		/*@RequestMapping("eventUpdateList")
		public String eventUpdateList(HttpServletRequest req,Model model) {
			System.out.println("eventUpdateList");
			return "tcat/borderManager/eventHost";
		}*/
}
