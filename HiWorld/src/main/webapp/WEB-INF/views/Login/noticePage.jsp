<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="noticePage.css">
</head>
<body>

	<div id="main">
	<c:choose>
		<c:when test="${list==null}">
			<h3>등록된 글이 없습니다</h3>
		</c:when>
		<c:otherwise>
			<table>
				<tr>
					<th style="width: 30%;">제목</th>
					<th style="width: 30%">작성자</th>
					<th style="width: 30%">작성일</th>
					<th style="width: 10%">조회</th>
				</tr>
				<c:forEach items="${list}" var="l">
				<tr>
					<td style="width: 30%; height: 5px;word-break:break-all;">${l.title}</td>
					<td style="width: 30%; height: 5px;word-break:break-all;">${l.userName}</td>
					<td style="width: 30%; height: 5px;word-break:break-all;">${l.cDate}</td>
					<td style="width: 10%; height: 5px;word-break:break-all;">${l.hit}</td>
				</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	</div>

</body>
</html>