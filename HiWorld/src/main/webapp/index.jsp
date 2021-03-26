<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	
	
	<a href="login.do">메인페이지가기</a>
	<a href="#" onclick="Manage_Client()">어드민 회원관리</a>
	<a href="#" onclick="Manage_Article()">어드민 상품등록</a>

	<div id="test"></div>
	
</body>

<script>
	function Manage_Client(){
		$.ajax({
			url: "Manage_Client.do",
			type: "GET",
			data: {"check":"all"},
			dataType: "html",
			success: function(data) {
				$("#test").html(data);
			}
		})
	}	
	
	function Manage_Article() {
		$.ajax({
			url: "Manage_Article.do",
			type: "GET",
			dataType: "html",
			success: function(data) {
				$("#test").html(data);
			}
		})
	}
</script>


</html>