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
    <select id="1type_select" name="1type_select" onchange="SecondTypeLoad()" ><option>1차 업종 분류</option></select>    
    <select id="2type_select" name="2type_select" onchange="ThirdTypeLoad()"><option>2차 업종 분류</option></select>    
    <select id="3type_select" name="3type_select"><option>3차 업종 분류</option></select>
    <input id="typeButton" type="button" value="선택">        
    </div>
            <div id="content">
        <table border="1" id="list_table">
	<colgroup>
		<!-- column 의 설정을 할수 있다. -->
		<col style="width:70px;">
		<col style="width:200px;">
		<col style="width:300px;">
		<col style="width:200px;">
	</colgroup>

	<thead>
		<tr>
			<th>골목길 이름</th>
			<th>업종 이름</th>
			<th>해당 점포의 평균 월 매출</th>
			<th>점수</th>
			<th>해당 골목길의 유사업종 점포수</th>
		</tr>
	</thead>
	<tbody>

	</tbody>
</table>

    </div>
    
<script>
    /* window.onload(ItemOnLoad()); */
    $(document).ready(function() { ItemOnLoad(); });

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

function SecondTypeLoad(){
	var target = document.getElementById("1type_select");
    var str = '';
    //alert('에이젝스 전송 시작');
    //alert(target.options[target.selectedIndex].value);
    $.ajax({
    	type:"post",
    	url:"${path }Map/get_2type",
    	data:{
    		STORE_1TYPE_CODE:target.options[target.selectedIndex].value
    	},
    	success:function(result){
    		$("#2type_select").empty();
            $.each(result, function(index2,value2){
			 str += '<option value="'+value2.STORE_2TYPE_CODE +'" >'+value2.STORE_2TYPE_NAME+'</option>';
            })
            document.getElementById("2type_select").innerHTML = str;
    	}
    })
    //alert('전송 종료');
}
function ThirdTypeLoad(){
	var target = document.getElementById("2type_select");
    var str = '';
    //alert('에이젝스 전송 시작');
    $.ajax({
    	type:"post",
    	url:"${path }Map/get_3type",
    	data:{
    		STORE_2TYPE_CODE:target.options[target.selectedIndex].value
    	},
    	success:function(result){
    		$("#3type_select").empty();
            $.each(result, function(index2,value2){
			 str += '<option value="'+value2.STORE_TYPE_CODE +'" >'+value2.STORE_TYPE_NAME+'</option>';
            })
            document.getElementById("3type_select").innerHTML = str;
    	}
    })
    //alert('전송 종료');
}

	$('#typeButton').click(function(){
		var target = document.getElementById("3type_select");
		if(target.options[target.selectedIndex].value != '3차 업종 분류'){
		alert(target.options[target.selectedIndex].value);
	    $.ajax({
	    	type:"post",
	    	url:"${path }Map/get_recomend",
	    	data:{
	    		STORE_TYPE_CODE:target.options[target.selectedIndex].value
	    	},
	    	success:function(result){	    		
	            $.each(result, function(index,value){
				 //데이터를 이용 테이블 생성
	    			$('#list_table').append(
	    					$('<tr>').append(
	    					$('<td>').append(value.sale_name),
	    					$('<td>').append(value.SALE_SEVICE_NAME),
	    					$('<td>').append(value.earn + "백만원"),
	    					$('<td>').append(value.score),
	    					$('<td>').append(value.sale_store_count)
	    				)
	    			);
	            })         
	    	}
	    })
	}
		else{alert("3차 업종을 선택하세요")};
	})



</script>

</body>
</html>