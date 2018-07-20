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
     padding-left: 10%;
  }
  
  .img .inContent{
     position:absolute;
     top:20%; /* in conjunction with left property, decides the text position */
     left:35%;
     text-align:center;
     width:500px;
     height:400px;
     background-color: #F7F7F7;
     color:#0E2F44;
   }
   
   span#header{
     font-size: 5em;
     opacity: 0.8;
   }
   
   .divForContent{
     padding-left:10%;
     text-align:left;
   }
   
   span#content{
     font-size: 3em;
     opacity: 0.8;
     
   }
   
   .img .inContent input[type="text"]{
     height: 40px;
     width:400px;
     font-size:1.6em;
   }
   
   #verifyFormButton{
     padding-top:8%;
     padding-left:65%;
   }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/home/menu.jsp"></jsp:include>
<div class="img">
  <img src="<%=request.getContextPath()%>/resources/img/golmokDaejang.jpg" id="golmokImg">
  <div class="inContent">
    <div>
      <span id="header"><strong>비밀번호 찾기</strong></span>
    </div>
    <form action="<%=request.getContextPath() %>/home/findPWAction.do" name="findPW" method="POST">
      <div class="divForContent">
        <span id="content">이메일</span>
        <div>
          <input type="text" id="verifyEmail" name="verifyEmail">
        </div>
        <span id="content">이름</span>
        <div>
          <input type="text" id="verifyName" name="verifyName">
        </div>
        <div id="verifyFormButton">
          <input type="submit" class="btn btn-info btn-lg" id="findPWButton" name="findPWButton" value="비밀번호 찾기">
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>