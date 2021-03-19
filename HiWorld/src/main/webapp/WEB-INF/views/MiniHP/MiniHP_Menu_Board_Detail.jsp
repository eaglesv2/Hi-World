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
</style>
<body>
	<table class="type08">
	  <thead>
	  <tr>
	    <th scope="cols">${board.title}</th>
	    <th scope="cols">
	    	<input type="button" value="목록" onclick="moveBoard('miniHpBoard.do?menu=menu4')">
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
	  </tbody>
	</table>
</body>