<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/questionBoard.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<div id="body">

	<div id="board_con">
		<div id="boardheader">문의사항 등록하기</div>
		<form name="BoardSubmit">
			<input type="text" name="title" placeholder="제목을 입력하세요."/>	<br /> 
			<textarea rows="10" cols="30" name="content" placeholder="문의사항 내용을 입력하세요."></textarea> <br />
		</form>
		<button onclick="submit()">등록하기</button>
	</div>
	
</div>
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
                            url : "questionPage.do",
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