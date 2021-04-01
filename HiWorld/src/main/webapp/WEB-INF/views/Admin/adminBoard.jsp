<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body id="#bodyContext">

	<h1>공지사항 등록하기</h1>
	<form name="BoardSubmit">
		공지사항 제목 <input type="text" name="title"/>	<br /> 
		<textarea rows="10" cols="30" name="content" placeholder="공지사항 내용을 입력하세요."></textarea> <br />
	</form>
	<button onclick="submit()">등록하기</button>
</body>

	<script>
		function submit() {
			
			var BoardSubmit = $("form[name=BoardSubmit]").serialize();
			
			$.ajax({
				url : "BoardSubmit.do",
				type : "GET",
				data : BoardSubmit,
				success : function(data) {
					alert("등록되었습니다.");
					var ajaxOption3={
                   		 type: "GET",
                            url : "noticePage.do",
                            dataType : "html", 
                            async:true,
                            cache:false
                    	}
               	 	$.ajax(ajaxOption3).done(function(data){
               		  //Contents 영역 교체
               		  	$('#bodyContext').html(data);
               	 	 })
				}
			})
			
		}
	</script>

</html>