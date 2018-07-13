<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
  #golmokImg{
     opacity: 0.2;
     padding-top: 4%;
     padding-left: 10%;
  }
  
  .img .inContent{
     position:absolute;
     top:20%; /* in conjunction with left property, decides the text position */
     left:10%;
     text-align:center;
     width:300px;
   }
   
   #verifyLabel{
     font-size: 2em;
   }
   
   #headingVerify{
     font-size :5em;
   }
   
   input#verify_Info[type="text"]{
     height:30px;
     width : 200px;
   }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/home/menu.jsp"></jsp:include>
<div class="img">
  <img src="<%=request.getContextPath() %>/resources/img/golmokDaejang.jpg"  id="golmokImg"/>
  <div class="inContent">    
    <div class="container">
      <form class="form-signin">
        <h2 class="form-signin-heading" id="headingVerify"><strong>본인 확인</strong></h2><br><br><br>
          <div class="form-group">
            <label for="recipient-name" class="control-label" id="verifyLabel">이메일</label>
            <input type="text" class="form-control" id="verify_Info" name="login_Email" id="login_Email">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label" id="verifyLabel">성함</label>
            <input type="text" class="form-control" id="verify_Info" name="login_PW" id="login_PW">
          </div>
      </form>

    </div>
  </div>
</div>
</body>
</html>