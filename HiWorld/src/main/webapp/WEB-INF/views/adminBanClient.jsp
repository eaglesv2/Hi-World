<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<h1>벤한 회원 전체 보기</h1>
	회원 검색하기
	<input type="text" id="search" />
	<table border="1">
		<tr>
			<td>유저번호</td>
			<td>유저이름</td>
			<td>유저아이디</td>
			<td>밴풀기</td>
		</tr>
		<tbody id="tbody">
			<c:forEach var="kinds" items="${alist}">
				<tr id="${kinds.userSerial}">
					<td>${kinds.userSerial}</td>
					<td>${kinds.userName}</td>
					<td>${kinds.userID}</td>
					<td><input type="button" value="unBan"
						onclick="UserUnBan(${kinds.userSerial})" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>

<script>
	$("#search").keyup(function() {
		var key = $(this).val();
	
		/* 일단 검색시 목록 전체안보이게 */
		$("#tbody>tr").hide();
	
		var writer = $("#tbody>tr>td:nth-child(2):contains('"+key+"')");
	
		$(writer).parent().show();
	
	})
	
	function UserUnBan(userSerial) {
		$.ajax({
			url: "userBan.do",
			type: "GET",
			data: {
				"UserSerial":userSerial,
				"BanCheck":"unBan"
				},
			success: function() {
				$("#"+userSerial).remove();
			}
		})
	}
</script>

</html>