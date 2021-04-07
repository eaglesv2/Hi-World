<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
	$().ready(function() {
		$.ajax({
			url : "allClientCount.do",
			type : "GET",
			success : function(data) {
				console.log(data);
				let text = 'Hi-World에 오신것을 환영합니다';
				let text2 = '총 가입자수 : '+data;
			}
		})
	})
</script>

<body>






</body>
</html>