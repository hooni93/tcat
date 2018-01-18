package spring.project.tcat.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import spring.project.tcat.service.YMGuestService;


@Controller
public class YMGuestContoroller {
	@Autowired
	YMGuestService YMService;
	
	
}
