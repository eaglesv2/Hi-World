<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<table>
		<tr>
			<td>${boardVO.title} ${boardVO.cDate} 관리자</td>
		</tr>
		<tr> 
			<td><textarea rows="20" cols="80" readonly>${boardVO.content}</textarea></td>
		</tr>
		
	</table>
	
	<form name="reply">
		<input type="text" placeholder="댓글 작성하세요" name="replyContent" id="replyContent"/>
		<input type="hidden" name="boardSerial" value="${boardVO.boardSerial}" />
		<button type="button" onclick="replyInsert()">등록</button>
	</form>
	

	
	
		
	<table >
		<tr id="replyTable">
			<td>댓글</td>
		</tr>
		<c:choose>
			<c:when test="${list != '[]'}">
				<c:forEach var="kinds" items="${list}">
					<tr id="${kinds.replySerial}">
						<td>${kinds.replyContent}</td>
						<td>${kinds.userName}(${kinds.userID})</td>
						<td>${kinds.cDate}</td>
						<c:if test="${sessionVO.userSerial == kinds.userSerial || sessionVO.userSerial == 1}">
							<td><button onclick="deleteReply('${kinds.replySerial}')">삭제</button></td>
						</c:if>
					</tr>
				</c:forEach>
			</c:when>
		
			<c:otherwise>
				<tr id="none">
					<td>등록된 댓글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
		

	
</body>

<script>
	function replyInsert() {
		var userSerial = '${sessionVO.userSerial}';
		if(userSerial!=''){
			var reply = $("form[name=reply]").serialize();
			$.ajax({
				url : 'replyInsert.do',
				type : "GET",
				data : reply,
				dataType : "text",
				success : function(data) {
					$('#replyTable').after(data);			
					$('#none').remove();
					$('#replyContent').val('');
				}
			})
		}else{
			alert("로그인하세요");
		}
	}
	
	function deleteReply(replySerial) {
		$.ajax({
			url : "deleteReply.do",
			type : "GET",
			data : {"replySerial":replySerial},
			success : function(data) {
				$('#replySerial').remove();
			}
		})
	}
</script>

</html>