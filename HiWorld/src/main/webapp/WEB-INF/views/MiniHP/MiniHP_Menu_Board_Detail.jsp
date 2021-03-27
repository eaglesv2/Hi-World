<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	    	<input type="button" value="목록" onclick="goToFolder('${board.folderSerial}')">
	    	<input type="button" value="이동" onclick="showPopup('${board.boardSerial}')">
	    	<input type="button" value="삭제" onclick="deleteBoard('${board.boardSerial}','${board.file}','${board.folderSerial}')">
	    	<input type="button" value="수정" onclick="updateBoard('${board.boardSerial}')">
	    </th>
	  </tr>
	  </thead>
	  <tbody>
	  <tr>
	    <td scope="row">작성자: ${board.userName}</td>
	    <td>${board.uDate} 조회수: ${board.hit}</td>
	  </tr>
	  <c:if test="${board.file!=null}">
	  <tr>
	    <td scope="row">첨부파일</td>
	    <td>
	    	<a onclick="downloadFile('${board.file}');" style="cursor:pointer;">${board.file}</a>
	    	<%-- <a href="download.do?fileName=${board.file}">${board.file}</a> --%>
	    </td>
	  </tr>
	  </c:if>
	  <tr>
	    <td scope="row" colspan="2">${board.content}</td>
	  </tr>
	  </tbody>
	  <c:if test="${replyList!=null}"><!-- 댓글 개수 구하면 그걸로 비교하기 -->
	  	<tbody>
	  		<tr>
		    	<td scope="row" colspan="2">
		    		<img alt="" src="resources/images/reply-pen.png" width="10px">
		    		댓글 ()
		    	</td>
		    </tr>
	  		<tr>
		    	<td scope="row" colspan="2">
				    <c:forEach items="${replyList}" var="r">
				    	${r.userName}: ${r.replyContent} (${r.cDate})<br>
				    </c:forEach>
		    	</td>
		    </tr>
	  	</tbody>
	  </c:if>	  
	</table>
</div>
</body>
<script>
function downloadFile(file) {
	location.href="download.do?fileName="+file;
}
function showPopup(serial) {
	window.open("updateBoardFolder.do?serial="+serial, "게시글 폴더 이동", "width=400, height=300, left=100, top=50");
}
function goToFolder(folderSerial) {
	var ajaxMain = {
            url : 'miniHpBoard.do?folderSerial='+folderSerial,
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxMain).done(function(data){
        // Contents 영역 삭제
        $('#bodyContents').children().remove();
        // Contents 영역 교체
        $('#bodyContents').html(data);
    });
}
function deleteBoard(boardSerial,file,folderSerial) {
	$.ajax({
		type: 'DELETE',
		url: 'miniHpBoard.do?boardSerial='+boardSerial+"&fileName="+file,
		datatype: 'html'
	}).done(function(data) {
		goToFolder(folderSerial);
	}).fail(function(error) {
		alert(JSON.stringify(error));
	});
}
function updateBoard(boardSerial) {
	var ajaxMain = {
            url : 'MiniHpBoardUpdate.do?serial='+boardSerial,
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxMain).done(function(data){
        // Contents 영역 삭제
        $('#bodyContents').children().remove();
        // Contents 영역 교체
        $('#bodyContents').html(data);
    });
}
</script>