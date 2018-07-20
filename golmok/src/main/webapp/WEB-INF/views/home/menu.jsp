<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="golmok.team.vo.UserVo" %>
<%
  String sessionID = "";
  sessionID = (String)session.getAttribute("sessionID");
  
  UserVo loginInfo = null;
  loginInfo = (UserVo)request.getAttribute("loginInfoObj");
  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/bootstrap.min.css"> --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
  padding-left:45%;
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

body{
  font-family:'BM JUA','배달의민족 주아',sans-serif;
}
</style>
<title>메뉴창</title>
</head>
<body>
  <nav class="navbar navbar-inverse">
    <div class="container">
      <div class="navbar-header" id="header_cell">
        <a class="navbar-brand" id="menu_header" href="<%=request.getContextPath()%>/home/homepage.do">골목대장</a>
      </div>
      <div id="navbar" class="collapse navbar-collapse"> 
        <ul class="nav navbar-nav" id="menu_bars">          
          <%
            if(sessionID != null && !sessionID.equals("")){
          %>
          <li><a href="#">회사소개</a></li>
          <li><a href="#">상권분석</a></li>
          <li><a href="#">Q&A</a></li>
          <%
            }else{
          %>
          <li><a href="javascript:notPermitAccess();">회사소개</a></li>
          <li><a href="javascript:notPermitAccess();">상권분석</a></li>
          <li><a href="javascript:notPermitAccess();">Q&A</a></li>
          <%
          
            }
          %>
        </ul> 
        <ul class="nav navbar-nav" id="login_bars">
          <%
            if(sessionID != null && !sessionID.equals("")){
            	if(sessionID.equals("tjoeunteam@gmail.com")){
          %>
            <li><a href="<%=request.getContextPath()%>/home/userInfo.do">회원정보수정</a></li>
            <li><a href="<%=request.getContextPath() %>/home/logout.do">로그아웃</a></li>          
          <%    
            }else{
           %>
            <li><a href="#" data-toggle="modal" data-target="#modifyMyInfoMdoal">내정보수정</a></li>
            <li><a href="<%=request.getContextPath() %>/home/logout.do">로그아웃</a></li>
          <% 
                }
            }else{
            	
          %>
            <li><a href="#" data-toggle="modal" data-target="#loginModal">로그인</a></li>
            <li><a href="#" data-toggle="modal" data-target="#joinModal">회원가입</a></li>
          <%
            }
          %>
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
        <form name="loginForm" action="loginAction.do" method="POST">
          <div class="modal-body">
            <div class="form-group">
              <label for="recipient-name" class="control-label">아이디(이메일)</label>
              <input type="text" class="form-control" id="login_inputs" name="login_Email" id="login_Email">
            </div>
            <div class="form-group">
              <label for="message-text" class="control-label">비밀번호</label>
              <input type="text" class="form-control" id="login_inputs" name="login_PW" id="login_PW">
            </div>
          </div>
          <div class="modal-footer">
            <div class="find_ID_PW">
              <a href="<%=request.getContextPath() %>/home/findPW.do" >비밀번호찾기</a>
            </div>
            <input type="submit" id="loginForm_submit" class="btn btn-info" value="로그인" />
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
              <label for="recipient-name" class="control-label">이메일</label>&nbsp;&nbsp;
              <span><input type="button" class="btn btn-warning btn-sm" id="isDup" value="이메일 중복검사"></span>
              <div>
                <span id="join_warning">&nbsp;이메일 인증을 해야 사이트 이용이 가능하니 사용가능한 이메일을 입력해주세요</span>
              </div>
              <input type="text" class="form-control join_inputs" name="join_Email" id="join_Email">
            </div>
            <div class="form-group">
              <label for="message-text" class="control-label">비밀번호</label>
              <span id="join_warning">&nbsp;&nbsp;&nbsp;비밀번호는 한 개이상의 대소문자, 숫자, 특수문자가 들어가야합니다.</span>
              <input type="text" class="form-control join_inputs" name="join_PW" id="join_PW" placeholder="허용가능 특수문자 : #?!@$%^&*">
            </div>
            <div class="form-group">
              <label for="message-text" class="control-label">비밀번호확인</label>
              <input type="text" class="form-control join_inputs" name="join_CheckPW" id="join_CheckPW">
            </div>
            <div class="form-group">
              <label for="message-text" class="control-label">이름</label>
              <span id="join_warning">&nbsp;&nbsp;&nbsp;비밀번호 변경 시 필요하니 본인의 이름을 적어주세요</span>
              <input type="text" class="form-control join_inputs" name="join_Name" id="join_Name">
            </div>
          </div>
          <div class="modal-footer">
            <input type="hidden" id="DuplicationTest" name="DuplicationTest" />
            <input type="submit" id="joinForm_submit" class="btn btn-info" value="회원가입" >
            <input type="button" id="reset_joinForm" class="btn btn-danger" value="초기화" >
          </div>
        </form>
      </div>
    </div>
  </div>
  <%
    if(loginInfo != null){
  %>
	<div class="modal fade" id="modifyMyInfoMdoal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" id="loginModal_size">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">
						<strong>내 정보 수정</strong>
					</h4>
				</div>
				<!-- onsubmit="return checkJoinForm(this)" -->
				<form name="modifyMyInfoForm" action="modifyMyInfo.do" method="POST">
					<div class="modal-body">
						<div class="form-group">
							<label for="recipient-name" class="control-label">이메일</label>&nbsp;&nbsp;
							<input type="text" class="form-control join_inputs" name="myInfo_Email" id="myInfo_Email" value="<%=loginInfo.getUser_email()%>" readonly>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">비밀번호</label> 
							<span id="join_warning">&nbsp;&nbsp;&nbsp;비밀번호는 한 개이상의 대소문자,숫자, 특수문자가 들어가야합니다.</span> 
							<input type="text" class="form-control join_inputs" name="myInfo_PW" id="myInfo_PW" placeholder="허용가능 특수문자 : #?!@$%^&*">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">비밀번호확인</label> 
							<input type="text" class="form-control join_inputs" name="myInfo_CheckPW" id="myInfo_CheckPW">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">이름</label> 
							<input type="text" class="form-control join_inputs" name="myInfo_Name" id="myInfo_Name" value="<%=loginInfo.getUser_name()%>" readonly>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" id="modifyMyInfoForm_submit" class="btn btn-info" value="비밀번호 변경"> 
						<input type="button" id="delete_myInfoForm" class="btn btn-danger" value="회원탈퇴">
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
		}
	%>
  <script>
			$('#joinForm_submit').on('click', function() {
				checkJoinForm()
			});

			$('#loginForm_submit').on('click', function() {
				checkloginForm()
			});

			$('#reset_joinForm').on('click', function() {
				resetJoinForm()
			});
			
			$('#modifyMyInfoForm_submit').on('click', function(){
				modifyMyInfoForm()
			});
			
			$('#delete_myInfoForm').on('click', function(){
				confirmDelete()
			});

			function notPermitAccess() {
				alert('로그인을 하셔야 이용가능합니다.');
			}

			function resetJoinForm() {
				$("#join_Email").val('');
				$("#join_PW").val('');
				$("#join_CheckPW").val('');
				$("#join_Name").val('');
				$("#DuplicationTest").val('');
				$('#join_Email').attr("readonly", false);
				event.preventDefault();
			}

			function checkJoinForm() {
				var email = $("#join_Email").val();
				var pw = $("#join_PW").val();
				var checkPW = $("#join_CheckPW").val();
				var name = $("#join_Name").val();
				var DuplicationTest = $("#DuplicationTest").val();

				//이메일 정규식
				var emaliRegExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.\+]+[0-9a-zA-Z]@[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/i;
				//비밀번호 정규식 : #?!@$%^&*- 만 허용
				var pwRegExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

				if (email == "" || email == null) {
					alert("이메일을 꼭 입력해주세요");
					$('#join_Email').focus();
					event.preventDefault();
				} else if (email.match(emaliRegExp) == null) {
					alert("이메일 형식을 맞춰주세요");
					$('#join_Email').val('');
					$('#join_Email').focus();
					event.preventDefault();
				} else if (pw == "" || pw == null) {
					alert("비밀번호를 꼭 입력해주세요");
					$('#join_PW').focus();
					event.preventDefault();
				} else if ((pw.length < 8) && (pw.length > 20)) {
					alert("비밀번호는 8자리 이상 20 자리 이하만 가능합니다.");
					$('#join_PW').focus();
					event.preventDefault();
				} else if (!pw.match(pwRegExp)) {
					alert("비밀번호는 영문(대소문자 각각 1개 필수),숫자,특수문자(#?!@$%^&*- 만 허용)를 혼용하여 입력해주세요");
					$('#join_PW').focus();
					event.preventDefault();
				} else if (checkPW == "" || checkPW == null) {
					alert("비밀번호확인을 꼭 입력해주세요");
					$('#join_CheckPW').focus();
					event.preventDefault();
				} else if (pw != checkPW) {
					alert("비밀번호와 비밀번호확인이 일치하지 않습니다.");
					$('#join_CheckPW').focus();
					event.preventDefault();
				} else if (name == "" || name == null) {
					alert("이름을 꼭 입력해주세요");
					$('#join_Name').focus();
					event.preventDefault();
				} else if (DuplicationTest != 'yes') {
					alert('이메일 중복검사를 꼭 해주세요');
					event.preventDefault();
				}

				return true;
			}

			$('#isDup')
					.click(
							function(e) {
								var join_email = $('#join_Email').val();
								//이메일 정규식
								var emaliRegExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.\+]+[0-9a-zA-Z]@[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/i;

								if (join_email.match(emaliRegExp) == null) {
									alert("이메일 형식을 맞춰주세요");
									$('#join_Email').val('');
									$('#join_Email').focus();
									event.preventDefault();
								} else {
									isDuplication(join_email);
								}
							});

			function isDuplication(join_email) {
				$
						.ajax({
							type : "post",
							url : '<%=request.getContextPath()%>/home/isDuplicated.do',
            data:{
         	   join_email : join_email
            },
            success:function(data){
 			  if(data == 'doNotHave'){
 				  var cResult = confirm('사용할 수 있는 이메일입니다. 사용하시겠습니까?');
 				  
 				  if(cResult){
 					  $('#DuplicationTest').val('yes');
 					  $('#join_Email').attr("readonly", true);
 				  }else{
 					  alert('새로운 이메일 입력해주세요.');
 					  $('#join_Email').val('');
 					  $('#join_Email').focus();
 				  }
 			  }else if(data == 'have'){
 				  alert('중복된 이메일이 있습니다. 다른 이메일 입력해주세요.');
 				  $('#join_Email').val('');
 				  $('#join_Email').focus();
 			  }
            }

         })
    }
    
    function checkloginForm(){
    	var login_Email = $('#login_Email').val();
    	var pw = $('#login_PW').val();
    	//이메일 정규식
    	var emaliRegExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.\+]+[0-9a-zA-Z]@[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/i;
    	//비밀번호 정규식 : #?!@$%^&*- 만 허용
    	var pwRegExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    	
    	if(login_Email.match(emaliRegExp) == null){
     		alert("이메일 형식을 맞춰주세요");
     		$('#login_Email').val('');
     		$('#login_Email').focus();
     		event.preventDefault();
     	}else if((pw.length < 8) && (pw.length > 20)){
    		alert("비밀번호는 8자리 이상 20 자리 이하만 가능합니다.");
    		$('#login_PW').focus();
    		event.preventDefault();
    	}else if(!pw.match(pwRegExp)){
    		alert("비밀번호는 영문(대소문자 각각 1개 필수),숫자,특수문자(#?!@$%^&*- 만 허용)를 혼용하여 입력해주세요");
    		$('#login_PW').focus();
    		event.preventDefault();
    	}
    }
    
    function modifyMyInfoForm(){
    	
    	var PW = $('#myInfo_PW').val();
    	var checkPW = $('#myInfo_CheckPW').val();    	
        //비밀번호 정규식
  	    var pwRegExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
  	    
  	    if((PW == null) || (PW == '')){
  	    	alert('비밀번호를 입력해주세요');
  	    	$('#myInfo_PW').focus();
  	    	event.preventDefault();
  	    }else if((PW.length < 8) || (PW.length > 20)){
  	    	alert("비밀번호는 8자리 이상 20자리 이하여야합니다.");
  	    	$('#myInfo_PW').val('');
  	    	$('#myInfo_PW').focus();
  	    	event.preventDefault();
  	    }else if(PW.match(pwRegExp) == null){
  	    	alert('비밀번호는 한개 이상의 대,소문자와 숫자 그리고 특수문자(#?!@$%^&*-)가 들어가야합니다.');
  	    	$('#myInfo_PW').val('');
  	    	$('#myInfo_PW').focus();
  	    	event.preventDefault();
  	    }else if(PW != checkPW){
  	    	alert('비밀번호와 비밀번호 확인은 동일해야 합니다.');
  	    	$('#myInfo_CheckPW').val('');
  	    	$('#myInfo_CheckPW').focus();
  	    	event.preventDefault();
  	    }
    	
    	return true;
    }
    
    function confirmDelete(){
    	var email = $('#myInfo_Email').val();
    	var name = $('#myInfo_Name').val();
    	var address = "<%=request.getContextPath()%>/home/deleteInfo?email=";
    	
    	var target = address + email;
    	
    	var result = confirm(name+'('+email+')님 탈퇴하시겠습니까?');
  
    	if(result){
    		location.href=target;
    	}else{
    		event.preventDefault();
    	}
    }


  </script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>