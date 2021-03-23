<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
table.type08 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-left: 1px solid #ccc;
  margin: 20px 10px;
}

table.type08 thead th {
  padding: 10px;
  font-weight: bold;
  border-top: 1px solid #ccc;
  border-right: 1px solid #ccc;
  background: #dcdcd1;
}
table.type08 tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  background: #ececec;
}
table.type08 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
#main{
	height: 420px;
	width: 450px;
	overflow-y: scroll;
	-ms-overflow-style: none;
}
#main::-webkit-scrollbar{
	display: none;
}
</style>
<body>
<div id="main">
	<table class="type08">
	  <thead>
	  <tr>
	    <th scope="cols">${board.title}</th>
	    <th scope="cols">
	    	<input type="button" value="목록" onclick="moveBoard()">
	    	<input type="button" value="이동">
	    	<input type="button" value="삭제">
	    </th>
	  </tr>
	  </thead>
	  <tbody>
	  <tr>
	    <td scope="row">작성자: ${board.userName}</td>
	    <td>${board.uDate} 조회수: ${board.hit}</td>
	  </tr>
	  <tr>
	    <td scope="row" colspan="2">첨부파일</td>
	  </tr>
	  <tr>
	    <td scope="row" colspan="2">${board.content}</td>
	  </tr>
	  <tr>
	    <td scope="row" colspan="2"><img alt="나와라" src='resources/upload/df54dfd7-6534-4932-8682-0645a8ca110e_판다.jpg' width="400"></td>
	  </tr>
	  </tbody>
	</table>
</div>
</body>