<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="golmok.team.vo.UserVo" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
  List<UserVo> userInfoList = (List<UserVo>)request.getAttribute("userInfoList");
  int count = (int)request.getAttribute("count");
  int pageNum = (int)request.getAttribute("pageNum");	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.userInfoBoard{
  text-align:center;
  padding-top:1%;
  padding-left:15%;
  width:1300px;
}
.table-bordered {
border: 1px solid #dddddd;
border-collapse: separate;
border-left: 0;
-webkit-border-radius: 4px;
-moz-border-radius: 4px;
border-radius: 4px;
}

.table {
width: 100%;
margin-bottom: 20px;
background-color: transparent;
border-collapse: collapse;
border-spacing: 0;
display: table;
}

.widget.widget-table .table {
margin-bottom: 0;
border: none;
}

.widget.widget-table .widget-content {
padding: 0;
}

.widget .widget-header + .widget-content {
border-top: none;
-webkit-border-top-left-radius: 0;
-webkit-border-top-right-radius: 0;
-moz-border-radius-topleft: 0;
-moz-border-radius-topright: 0;
border-top-left-radius: 0;
border-top-right-radius: 0;
}

.widget .widget-content {
padding: 20px 15px 15px;
background: #FFF;
border: 1px solid #D5D5D5;
-moz-border-radius: 5px;
-webkit-border-radius: 5px;
border-radius: 5px;
}

.widget .widget-header {
position: relative;
height: 40px;
line-height: 40px;
background: #E9E9E9;
background: -moz-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #fafafa), color-stop(100%, #e9e9e9));
background: -webkit-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
background: -o-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
background: -ms-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
background: linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
text-shadow: 0 1px 0 #fff;
border-radius: 5px 5px 0 0;
box-shadow: 0 2px 5px rgba(0,0,0,0.1),inset 0 1px 0 white,inset 0 -1px 0 rgba(255,255,255,0.7);
border-bottom: 1px solid #bababa;
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9');
-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
border: 1px solid #D5D5D5;
-webkit-border-top-left-radius: 4px;
-webkit-border-top-right-radius: 4px;
-moz-border-radius-topleft: 4px;
-moz-border-radius-topright: 4px;
border-top-left-radius: 4px;
border-top-right-radius: 4px;
-webkit-background-clip: padding-box;
}

thead {
display: table-header-group;
vertical-align: middle;
border-color: inherit;
}

#divForPageNum{
  widht:500px;
}

a.pageNum{
  font-size: 1.3em;
  color:gray;
  text-decoration: none;
}
a.pageNum:hover{
  text-decoration: none;
  color:gray;
}

a.pageNum#isPageNum{
  text-decoration: none;
  font-weight:bold;
  color:black;
}

