package golmok.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Map_TestCon {

	@RequestMapping("/Map_Test")
	public String main_chat() {
		
		return "jsp/chat";
	}
}
