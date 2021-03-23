<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	장바구니목록 보기
	<h1>물품 최신순으로 나열</h1>
	<table>
		<c:forEach var="kinds" items="${ArticleList}">
			<tr>
				<td><img src="${kinds.articleImg}"/></td>
				<td>${kinds.articleKinds}</td>
				<td>${kinds.articleName}</td>
				<td>${kinds.articlePrice}</td>
				<td><a href="#">구매하기</a></td>
				<td><a href="#" onclick="basket('${kinds.articleName}')">장바구니담기</a></td>
			</tr>
		</c:forEach>
	</table>





</body>
<script>
	function basket(kinds) {
			var UserSerial = '${sessionVO.userSerial}';
			$.ajax({
				typr: "GET",
				url: "basket.do",
				data: {
					"UserSerial" : UserSerial,
					"ArticleName" : kinds
				},
				success : function (data) {
					if(data==1){
						alert("성공")
					}else{
						alert("실패")
					}
				}
			})
	}
	
</script>

</html>