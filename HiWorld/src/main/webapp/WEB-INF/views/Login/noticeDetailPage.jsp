<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	세부내용!!
	<table>
		<tr>
			<td>제목</td>
			<td>${boardVO.title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>작성일시</td>
		</tr>
		<tr>
			<td>${boardVO.content}</td>
			<td>${boardVO.cDate}</td>
		</tr>
		
	</table>
	
	<c:choose>
	<c:when test="${list != '[]'}">
		<table>
			<tr>
				<td>댓글</td>
			</tr>
			<c:forEach var="kinds" items="${list}">
				<tr>
					<td>${kinds.replyContent}</td>
					<td>${kinds.userName}(${kinds.userID})</td>
					<td>${kinds.cDate}</td>
				</tr>

			</c:forEach>
		</table>
	</c:when>
	
	<c:otherwise>
		등록된 댓글이 없습니다.
	</c:otherwise>
	
	</c:choose>
	
</body>
</html>