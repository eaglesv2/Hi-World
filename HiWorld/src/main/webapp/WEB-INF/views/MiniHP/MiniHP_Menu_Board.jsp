<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="board" method="post" action="">
 	<c:if test="${menuLength eq 0 }">
 	<table border="0" width="420" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td align="right">
				<br/>
			</td>
		</tr>
	</table>

	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>

	<!-- 사진 ----------------------------------------------------------------------------------------------- -->
	
	
	<table border="0" width="420" height="300" cellpadding="1" cellspacing="1" align="center">
		<tr valign="middle">
			<td align="center">
				<font  style="font-size:10pt;font-weight: bold;">
					폴더 생성한 후 선택해주세요.
				</font>
			</td>
		</tr>
	</table>
 	</c:if>

	<c:if test="${menuLength ne 0 }">
	<table border="0" width="420" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td align="left">
				${folderName }
			</td>
			<td align="right">
				<img alt="글쓰기" src="${pageContext.request.contextPath}/resources/images/writeBtn.png" onclick="javascript:location.href='my_board_write.action?folderName=${folderName }&pageNum=${pageNum }';">				
			</td>
		</tr>
	</table>

	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>

	<!-- 사진 ----------------------------------------------------------------------------------------------- -->
	<table width = "100%" >	
		<tr style="font-size: 10pt; text-align: center;">
			<td width="10%"></td>
			<td width="40%"><b>제목</b></td>
			<td width="20%"><b>작성자</b></td>
			<td width="20%"><b>작성일</b></td>
			<td width="10%"><b>조회</b></td>
		</tr>
	</table>
	<hr width="93%" style="border: solid 1px #e6e6e6;"/>
	<c:if test="${totalData==0 }">
	<table border="0" width="420" height="300" cellpadding="1" cellspacing="1" align="center">
		<tr valign="middle">
			<td align="center">
				<font  style="font-size:10pt;font-weight: bold;">
					등록된 글이 없습니다.
				</font>
			</td>
		</tr>
	</table>
	</c:if>
	<table width = "100%" >	
	<c:forEach var="dto" items="${list }" varStatus="status">
		<tr style="font-size: 8pt; text-align: center;">
			<td width="10%">${dto.listNum }</td>
			<td width="40%" style="text-align: left"><a href="javascript:void(0);" onclick="sendBoard('${dto.num }')">${dto.subject }</a></td>
			<td width="20%"><font color="#47678d">${dto.userName }</font></td>
			<td width="20%">${dto.created }</td>
			<td width="10%">${dto.hitCount }</td>
		</tr>		
	</c:forEach>
	</table>
	<table border="0" width="420" cellpadding="1" cellspacing="1" align="center">
		<tr>
			<td align="center">
				<a name="n5"></a>
				<font><b>${pageIndexList }</b></font>
			</td>
		</tr>
	</table>
	</c:if>

	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>
	<br/><br/><br/>
</form>
</body>
</html>