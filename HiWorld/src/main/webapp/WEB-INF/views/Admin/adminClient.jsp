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
	
<style>
#adclient{
    margin-left: 145px;
    margin-top: 20px;
    border-collapse: separate;
    border-spacing: 0 5px;
    }
    #adclient td{
    	width:190px;
    
    }

#serchclient{
	padding-top: 10px;
    margin-left: 240px;
}
#serchclient input{
	margin-top: 10px;
}
#serchclient h1{
	margin-left: 40px;
    font-size: xx-large;	
}
#Benclient{
	margin-left:320px;
	width: 120px;
	background: gray;
}
</style>
</head>
<body>
	<div id="serchclient">
		<h1>회원 전체보기</h1>
		회원 검색하기
		<input type="text" id="search" />
	</div>
	<table border="1" id="adclient">
		<tr>
			<td style="text-align: center;">유저번호</td>
			<td>유저이름(아이디)</td>
			<td>유저밴</td>
		</tr>
		<tbody id="tbody">
			<c:forEach var="kinds" items="${alist}">
				<!-- 벤안되었을때 -->
				<tr id="${kinds.userSerial}">
					<td style="width:150px;text-align: center;">${kinds.userSerial}</td>
					<td>${kinds.userName}(${kinds.userID})</td>
					<td><input type="button" value="Ban" onclick="UserBan(${kinds.userSerial})" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="Benclient">
		<a href="#" onclick="Manage_Ban()">밴한 회원 보기</a>
	</div>

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