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
	<a href="#" onclick="Article('쇼핑')">쇼핑</a>
	<a href="#" onclick="Article('캐릭터')">캐릭터</a>
	<a href="#" onclick="Article('배경')">배경</a>
	<a href="#" onclick="Article('음악')">음악</a>
	<a href="#" onclick="Article('마우스')">마우스</a>

	<div id="test"></div>
	
</body>

<script>

	
	
	/* 쇼핑페이지 이동 */
	function Article(list){
		$.ajax({
			url: "sangpoom.do",
			type: "GET",
			data: {"list":list},
			dataType: "html",
			success: function(data) {
				$("#test").html(data);
			}
		})
	}
	
</script>


</html>