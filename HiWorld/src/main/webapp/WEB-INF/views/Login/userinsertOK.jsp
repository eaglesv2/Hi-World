<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 완료 메세지 jsp</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/파비콘.png" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/파비콘.png" type="image/x-icon">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
div{
text-align: center;
}
#img_hade{
width: 280px;
margin-top: 8%;
}
h1{
font-size: 40px;
color: rgb(243,105,4);
margin-bottom: 0px;
}
#span{
color: #7f5858;
}
h3{
margin-top: 0px;
color: #8e8e8c;
}
</style>
</head>
<body onbeforeunload="main()">
	<div id="main">
		<div>
			<div>
				<div>
					<img id="img_hade" alt="로고사진" src="resources/images/로고7.png">
					<h1>Hi- Worder <span id="span">회원가입이 완료</span>되었습니다.</h1>
					<h3>회원님은 Hi - Worder의 기능을 사용하실수 있습니다 회원접속 후 이용 가능합니다.</h3>
					<div>
						<button onclick="login.do">메인페이지로 이동</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>