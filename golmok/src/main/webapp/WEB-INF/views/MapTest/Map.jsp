<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Document</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/css/TextStyle.css">
        <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=x5ATKDpbIxnEMWZC1hj7&submodules=geocoder"></script>
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
    
<div id="wrap" class="section" style="visibility: visible;">
    <div id="map" style="width:30%;height:600px;">
        <div class="search" style="">
            <input id="address" type="text" placeholder="검색할 주소" value="동일로 248길" />
            <input id="submit" type="button" value="주소 검색" />
        </div>
    </div>
</div>
    
    
    
<script>
    /* window.onload(ItemOnLoad()); */
    $(document).ready(function() { ItemOnLoad(); });

    //대분류 옵션 불러오기
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
	//중분류 옵션 불러오기
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
	//소분류 옵션 불러오기
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
	//선택버튼 눌렀을시  테이블 생성 후 값 집어넣어주기
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
	
//지도 스크립트-------------------------------------------------------------------------------------------------
	function Get_Stores(pointx /* == 127~ */ , pointy /*= 30~  */){
	    $.ajax({
	    	type:"post",
	    	url:"${path }Map/get_2type",
	    	data:{
	    		STORE_Y:pointx,
	    		STORE_X:pointy  //x y 반대로 입력함
	    	},
	    	success:function(result){
	            $.each(result, function(index,value){
				 
	            })
	    	}
	    })
		}
	
	function CreateMarker(pointx , pointy){
		
	}
		//맵 설정
		var map = new naver.maps.Map("map", {
	        center: new naver.maps.LatLng(37.3595316, 127.1052133),
	        zoom: 11,
	        mapTypeControl: true
	    });
		//네모 도형 설정
	        var rectangle = new naver.maps.Rectangle({
	        map: map,
	        bounds: new naver.maps.LatLngBounds(
	            new naver.maps.LatLng(37.565, 126.9761217732253),  // sw
	            new naver.maps.LatLng(37.568, 126.980655026774)   // ne
	        ),
	        strokeColor: '#5347AA',
	        strokeOpacity: 0.8,
	        strokeWeight: 2,
	        fillColor: '#E51D1A',
	        fillOpacity: 0.6
	    });
			//네모의 위치를 변경하는 함수
	       function set_recbound(pointx,pointy){
	           rectangle.setBounds(
	                       new naver.maps.LatLngBounds(
	                       new naver.maps.LatLng(pointy-0.004, pointx-0.004),
	                       new naver.maps.LatLng(pointy+0.004, pointx+0.004))
	                   );
	       }
	    
	    map.setCursor('pointer');
	    //주소를 좌표로 변경
	    function searchAddressToCoordinate(address) {
            naver.maps.Service.geocode({
                address: address
            }, function(status, response) {
                if (status === naver.maps.Service.Status.ERROR) {
                    return alert('Something Wrong!');
                }
                var item = response.result.items[0],
                    addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]', //지번주소인지 도로명주소인지?
                    point = new naver.maps.Point(item.point.x, item.point.y); //나오는 결과값의 좌표를 point에 저장
                map.setCenter(point);	//맵 center값 변경
                // alert(point.x);
                // alert(point.y);
                set_recbound(point.x,point.y); //center값의 기준으로 네모를 그려줌

                
            });
        }
        
 
		//검색착에 실행할 경우
        function initGeocoder() {
            var point;
            $('#address').on('keydown', function(e) {
                var keyCode = e.which;
                if (keyCode === 13) { // Enter Key
                    searchAddressToCoordinate($('#address').val());
                    
                }
            });
            $('#submit').on('click', function(e) {
                e.preventDefault();
                searchAddressToCoordinate($('#address').val());
            });
            searchAddressToCoordinate('창천동 20-51 신영스카이텔');
        }
        naver.maps.onJSContentLoaded = initGeocoder;

            //         $('#rec_chan').on('click', function(e) {
            //             rectangle.setBounds(
            //                 new naver.maps.LatLngBounds(
            //                 new naver.maps.LatLng(37.1793196, 125.8795594),
            //                 new naver.maps.LatLng(37.5398662, 126.3312422))
            //             );
            // });



        

</script>

</body>
</html>