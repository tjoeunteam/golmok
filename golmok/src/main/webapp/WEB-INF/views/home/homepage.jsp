<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
  #golmokImg{
     opacity: 0.6;
     padding-top:4%;
     padding-left: 10%;
  }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/home/menu.jsp"></jsp:include>
<img src="<%=request.getContextPath() %>/resources/img/golmokDaejang.jpg"  id="golmokImg"/>
<script>
  var joinAlertStr = '<c:out value="${joinAlertStr}"/>';
  var updateVerication = '<c:out value="${updateVerication}"/>';
  var loginResultStr = '<c:out value="${loginResultStr}"/>';
  var loginName = '<c:out value="${loginName}"/>';
  var logoutResultStr = '<c:out value="${logoutResultStr}"/>';
  if(joinAlertStr == 'successJoin'){
	  alert('회원가입이 정상적으로 실행되었습니다. 이메일 인증을 해주세요');
  }else if(joinAlertStr == 'failJoin'){
	  alert('회원가입이 실패하였습니다. 다시 한번 시도해주세요')
  }else if(updateVerication == 'success'){
	  alert('이메일 인증에 성공하였습니다.');
  }else if(updateVerication == 'fail'){
	  alert('이메일 인증에 실패하였습니다. 죄송합니다.');
  }else if(loginResultStr == 'failBecausOfEmail'){
	  alert('잘못된 이메일입니다.');
  }else if(loginResultStr == 'failBecausOfPW'){
	  alert('비밀번호가 틀렸습니다.');
  }else if(loginResultStr == 'notVerifyEmail'){
	  alert('해당 회원님은 이메일부터 인증하여야 로그인할 수 있습니다.')
  }else if(loginResultStr == 'success'){
	  alert('로그인에 성공하였습니다.\n' + loginName + '님 환영합니다.');
  }else if(logoutResultStr == 'logoutSuccess'){
	  alert('로그아웃에 성공하였습니다.\n 안녕히 가세요~')
  }
</script>
</body>
</html>