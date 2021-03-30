<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <h1>이웃 찾기</h1><br />
    
	검색 <input type="text" placeholder="이름을 검색하세요."/> <br />
    
	<div id="container">
	
		<c:forEach var="kinds" items="${ArticleList}">
		
		</c:forEach>

		
		
	</div>    
    
</body>
</html>