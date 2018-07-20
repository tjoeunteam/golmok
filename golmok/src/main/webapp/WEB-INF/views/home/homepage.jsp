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
  }
  p{
    text-align:center;
  }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/home/menu.jsp"></jsp:include>
<p><img src="<%=request.getContextPath() %>/resources/img/golmokDaejang.jpg"  id="golmokImg"/></p>
<script>
  var joinAlertStr = '<c:out value="${joinAlertStr}"/>';
  var updateVerication = '<c:out value="${updateVerication}"/>';
  var loginResultStr = '<c:out value="${loginResultStr}"/>';
  var loginName = '<c:out value="${loginName}"/>';
  var logoutResultStr = '<c:out value="${logoutResultStr}"/>';
  var verifyUserResultStr = '<c:out value="${verifyUserResultStr}"/>';
  var modifyPWResultStr = '<c:out value="${modifyPWResultStr}"/>';
  var modifyMyPWResult = '<c:out value="${modifyMyPWResult}"/>';
  var deleteUserInfoResult = '<c:out value="${deleteUserInfoResult}"/>';
  
  if(joinAlertStr == 'successJoin'){
	  alert('회원가입이 정상적으로 실행되었습니다.\n이메일 인증을 해주세요');
  }else if(joinAlertStr == 'failJoin'){
	  alert('회원가입이 실패하였습니다.\n다시 한번 시도해주세요')
  }else if(updateVerication == 'success'){
	  alert('이메일 인증에 성공하였습니다.');
  }else if(updateVerication == 'fail'){
	  alert('이메일 인증에 실패하였습니다.');
  }else if(loginResultStr == 'failBecausOfEmail'){
	  alert('잘못된 이메일입니다.');
  }else if(loginResultStr == 'failBecausOfPW'){
	  alert('비밀번호가 틀렸습니다.');
  }else if(loginResultStr == 'notVerifyEmail'){
	  alert('해당 회원님은 이메일부터 인증하여야 로그인할 수 있습니다.')
  }else if(loginResultStr == 'success'){
	  alert('로그인에 성공하였습니다.\n' + loginName + '님 환영합니다.');
  }else if(logoutResultStr == 'logoutSuccess'){
	  alert('로그아웃에 성공하였습니다.\n안녕히 가세요~')
  }else if(verifyUserResultStr == 'successVerification'){
	  alert('본인 확인이 완료되었습니다.\n비밀번호 변경 url이 이메일로 발송되었습니다.')
  }else if(verifyUserResultStr == 'failVerification'){
	  alert('본인 확인이 실패하였습니다.\n이메일 주소와 성명을 확인해주세요.')
  }else if(verifyUserResultStr == 'failVerificationNotUser'){
	  alert('먼저 회원인증을 하셔야 비밀번호를 바꾸실 수 있습니다.')
  }else if(modifyPWResultStr == 'failModifyPW'){
	  alert('비밀번호 변경에 실패하였습니다\n다시 시도해주세요')
  }else if(modifyPWResultStr == 'successModifyPW'){
	  alert('비밀번호 변경에 성공하였습니다.');
  }else if(modifyMyPWResult == 'failModifyMyPW'){
	  alert('비밀번호 변경에 실패하였습니다.')
  }else if(modifyMyPWResult == 'successModifyMyPW'){
	  alert('비밀번호 변경에 성공하였습니다.\n다시 로그인해주세요');
  }else if(deleteUserInfoResult == 'failDeleteUserInfo'){
	  alert('회원탈퇴에 실패했습니다.')
  }else if(deleteUserInfoResult == 'successDeleteUserInfo'){
	  alert('회원탈퇴에 성공하였습니다.')
  }
</script>
</body>
</html>