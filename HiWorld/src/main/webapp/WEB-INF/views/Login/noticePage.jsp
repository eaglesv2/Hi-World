<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Document</title>
<link rel="stylesheet" href="noticePage.css">
</head>
<body>

	<div id="Context">
		<c:choose>
			<c:when test="${list != '[]'}">
				<table>
					<tr>
						<td>NO.</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>
					<c:forEach var="kinds" items="${list}">
						<tr id="${kinds.boardSerial}">
							<td>${kinds.boardSerial}</td>
							<td><a href="#" onclick="boardView('${kinds.boardSerial}')">${kinds.title}</a></td>
							<td>관리자</td>
							<td>${kinds.cDate}</td>
							<td>${kinds.lookUp}</td>
							<c:if test="${sessionVO.userID eq 'ADMIN'}">
								<td><button onclick="deleteBoard('${kinds.boardSerial}')">삭제</button></td>
							</c:if>
						</tr>

					</c:forEach>
				</table>
			</c:when>

	<c:otherwise>
		등록된 공지사항이 없습니다
	</c:otherwise>

		</c:choose>
	</div>
</body>

<script>
	function boardView(boardSerial) {
		$.ajax({
			url : "boardView.do",
			type : "GET",
			data : {"boardSerial" : boardSerial},
			success : function(data) {
				$('#Context').html(data);
			}
		})
	}
	
	function deleteBoard(boardSerial) {
		$.ajax({
			url : "deleteBoard.do",
			type : "GET",
			data : {"boardSerial" : boardSerial},
			success : function(data) {
				$("#"+boardSerial).remove();
			}
		})
	}
</script>

</html>