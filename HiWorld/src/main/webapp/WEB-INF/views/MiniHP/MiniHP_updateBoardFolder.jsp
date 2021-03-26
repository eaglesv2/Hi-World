<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
<center><h3>이동할 폴더를 선택해주세요</h3></center>
<hr>
<c:forEach items="${folderList}" var="l">
	<a onclick="updateBoardFolder('${serial}','${l.serial}')" style="cursor:pointer;">
		${l.folderName}
	</a><br><br>
</c:forEach>
</body>
<script>
	function updateBoardFolder(boardSerial, folderSerial) {
		$.ajax({
			type: 'PUT',
			url: 'updateBoardFolder.do/'+boardSerial+'/'+folderSerial,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function() {
			alert('폴더 이동이 완료되었습니다');
			self.close();
		}).fail(function(error) {
			alert(JSON.stringify(error));
		}); 
	}
</script>
</html>