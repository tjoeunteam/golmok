<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href='board.css'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">


  /* Style inputs, select elements and textareas */
  #boardFRM input[type=text], select, textarea{
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  resize: vertical;
}

#readB input[type=text], select, textarea{
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  resize: vertical;
}
/* Style the label to display next to the inputs */
label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}


/* Style the container */
#boardFRM .container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
} 

/* Floating column for labels: 25% width */
.col-15 {
  float: left;
  width: 15%;
  margin-top: 6px;
  /*padding-left: 10px;*/
}

/* Floating column for inputs: 75% width */
.col-85 {
  float: left;
  width: 85%;
  margin-top: 6px;
  /*padding-right: 10px;*/
}

.col-65 {
  float: left;
  width: 65%;
  margin-top: 6px;
}
.col-90 {
  float: left;
  width: 90%;
  margin-top: 6px;
}
.col-10 {
  float: left;
  width: 10%;
  margin-top: 6px;
  text-align:center;
}
/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
  padding-left : 10px;
  padding-right: 10px;
}

/* Responsive layout - when the screen is less than 400px wide, make the two columns stack on top of each other instead of next to each other */
@media (max-width: 600px) {
  .col-15, .col-85, .col-10, .col-65,.col-90  {
    width: 100%;
    margin-top: 0;
  }
}
   
</style>
</head>
<body>
<jsp:include page="<%=request.getContextPath() %>/home/menu.jsp"></jsp:include>
  <!-- 로그인 버튼 -->
  <div class="navbar navbar-default">
  <div class="container">
      <div class="navbar-header">
        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">골목대장 Q & A</a>
      </div>
      <center>
        <div class="navbar-collapse collapse" id="navbar-main">
          <form class="navbar-form navbar-right" role="search" action="">
            <div class="form-group">
              <select class="form-control" name="setSearchKey" id="setSearchKey">
                  <option value="no">번호</option>
                  <option value="subject" selected>제목</option>
                  <option value="contents">내용</option>
                  <option value="writer">작성자</option>
              </select>
            </div>
            <div class="form-group">
              <input type="text" class="form-control" name="key" placeholder="내용">
            </div>
            <div class="form-group">
              <input type="submit" class="btn btn-default" id="searchBolg" onclick="window.location.href='<%=request.getContextPath() %>/board/list.do'" value="조회">
            </div>
          </form>
        </div>
      </center>     
  </div>
  </div>

  <!-- 게시물 리스트 보여주기 -->
  <div class="container">
    <table class="table table-board table-hover" id="popBoard">
      <colgroup>
        <col width="7%"> <!-- 글번호 -->
        <col width="*"> <!-- 제목 -->
        <col width="15%"> <!-- 작성자 -->
        <col width="10%"> <!-- 작성일 -->
        <col width="7%"> <!-- 조회수 -->
      </colgroup>
      <thead>
        <tr>
          <th style="text-align:center;">No</th>
          <th style="text-align:center;">제목</th>
          <th style="text-align:center;">작성자</th>
          <th style="text-align:center;">작성일</th>
          <th style="text-align:center;">조회수</th>
        </tr>
      </thead>
        <tr onclick="window.location.href='<%=request.getContextPath() %>/board/view.do'">
          <td style="text-align:center;">11</td>
          <td style="text-align:center;">첫게시물</td>
          <td style="text-align:center;">김순자</td>
          <td style="text-align:center;">2018-02-02</td>
          <td style="text-align:center;">2</td>
        </tr>
        <tr onclick="window.location.href='<%=request.getContextPath() %>/board/view.do'">
          <td style="text-align:center;">10</td>
          <td style="text-align:center;">첫게시물</td>
          <td style="text-align:center;">홍길동</td>
          <td style="text-align:center;">2018-02-02</td>
          <td style="text-align:center;">2</td>
        </tr>
    </table>
    <div class="text-center">
    <ul class="pagination pagination-sm">
      <li><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li>
    </ul>
  </div>
    <div class="navbar-right">
      <input type="button" class="btn btn-default" name="listBoard" id="listBoard" onclick="window.location.href='<%=request.getContextPath() %>/board/list.do'" value="목록">
      <input type="button" class="btn btn-default" name="writeB" id="writeBoard" onclick="window.location.href='<%=request.getContextPath() %>/board/write.do'"value="글쓰기">
    </div>
    
  </div>
</body>
