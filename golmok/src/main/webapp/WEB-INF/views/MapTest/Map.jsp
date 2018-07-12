<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Document</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <%@ include file="../include/header.jsp" %>
</head>
<body>
    <div>
    <select id="1type_select" name="1type_select" onchange="" ><option>1차 업종 분류</option></select>    
    <select id="2type_select" name="2type_select"><option>2차 업종 분류</option></select>    
    <select id="3type_select" name="3type_select"><option>3차 업종 분류</option></select>       
    </div>
<script>
    window.onload(ItemOnLoad());

function ItemOnLoad(){
	        var str = '';
            //alert('에이젝스 전송 시작');
            $.ajax({
            	type:"post",
            	url:"${path }Map/get_1type",
            	success:function(result){
            		$("#1type_select").empty();
                    $.each(result, function(index2,value2){
					 str += '<option value="'+value2.STORE_1TYPE_CODE +'" >'+value2.STORE_1TYPE_NAME+'</option>';
                    })
                    document.getElementById("1type_select").innerHTML = str;
            	}
            })
            //alert('전송 종료');
}


</script>

</body>
</html>