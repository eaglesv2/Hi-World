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
			type: "GET",
			url: "covid19.do",
			dataType: "json",
			async:true,
            cache:false,
            success: function(data) {            	
            	// 코로나 완치 수
				console.log(data[0])
				
				// 코로나 확진자 수 전체
				console.log(data[1])
				
				// 오늘 코로나 확진자 수
				console.log(data[2])
				
				// 오늘 날짜
				console.log(data[3])
				
			}
		})
	})

</script>

<body>








</body>
</html>