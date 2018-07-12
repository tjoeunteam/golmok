<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <%@ include file="../include/header.jsp" %>
    <title>Document</title>
</head>
<body>
    <div>
    <select id="1type_select" name="1type_select" ><option>1차 업종 분류</option></select>    
    <select id="2type_select" name="2type_select"><option>2차 업종 분류</option></select>    
    <select id="3type_select" name="3type_select"><option>3차 업종 분류</option></select>       
    </div>
<script>
    window.onload(ItemOnLoad());

function ItemOnLoad(){
            //alert('에이젝스 전송 시작');
            $.ajax({
            	type:"post",
            	url:"${path }Map/get_1type",
            	success:function(result){
                    alert(result);
            	}
            })
            //alert('전송 종료');
            //return sendMessage(getMessageText());
}
</script>

</body>
</html>