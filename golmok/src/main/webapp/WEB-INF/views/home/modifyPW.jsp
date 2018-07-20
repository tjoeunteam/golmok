<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String myVerifyCode = (String)request.getAttribute("myVerifyCode");
   String email = (String)request.getAttribute("email");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 #modifyPWTitle{
   text-align:center;
 }
 
 #modifyPWContainer{
    padding-top:5%;
    width:500px;
    height:480px;
    background-color:#E0E0E0;
 }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/home/menu.jsp"></jsp:include>
  <div class="container" id="modifyPWContainer">
    <div class="row">
      <div class="col-sm-12">
        <h1 id="modifyPWTitle">비밀번호 변경</h1><br><br>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-12">
        <form method="post" id="passwordModifyForm" name="passwordModifyForm" action="<%=request.getContextPath()%>/home/modifyPWAction.do" onsubmit="return checkingpasswordModifyForm()">
            <input type="text" class="input-lg form-control" name="password1" id="password1" placeholder="비밀번호" autocomplete="off">
            <div class="row">
              <div class="col-sm-12">
                <span id="isValidPW" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span>비밀번호는  8자리 이상 20자리 이하의 대소문자, 숫자, 특수문자로 구성되어야 합니다.<br>
              </div>
            </div>
            <br>
            <input type="text" class="input-lg form-control" name="password2" id="password2" placeholder="비밀번호 확인" autocomplete="off">
            <div class="row">
              <div class="col-sm-12">
                <span id="PWMatch" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span>비밀번호화 비밀번호 확인은 동일해야 합니다.
              </div>
            </div>
            <br>
            <input type="hidden" id="checkValid" value="no">
            <input type="hidden" name="myVerifyCode" id="myVerifyCode" value="<%=myVerifyCode%>">
            <input type="hidden" name="email" id="email" value="<%=email %>">
            <input type="submit" class="col-xs-12 btn btn-info btn-load btn-lg" data-loading-text="Changing Password..." value="비밀번호 변경하기">
        </form>
      </div><!--/col-sm-6-->
    </div><!--/row-->
  </div>
  <script>
  $("input[type=text]").keyup(function(){
	    //비밀번호 정규식 : #?!@$%^&*- 만 허용
  	    var pwRegExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
  	    
  	    var isValid = true;;
  	    
  	    if(($('#password1').val().length < 8) || ($('#password1').val().length > 20)){
  	    	isValid = false;
  	    }else if($('#password1').val().match(pwRegExp) == null){
  	    	isValid = false;
  	    }
		
		if(isValid == true){
			$("#isValidPW").removeClass("glyphicon-remove");
			$("#isValidPW").addClass("glyphicon-ok");
			$("#isValidPW").css("color","#00A41E");
		}else{
			$("#isValidPW").removeClass("glyphicon-ok");
			$("#isValidPW").addClass("glyphicon-remove");
			$("#isValidPW").css("color","#FF0004");
		}
		
		if($("#password1").val() != ''){			
		    if($("#password1").val() == $("#password2").val()){
			    $("#PWMatch").removeClass("glyphicon-remove");
			    $("#PWMatch").addClass("glyphicon-ok");
			    $("#PWMatch").css("color","#00A41E");
			    $('#checkValid').val('yes');
		    }else{
			    $("#PWMatch").removeClass("glyphicon-ok");
			    $("#PWMatch").addClass("glyphicon-remove");
			    $("#PWMatch").css("color","#FF0004");
			    $('#checkValid').val('no');
		    }
		}
	});
  
  function checkingpasswordModifyForm(){
	  if($('#checkValid').val() != 'yes'){
		  return false;
	  }
	  return true;
  }
  </script>
</body>
</html>