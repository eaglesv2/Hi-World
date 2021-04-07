<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
	
	$().ready(function() {
		$.ajax({
			url : "weather.do",
			type : "GET",
			dataType : "json",
			async : true,
			cache : false,
			success : function(data) {
				// 서울
				// 비올확률 %
				console.log(data[0])
				// 현재 온도
				console.log(data[1])
				
				// 부산
				// 비올확률 %
				console.log(data[2])
				// 현재 온도
				console.log(data[3])
				
				// 대구
				// 비올확률 %
				console.log(data[4])
				// 현재 온도
				console.log(data[5])
				
				// 인천
				// 비올확률 %
				console.log(data[6])
				// 현재 온도
				console.log(data[7])
				
				// 광주
				// 비올확률 %
				console.log(data[8])
				// 현재 온도
				console.log(data[9])
				
				// 대전
				// 비올확률 %
				console.log(data[10])
				// 현재 온도
				console.log(data[11])
				
				// 울산
				// 비올확률 %
				console.log(data[12])
				// 현재 온도
				console.log(data[13])
				
				// 수원
				// 비올확률 %
				console.log(data[14])
				// 현재 온도
				console.log(data[15])
			}
		})
		
	})

</script>
</head>

<body>

</body>
</html>



	
