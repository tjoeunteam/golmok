<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
  String joinAlertStr = (String)request.getAttribute("joinAlertStr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/bootstrap.min.css"> --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
#header_cell{
  width:130px;
  text-align:center;
}

#menu_header{
  font-family:'BM JUA','배달의민족 주아',sans-serif;
  font-size:1.8em;
/*   padding-left:2%; */
  /* text-align:center; */
}

#menu_bars{
  font-family:'BM JUA','배달의민족 주아',sans-serif;
  font-size:1.4em;  
}

#login_bars{
  font-family:'BM JUA','배달의민족 주아',sans-serif;
  font-size:1.4em; 
  padding-left:50%;
}

#loginModal_size{
  width:500px;
  font-family:'BM JUA','배달의민족 주아',sans-serif;
  font-size:1.1em;
}

#login_inputs{
  display: inline;
}

.find_ID_PW{
  text-align:center;
}

.find_ID_PW a{
  font-size:0.9em;
  display: inline;
  color:grey;
}

.join_inputs{
  display:inline;
}

#join_warning{
  color:red;
  font-size:0.8em;
}

.birthDay{
  height:25px;
}
</style>
<title>메뉴창</title>
</head>
<body>
  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
      <div class="navbar-header" id="header_cell">
        <a class="navbar-brand" id="menu_header" href="<%=request.getContextPath()%>/home/homepage.do">골목대장</a>
      </div>
      <div id="navbar" class="collapse navbar-collapse"> 
        <ul class="nav navbar-nav" id="menu_bars">
          <li><a href="#">회사소개</a></li>
          <li><a href="#">상권분석</a></li>
          <li><a href="#">Q&A</a></li>
        </ul> 
        <ul class="nav navbar-nav" id="login_bars">
          <li><a href="#" data-toggle="modal" data-target="#loginModal">로그인</a></li>
          <li><a href="#" data-toggle="modal" data-target="#joinModal">회원가입</a></li>
        </ul>
      </div> 
    </div>
  </nav>
  <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content" id="loginModal_size">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="exampleModalLabel"><strong>로그인</strong></h4>
        </div>
        <form>
          <div class="modal-body">
            <div class="form-group">
              <label for="recipient-name" class="control-label">아이디</label>
              <input type="text" class="form-control" id="login_inputs">
            </div>
            <div class="form-group">
              <label for="message-text" class="control-label">비밀번호</label>
              <input type="text" class="form-control" id="login_inputs">
            </div>
          </div>
          <div class="modal-footer">
            <div class="find_ID_PW">
              <a href="#" >아이디찾기</a> |
              <a href="#" class="find_ID_PW">비밀번호찾기</a>
            </div>
            <input type="submit" class="btn btn-info" value="로그인" />
            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content" id="loginModal_size">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="exampleModalLabel"><strong>회원가입</strong></h4>
        </div>
         <!-- onsubmit="return checkJoinForm(this)" -->
        <form name="joinForm" action="joinAction.do" method="POST">
          <div class="modal-body">
            <div class="form-group">
              <label for="recipient-name" class="control-label">이메일</label>
              <input type="text" class="form-control join_inputs" name="join_Email" id="join_Email">
            </div>
            <div class="form-group">
              <label for="message-text" class="control-label">비밀번호</label><span id="join_warning">&nbsp;&nbsp;&nbsp;비밀번호는 한 개이상의 대소문자, 숫자, 특수문자가 들어가야합니다.</span>
              <input type="text" class="form-control join_inputs" name="join_PW" id="join_PW">
            </div>
            <div class="form-group">
              <label for="message-text" class="control-label">비밀번호확인</label>
              <input type="text" class="form-control join_inputs" name="join_CheckPW" id="join_CheckPW">
            </div>
            <div class="form-group">
              <label for="message-text" class="control-label">이름</label>
              <input type="text" class="form-control join_inputs" name="join_Name" id="join_Name">
            </div>
          </div>
          <div class="modal-footer">
            <input type="submit" id="joinForm_submit" class="btn btn-info" value="회원가입" >
            <input type="reset" class="btn btn-danger" value="초기화" >
          </div>
        </form>
      </div>
    </div>
  </div>
  <script>
   $(document).ready(function(){
	   $('#joinForm_submit').on("click",function(){
		   checkJoinForm();        
	    });
   });
    
   function checkJoinForm(){ 
    	var email = $("#join_Email").val();
    	var pw = $("#join_PW").val();
    	var checkPW = $("#join_CheckPW").val();
    	var name = $("#join_Name").val();
    	
    	//이메일 정규식
    	var emaliRegExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.\+]+[0-9a-zA-Z]@[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/i;
    	//비밀번호 정규식 : #?!@$%^&*- 만 허용
    	var pwRegExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    	
    	if(email == "" || email == null){
    		alert("이메일을 꼭 입력해주세요");
    		$('#join_Email').focus();
    		event.preventDefault();
    	}else if(email.match(emaliRegExp) == null){
    		alert("이메일 형식을 맞춰주세요");
    		$('#join_Email').val('');
    		$('#join_Email').focus();
    		event.preventDefault();
    	}else if(pw == "" || pw == null){
    		alert("비밀번호를 꼭 입력해주세요");
    		$('#join_PW').focus();
    		event.preventDefault();
    	}else if((pw.length < 8) && (pw.length > 20)){
    		alert("비밀번호는 8자리 이상 20 자리 이하만 가능합니다.");
    		$('#join_PW').focus();
    		event.preventDefault();
    	}else if(!pw.match(pwRegExp)){
    		alert("비밀번호는 영문(대소문자 각각 1개 필수),숫자,특수문자(#?!@$%^&*- 만 허용)를 혼용하여 입력해주세요");
    		$('#join_PW').focus();
    		event.preventDefault();
    	}else if(checkPW == "" || checkPW == null){
    		alert("비밀번호확인을 꼭 입력해주세요");
    		$('#join_CheckPW').focus();
    		event.preventDefault();
    	}else if(pw != checkPW){
    		alert("비밀번호와 비밀번호확인이 일치하지 않습니다.");
    		$('#join_CheckPW').focus();
    		event.preventDefault();	
    	}else if(name == "" || name == null){
    		alert("이름을 꼭 입력해주세요");
    		$('#join_Name').focus();
    		event.preventDefault();
    	}
    	
    	return true;
    }
   
   <%
     if(!joinAlertStr.equals("") || joinAlertStr != null){
   %>
     alert("<%=joinAlertStr%>");
   <%
     }
   %>
   
  </script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>