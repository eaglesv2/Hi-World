<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>장바구니 목록</h1>
	<table>
		<c:forEach var="kinds" items="${ArticleList}">
			<tr>
				<td><img src="${kinds.articleImg}"/></td>
				<td>${kinds.articleKinds}</td>
				<td>${kinds.articleName}</td>
				<td>${kinds.articlePrice}</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>