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

	<h1>회원 전체 보기</h1>
	회원 검색하기
	<input type="text" id="search" />
	<table border="1">
		<tr>
			<td>유저고유번호</td>
			<td>유저이름(아이디)</td>
			<td>유저밴</td>
		</tr>
		<tbody id="tbody">
			<c:forEach var="kinds" items="${alist}">
				<!-- 벤안되었을때 -->
				<tr id="${kinds.userSerial}">
					<td>${kinds.userSerial}</td>
					<td>${kinds.userName}(${kinds.userID})</td>
					<td><input type="button" value="Ban" onclick="UserBan(${kinds.userSerial})" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<a href="#" onclick="Manage_Ban()">밴한 회원 보기</a>

</body>

<script>
	function Manage_Ban() {
		$.ajax({
			url: "Manage_Client.do",
			type: "GET",
			data: {"check":"ban"},
			dataType: "html",
			success: function(data) {
				$("#bodyContext").html(data);
			}
		})
	}
	
	$("#search").keyup(function() {
		var key = $(this).val();
		
		/* 일단 검색시 목록 전체안보이게 */
		$("#tbody>tr").hide();
		
		var writer = $("#tbody>tr>td:nth-child(2):contains('"+key+"')");
		
		$(writer).parent().show();
		
	})
	
	function UserBan(userSerial) {
		$.ajax({
			url: "userBan.do",
			type: "GET",
			data: {
				"UserSerial":userSerial,
				"BanCheck":"ban"
				},
			success: function() {
				$("#"+userSerial).remove();
			}
		})
		
	}
</script>
</html>