package golmok.team.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import golmok.team.service.HomeService;
import golmok.team.vo.UserVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	HomeService homeService;
	
	
	@RequestMapping(value="/home/homepage.do", method=RequestMethod.GET)
	public String homepage(Locale locale, Model model) {
		return "/home/homepage";
	}
	
	@RequestMapping(value="/home/joinAction.do", method=RequestMethod.POST)
	public String joinAction(HttpServletRequest request, Model model) {
		
		
		String join_Email = request.getParameter("join_Email");
		String join_PW = request.getParameter("join_PW");
		String join_Name = request.getParameter("join_Name");
		
		UserVo uVo = new UserVo();
		uVo.setUser_email(join_Email);
		uVo.setUser_pw(join_PW);
		uVo.setUser_name(join_Name);
		uVo.setUser_isUser("F");
		
		String verifyCode = "";
		
		int count = 0;
		
		while(count < 21) {
			int num = (int)(Math.random() * 3);
			switch(num) {
			
			case 1 : 
				verifyCode += (char)(90 - ((int)(Math.random()*25)));
				break;
			case 2 :
				verifyCode += (char)(122 - ((int)(Math.random()*25)));
				break;
			case 3 :
				verifyCode += String.valueOf((int)(Math.random()*9));
				break;
			}
			count++;
		}
		
		uVo.setUser_verifyCode(verifyCode);
		
		
		int result = homeService.joinUser(uVo);
		
		String alertStr = "";
		
		if(result == 1) {
			alertStr = "정상적으로 회원가입되었습니다. 이메일 인증을 부탁드립니다.";
		}else {
			alertStr = "회원가입에 실패하였습니다. 다시 시도해주세요";
		}
		
		model.addAttribute("joinAlertStr", alertStr);
		
		return "/home/homePage";
	}
	
}
