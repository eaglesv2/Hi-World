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
		
	<h1>장바구니 목록</h1>
	<table>
		<c:forEach var="kinds" items="${ArticleList}">
			<tr class="${kinds.articleSerial}">
				<td><img src="${kinds.articleImg}"/></td>
				<td>${kinds.articleKinds}</td>
				<td>${kinds.articleName}</td>
				<td>${kinds.articlePrice}</td>
				<c:set var="total" value='${kinds.articlePrice+total}'/>
				<td onclick="deleteArticle('${kinds.articleSerial}')">취소</td>
			</tr>
		</c:forEach>
	</table>
	
	
	총금액 : ${total}원 입니다 
	<a href="" onclick="totalBay(${total})">결제하기</a>
</body>

<script>
	function deleteArticle(articleSerial) {
		var tr = document.getElementsByClassName(articleSerial);
		$.ajax({
			type: "GET",
			url: "delArticle.do",
			data: {
				"ArticleSerial":articleSerial
			},
			success: function(data) {
				$(tr).remove();	
			}
		})
		
	}
	
	function totalBay(total) {
		$.ajax({
			type: "GET",
			url: "totalBay.do",
			data:{
				"total":total
			},
			success: function (data) {
				if(data===1){
					/* 결제 성공 */
					
				}else{
					/* 밤톨부족 결제 실패 */
					
				}
			}
		})
	}
	
</script>

</html>