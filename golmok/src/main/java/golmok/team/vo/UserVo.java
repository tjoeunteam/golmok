package golmok.team.vo;

import java.sql.Date;

public class UserVo {
	
	private String user_email;
	private String user_pw;
	private String user_name;
	private String user_verifyCode;
	private Date user_joinDate;
	private String user_isUser;
	
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_verifyCode() {
		return user_verifyCode;
	}
	public void setUser_verifyCode(String user_verifyCode) {
		this.user_verifyCode = user_verifyCode;
	}
	public Date getUser_joinDate() {
		return user_joinDate;
	}
	public void setUser_joinDate(Date user_joinDate) {
		this.user_joinDate = user_joinDate;
	}
	public String getUser_isUser() {
		return user_isUser;
	}
	public void setUser_isUser(String user_isUser) {
		this.user_isUser = user_isUser;
	}
	
	

}
