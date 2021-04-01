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
	#serchclient{
		padding-top: 10px;
    	margin-left: 240px;
	}
	#serchclient h1{
		margin-left: 100px;
   		font-size: xx-large;	
	}
	#serchclient input{
	margin-top: 10px;
	}
	#bantable{
		margin-left: 145px;
	    margin-top: 20px;
	    border-collapse: separate;
	    border-spacing: 0 5px;
	}
	#bantable td{
		
		width:190px;
	}
	#clientlist{
		margin-left:320px;
		width: 120px;
		background: gray;
	}
</style>	
</head>
<body>
	<div id="serchclient">
		<h1>banList</h1>
		회원 검색하기
		<input type="text" id="search" />
	</div>
	<table border="1" id="bantable">
		<tr>
			<td style="text-align: center;">유저번호</td>
			<td>유저이름(아이디)</td>
			<td>밴풀기</td>
		</tr>
		<tbody id="tbody">
			<c:forEach var="kinds" items="${alist}">
				<tr id="${kinds.userSerial}">
					<td style="width:150px;text-align: center;">${kinds.userSerial}</td>
					<td>${kinds.userName}(${kinds.userID})</td>
					<td><input type="button" id=" " value="unBan" onclick="UserUnBan(${kinds.userSerial})" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="clientlist">
		<a href="#" onclick="Manage_Client()">회원 목록 보기</a>
	</div>
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
	
	function Manage_Client(){
		$.ajax({
			url: "Manage_Client.do",
			type: "GET",
			data: {"check":"all"},
			dataType: "html",
			success: function(data) {
				$("#bodyContext").html(data);
			}
		})
	}	
</script>

</html>