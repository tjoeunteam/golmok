package golmok.team.controller;

import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage ;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String joinAction(HttpServletRequest request, Model model) throws Exception {
		
		
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
		
		String joinAlertStr = "";
		
		if(result == 1) {
			joinAlertStr = "successJoin";
		}else {
			joinAlertStr = "failJoin";
		}
		
		model.addAttribute("joinAlertStr", joinAlertStr);
		
		//인증코드 이메일로 보내기
		UserVo voForEmail = new UserVo();
		voForEmail.setUser_email(join_Email);
		
		UserVo resultVo = homeService.selectByEmail(voForEmail);
		
		String verifyCodetoEmail = resultVo.getUser_verifyCode();
		
		String host = "smtp.gmail.com";
		final String username = "tjoeunteam@gmail.com";
		final String password = "'ejwhdms'0205";
		
		String sendingMsg = "아래의 주소를 인터넷 주소창에 치셔서 들어가주세요\n "
				           + "http://localhost:8181/controller/home/verifyEmail.do?myVerifyCode="
				           +  verifyCodetoEmail
				           + "&email="
				           +  join_Email;
		
		String recipient = join_Email;
		String subject = "골목대장 이메일 인증요청 메일입니다.";
		String body = sendingMsg;
		
		//properties 설정 
		Properties props = new Properties(); 
		props.put("mail.smtps.auth", "true");
		props.put("mail.smtp.host", host);

		// 메일 세션
		Session session = Session.getDefaultInstance(props);
        MimeMessage msg = new MimeMessage(session); 
         // 메일 관련 
         msg.setSubject(subject); 
         msg.setText(body); 
         msg.setFrom(new InternetAddress(username)); 
         msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
         // 발송 처리 
         Transport transport = session.getTransport("smtps"); 
         transport.connect(host, username, password); 
         transport.sendMessage(msg, msg.getAllRecipients()); transport.close();	
		
		
		
		return "/home/homepage";
	}
	
	@RequestMapping(value="/home/isDuplicated.do", method=RequestMethod.POST)
	@ResponseBody
	public String idDuplicated(HttpServletRequest request) {
		String str = "";
		
		String join_Eamil = request.getParameter("email");
		
		UserVo uVo = new UserVo();
		uVo.setUser_email(join_Eamil);
		
		UserVo resultVo = homeService.selectByEmail(uVo);
		
		if(resultVo != null) {
			str = "have";
		}else {
			str = "doNotHave";
		}
		
		return str;
	}
	
	@RequestMapping(value="/home/verifyEmail.do", method=RequestMethod.GET)
	public String verifyEmail(HttpServletRequest request, Model model) {
		
		String myVerifyCode = request.getParameter("myVerifyCode");
		String email = request.getParameter("email");
		
		UserVo uVo = new UserVo();
		uVo.setUser_verifyCode(myVerifyCode);
		uVo.setUser_email(email);
		
		int result= homeService.updateInfobyVerifyCode(uVo);
		
		String updateVerication = "";
		
		if(result == 1) {
			updateVerication = "success";
		}else {
			updateVerication = "fail";
		}
		
		model.addAttribute("updateVerication", updateVerication);
		
		return "/home/homepage";
	}
	
	@RequestMapping(value="/home/loginAction.do", method=RequestMethod.POST)
	public String loginAction(HttpServletRequest request, HttpSession session, Model model) {
		
		String login_Email = request.getParameter("login_Email");
		String login_PW = request.getParameter("login_PW");
		
		UserVo uVo = new UserVo();
		uVo.setUser_email(login_Email);
		uVo.setUser_pw(login_PW);
		
		UserVo resultVo = homeService.selectByEmail(uVo);
		
		String loginResultStr = "";
		String loginName = "";
		if(resultVo == null) {
			loginResultStr = "failBecausOfEmail";
		}else {
			UserVo resultVo2 = homeService.selectByEmailAndPW(uVo);
			if(resultVo2 == null) {
				loginResultStr = "failBecausOfPW";
			}else {
				if(!resultVo2.getUser_isUser().equals("T")) {
					loginResultStr = "notVerifyEmail";
				}else {
				  loginResultStr = "success";
				  loginName = resultVo.getUser_name();
				  session.setAttribute("sessionID", login_Email);
				}
				
			}
		}
		
		model.addAttribute("loginResultStr", loginResultStr);
		model.addAttribute("loginName", loginName);
		model.addAttribute("loginInfoObj", resultVo);
		
		return "/home/homepage";
	}
	
	@RequestMapping(value="/home/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		
		session.removeAttribute("sessionID");
		
		model.addAttribute("logoutResultStr", "logoutSuccess");
		
		return "/home/homepage";
	}
	
	@RequestMapping(value="/home/findPW.do", method=RequestMethod.GET)
	public String findPW(Model model, HttpServletRequest request) {
		
		return "/home/verifyUser";
	}
	
	@RequestMapping(value="/home/findPWAction.do", method=RequestMethod.POST)
	public String findPWAction(HttpServletRequest request, Model model) throws Exception {
		String email = request.getParameter("verifyEmail");
		String name = request.getParameter("verifyName");
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
		
		UserVo uVo = new UserVo();
		uVo.setUser_email(email);
		uVo.setUser_name(name);
		uVo.setUser_verifyCode(verifyCode);
		
		UserVo resultVo = homeService.verifyUser(uVo);
		
		String verifyUserResultStr = "";
		
		if(resultVo == null) {
			verifyUserResultStr = "failVerification";
		}else {
			if(resultVo.getUser_isUser().equals("F")) {
				verifyUserResultStr = "failVerificationNotUser";				
			}else {
				int resultNum = homeService.updateVerifyCode(uVo);
				if(resultNum != 1) {
					verifyUserResultStr = "failVerification";
				}else {
					UserVo voForEmail = new UserVo();
					voForEmail.setUser_email(email);

					UserVo resultVoForEmail = homeService.selectByEmail(voForEmail);

					String verifyCodetoEmail = resultVoForEmail.getUser_verifyCode();

					String host = "smtp.gmail.com";
					final String username = "tjoeunteam@gmail.com";
					final String password = "'ejwhdms'0205";

					String sendingMsg = "아래의 주소를 인터넷 주소창에 치셔서 들어가주세요\n "
							+ "http://localhost:8181/controller/home/modifyPW.do?myVerifyCode="
							+  verifyCodetoEmail
							+ "&email="
							+  email;

					String recipient = email;
					String subject = "골목대장 이메일 인증요청 메일입니다.";
					String body = sendingMsg;

					//properties 설정 
					Properties props = new Properties(); 
					props.put("mail.smtps.auth", "true");
					props.put("mail.smtp.host", host);

					// 메일 세션
					Session session = Session.getDefaultInstance(props);
					MimeMessage msg = new MimeMessage(session); 
					// 메일 관련 
					msg.setSubject(subject); 
					msg.setText(body); 
					msg.setFrom(new InternetAddress(username)); 
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
					// 발송 처리 
					Transport transport = session.getTransport("smtps"); 
					transport.connect(host, username, password); 
					transport.sendMessage(msg, msg.getAllRecipients()); transport.close();	
					verifyUserResultStr = "successVerification";
				}
			}
		}
		
		model.addAttribute("verifyUserResultStr", verifyUserResultStr);
		
		return "/home/homepage";
	}
	
	@RequestMapping(value="/home/modifyPW.do", method=RequestMethod.GET)
	public String modifyPW(HttpServletRequest request, Model model) {
		
		String email = request.getParameter("email");
		String myVerifyCode = request.getParameter("myVerifyCode");
		
		UserVo uVo = new UserVo();
		uVo.setUser_email(email);
		uVo.setUser_verifyCode(myVerifyCode);
		
		UserVo resultVo = homeService.selectByEmail(uVo);			
		
		if(resultVo.getUser_verifyCode().equals(myVerifyCode)) {
			model.addAttribute("email", email);
			model.addAttribute("myVerifyCode", myVerifyCode);
			return "/home/modifyPW";
		}
		
		return "/home/homepage";
	}
	
	@RequestMapping(value="/home/modifyPWAction.do", method=RequestMethod.POST)
	public String modifyPWAction(HttpServletRequest request, Model model) {
		
		String pw = request.getParameter("password1");
		String email = request.getParameter("email");
		String myVerifyCode = request.getParameter("myVerifyCode");
		
		UserVo uVo = new UserVo();
		uVo.setUser_email(email);
		uVo.setUser_pw(pw);
		uVo.setUser_verifyCode(myVerifyCode);
		
		int result = homeService.modifyPWAndVerifyCode(uVo);
		
		String modifyPWResultStr = "";
		
		if(result != 1) {
			modifyPWResultStr = "failModifyPW";
		}else {
			modifyPWResultStr = "successModifyPW";
		}
		
		model.addAttribute("modifyPWResultStr", modifyPWResultStr);
		
		return "/home/homepage";
	}
	
	@RequestMapping(value="/home/modifyMyInfo.do", method=RequestMethod.POST)
	public String modifyMyInfo(HttpServletRequest request,HttpSession session ,Model model) {
		
		String email = request.getParameter("myInfo_Email");
		String pw = request.getParameter("myInfo_PW");
		
		UserVo uVo = new UserVo();
		uVo.setUser_email(email);
		uVo.setUser_pw(pw);
		
		int result = homeService.modifyPW(uVo);
		
		String modifyMyPWResult = "";
		
		if(result == 0) {
			modifyMyPWResult = "failModifyMyPW";
		}else {
			modifyMyPWResult = "successModifyMyPW";
			session.removeAttribute("sessionID");			
		}
		
		model.addAttribute("modifyMyPWResult", modifyMyPWResult);
		
		return "/home/homepage";
	}
	
	@RequestMapping(value="/home/userInfo.do", method=RequestMethod.GET)
	public String userINfo(HttpServletRequest request, Model model) {
		
		int pageNum = (request.getParameter("pageNum") != null) ? Integer.parseInt(request.getParameter("pageNum")) : 1;
		
		String modifyUserInfoResult = (request.getParameter("modifyUserInfoResult") != null) ? request.getParameter("modifyUserInfoResult") : "none";
		
		int startNum = (pageNum -1 ) * 10 + 1;
		int endNum = startNum + 9 ;
		
		UserVo uVo = new UserVo();
		uVo.setStartNum(startNum);
		uVo.setEndNum(endNum);
		
		List<UserVo> resultVo = homeService.selectAllUserInfo(uVo);
		
		int count = homeService.selectInfoCount();
		
		model.addAttribute("userInfoList", resultVo);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("count", count);
		model.addAttribute("modifyUserInfoResult", modifyUserInfoResult);
		
		return "/home/userInfo";
	}
	
	@RequestMapping(value="/home/deleteInfo", method=RequestMethod.GET)
	public String deleteInfo(HttpServletRequest request,HttpSession session ,Model model) {
		
		String id = (String)session.getAttribute("sessionID");
		
		String email = request.getParameter("email");
		String pageNum = request.getParameter("pageNum");
		
		UserVo uVo = new UserVo();
		uVo.setUser_email(email);
		
		int result = homeService.deleteUserInfo(uVo);
		
		String deleteUserInfoResult = "";
	
		if(result!=1) {
			deleteUserInfoResult = "failDeleteUserInfo";
			if(id.equals("tjoeunteam@gmail.com")) {
				return "redirect:userInfo.do?pageNum" + pageNum;
			}
		}else {
			if(!id.equals("tjoeunteam@gmail.com")) {
				session.removeAttribute("sessionID");	
				deleteUserInfoResult = "successDeleteUserInfo";			
			}else {
				deleteUserInfoResult = "successDeleteUserInfo";	
				return "redirect:userInfo.do?pageNum" + pageNum;
			}
		}
		
		model.addAttribute("deleteUserInfoResult", deleteUserInfoResult);		
		return "/home/homepage";
	}
	
	@RequestMapping(value="/home/modifyUserInfo.do", method=RequestMethod.POST)
	public String modifyUserInfo(HttpServletRequest request, Model model) {
		
		String pageNum = request.getParameter("pageNum");
		String email = request.getParameter("userInfo_Email");
		String pw = request.getParameter("userInfo_PW");
		String name= request.getParameter("userInfo_Name");
		
		UserVo uVo = new UserVo();
		uVo.setUser_email(email);
		uVo.setUser_pw(pw);
		uVo.setUser_name(name);
		
		int result = 0;
		
		result = homeService.modifyUserInfoWithoutEmail(uVo);
		
		String modifyUserInfoResult = "";
		
		if(result == 0) {
			modifyUserInfoResult = "fail";
		}else {
			modifyUserInfoResult = "success";
		}
		
		
		
		return "redirect:userInfo.do?pageNum=" + pageNum + "&modifyUserInfoResult=" + modifyUserInfoResult;
	}
}