a.pageNum#isPageNum:hover{
  text-decoration: none;
  color:black;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/home/menu.jsp"></jsp:include>
  <div class="userInfoBoard">
     <h1>회원 정보</h1>
	<div class="span7">
		<div class="widget stacked widget-table action-table">
			<div class="widget-header">
				<i class="icon-th-list"></i>
			</div>
			<!-- /widget-header -->

			<div class="widget-content">

				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="text-align:center;">이메일</th>
							<th style="text-align:center;">회원가입일</th>
							<th style="text-align:center;">성명</th>
							<th style="text-align:center;">인증유무</th>
							<th style="text-align:center;">수정/삭제</th>
						</tr>
					</thead>
					<tbody>
					    <%
					      for(UserVo userInfo : userInfoList){
					    %>
							<tr>
								<td style="width:370px;"><%=userInfo.getUser_email() %></td>
								<td style="widht:228px;">
								  <%
								    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
								    Date date = userInfo.getUser_joinDate();
								  %>
								  <%=df.format(date) %>
								</td>
								<td style="width:123px;"><%=userInfo.getUser_name() %></td>
								<td>
								  <%
								    if(userInfo.getUser_isUser().equals("T")){								    	
								  %>
								  회원인증완료
								  <%
								    }else{
								  %>
								  회원인증대기
								  <%
								    }
								  %>
								</td>
								<td class="td-actions" style="width:228px;">
								  <%
								    if(!userInfo.getUser_email().equals("tjoeunteam@gmail.com")){
								  %>
								  <button class="btn btn-primary btn-xs" onclick="javascript: modifyUserInfo('<%=userInfo.getUser_email()%>','<%=userInfo.getUser_name()%>','<%=pageNum%>')">수정</button>&nbsp;&nbsp;&nbsp;
								  <button class="btn btn-danger btn-xs" onclick="javascript: removeUserInfo('<%=userInfo.getUser_email()%>','<%=userInfo.getUser_name()%>','<%=pageNum%>')">삭제</button>
								  <%
								    }else{
								  %>
								  <button class="btn btn-primary btn-xs" onclick="javascript: modifyUserInfo('<%=userInfo.getUser_email()%>','<%=userInfo.getUser_name()%>','<%=pageNum%>')">수정</button>
								  <%
								    }
								  %>
								</td>
							</tr>
							<%
					      }
						%>
					</tbody>
				</table>
				<div id="divForPageNum">
				<%
				  if(pageNum != 1){
				%>
					<a href="<%=request.getContextPath()%>/home/userInfo.do?pageNum=1" class="pageNum"><span>[처음]</span></a>
					<a href="<%=request.getContextPath()%>/home/userInfo.do?pageNum=<%=pageNum-1%>" class="pageNum"><span>[이전]</span></a>				
				<%
				  }
				  
				  int entirePage = 0;
				  
				  if(count % 10 == 0){
					  entirePage = count / 10 ;
				  }else{
					  entirePage = count / 10 + 1;
				  }
				  
				  if(entirePage <= 10){
				    	for(int i=1; i<=entirePage; i++){
				    		if(pageNum == i){
			    %>
			    				<a href="<%=request.getContextPath()%>/home/userInfo.do?pageNum=<%=i%>" class="pageNum" id="isPageNum"><%=i %></a>								
				<%    						
				    		}else{
				%>
			    				<a href="<%=request.getContextPath()%>/home/userInfo.do?pageNum=<%=i%>" class="pageNum"><%=i %></a>	
				<%    			
				    		}
				    	}
				  }else{
					  if(pageNum <= 5){
						  for(int i=1; i<=10; i++){
							  if(pageNum == i){
				%>				
				      		 	 <a href="request.getContextPath()%>/home/userInfo.do?pageNum=<%=i%>" class="pageNum" id="isPageNum"><%=i %></a>
				<%
							  }else{
				%>
				      		 	 <a href="request.getContextPath()%>/home/userInfo.do?pageNum=<%=i%>" class="pageNum"><%=i %></a>				
				<%				  
							  }
					  	}
				  	}else if(pageNum >= entirePage-4){
				    		for(int i=entirePage-9; i<=entirePage; i++){
				    			if(pageNum == i){
			    %>
			    	    	 	<a href="request.getContextPath()%>/home/userInfo.do?pageNum=<%=i%>" class="pageNum" id="isPageNum"><%=i %></a>
			    <% 
				    			}else{
				%>
			    	    	 	<a href="request.getContextPath()%>/home/userInfo.do?pageNum=<%=i%>" class="pageNum"><%=i %></a>				
				<%    				
				    			}
				    	}
				  	}else{
				  		for(int i=pageNum-4; i<=pageNum+5; i++){
				%>
				    		<a href=""><%=i %></a>
				<%  	
				  		}
				  	}
				  }
				  if(pageNum!=entirePage){
				%>
					<a href="<%=request.getContextPath()%>/home/userInfo.do?pageNum=<%=pageNum+1%>" class="pageNum"><span>[다음]</span></a>	
					<a href="<%=request.getContextPath()%>/home/userInfo.do?pageNum=<%=entirePage%>" class="pageNum"><span>[끝]</span></a>						
				<%
				  }
				%>
				</div>
			</div>
			<!-- /widget-content -->

		</div>
		<!-- /widget -->
	</div>
  </div>
  
  <div class="modal fade" id="modifyUserInfoMdoal" tabindex="-1"
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
				<form name="modifyMyInfoForm" action="modifyUserInfo.do" method="POST">
					<div class="modal-body">
						<div class="form-group">
							<label for="recipient-name" class="control-label">이메일</label>&nbsp;&nbsp;
							<input type="text" class="form-control join_inputs" name="userInfo_Email" id="userInfo_Email" value="">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">비밀번호</label> 
							<span id="join_warning">&nbsp;&nbsp;&nbsp;비밀번호는 한 개이상의 대소문자,숫자, 특수문자가 들어가야합니다.</span> 
							<input type="text" class="form-control join_inputs" name="userInfo_PW" id="userInfo_PW" placeholder="허용가능 특수문자 : #?!@$%^&*">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">비밀번호확인</label> 
							<input type="text" class="form-control join_inputs" name="userInfo_CheckPW" id="userInfo_CheckPW">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">이름</label> 
							<input type="text" class="form-control join_inputs" name="userInfo_Name" id="userInfo_Name" value="">
						</div>
					</div>
					<div class="modal-footer">
					    <input type="hidden" id="pageNum" name="pageNum" value="">
						<input type="submit" id="modifyMyInfoForm_submit" class="btn btn-info" value="회원정보 변경"> 
						<button id="delete_userInfo" class="btn btn-danger">회원강제탈퇴</button>
					</div>
				</form>
			</div>
		</div>
	</div>
  <script>

	
	$('#modifyMyInfoForm_submit').on('click', function(){
		modifyMyInfoForm()
	});
	
	$('#delete_userInfo').on('click', function(){
		delete_userInfoValidation()
	}); 
	

    
    function modifyUserInfo(originEmail, name , pageNum){
    	var email = originEmail;
    	$('#userInfo_Email').val(email);
    	$('#userInfo_Name').val(name);
    	$('#pageNum').val(pageNum);
		$('#userInfo_Email').attr("readonly", true);
    	$('#modifyUserInfoMdoal').modal('show')   
    }
    
	 function modifyMyInfoForm(){
	    	
	    	var PW = $('#userInfo_PW').val();
	    	var checkPW = $('#userInfo_CheckPW').val();  
	        //비밀번호 정규식
	  	    var pwRegExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	  	    
	  	    if((PW == null) || (PW == '')){
	  	    	alert('비밀번호를 입력해주세요');
	  	    	$('#userInfo_PW').focus();
	  	    	event.preventDefault();
	  	    }else if((PW.length < 8) || (PW.length > 20)){
	  	    	alert("비밀번호는 8자리 이상 20자리 이하여야합니다.");
	  	    	$('#userInfo_PW').val('');
	  	    	$('#userInfo_PW').focus();
	  	    	event.preventDefault();
	  	    }else if(PW.match(pwRegExp) == null){
	  	    	alert('비밀번호는 한개 이상의 대,소문자와 숫자 그리고 특수문자(#?!@$%^&*-)가 들어가야합니다.');
	  	    	$('#userInfo_PW').val('');
	  	    	$('#userInfo_PW').focus();
	  	    	event.preventDefault();
	  	    }else if(PW != checkPW){
	  	    	alert('비밀번호와 비밀번호 확인은 동일해야 합니다.');
	  	    	$('#userInfo_CheckPW').val('');
	  	    	$('#userInfo_CheckPW').focus();
	  	    	event.preventDefault();
	  	    }
	    	
	    	return true;
	    }
    
	
    
    function delete_userInfoValidation(){
		var email = $('#userInfo_Email').val();
		var name = $('#userInfo_Name').val();
		var pageNum = <%=pageNum%>;
		
		if(email == 'tjoeunteam@gmail.com'){
			alert('관리자는 강제 탈퇴가 불가능합니다.');
			event.preventDefault();
		}else{
			var address1 = "<%=request.getContextPath()%>/home/deleteInfo?email=";
	    	var address2 = "&pageNum=";
	    	var target = address1 + email + address2 + pageNum;   
	    	
			event.preventDefault();		

	    	var result = confirm(name + '(' + email + ')님을 강제탈퇴시키시겠습니까?');
	    	
	    	if(result){
	    		location.href=target;
	    	}			
		}
	
    	
    } 
    
	
	
	    
    function removeUserInfo(email, name, pageNum){
    	
    	var address1 = "<%=request.getContextPath()%>/home/deleteInfo?email=";
    	var address2 = "&pageNum=";
    	var target = address1 + email + address2 + pageNum;   	

    	var result = confirm(name + '(' + email + ')님을 강제탈퇴시키시겠습니까?');
    	
    	if(result){
    		location.href=target;
    	}
    }
    
    
    var deleteUserInfoResult = '<c:out value="${deleteUserInfoResult}"/>';
    
    if(deleteUserInfoResult == 'failDeleteUserInfo'){
  	  alert('회원탈퇴에 실패했습니다.');
    }else if(deleteUserInfoResult == 'successDeleteUserInfo'){
  	  alert('회원탈퇴에 성공하였습니다.');E
    }    
   
   var modifyUserInfoResult = '<c:out value="${modifyUserInfoResult}"/>';   
     
   if(modifyUserInfoResult == 'success'){    	
	   alert('회원변경 성공!');     
   }else if(modifyUserInfoResult == 'fail'){    	
	   alert('회원변경 실패');    
   }
  </script>
</body>
</html>