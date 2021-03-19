<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#top{
		text-align: right;
	}
	#main{
		height: 350px;
		width: 450px;
		overflow-y: scroll;
		-ms-overflow-style: none;
	}
	#main::-webkit-scrollbar{
		display: none;
	}
</style>
<form name="poto">

	<div id="top">
		<input type="button" value="글쓰기" onclick="moveInsertPage();">&nbsp;&nbsp;&nbsp;
	</div>
	<img src="${pageContext.request.contextPath}/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
	
	<!-- 게시판 -->
	<div id="main">
	<c:choose>
		<c:when test="${list==null}">
			<h3>등록된 글이 없습니다</h3>
		</c:when>
		<c:otherwise>
			<table>
				<tr>
					<th style="width: 30%;">제목</th>
					<th style="width: 30%">작성자</th>
					<th style="width: 30%">작성일</th>
					<th style="width: 10%">조회</th>
				</tr>
				<c:forEach items="${list}" var="l">
				<tr>
					<td style="width: 30%; height: 5px;word-break:break-all;" onclick="moveDetailPage(${l.boardSerial});">${l.title}</td>
					<td style="width: 30%; height: 5px;word-break:break-all;">${l.userName}</td>
					<td style="width: 30%; height: 5px;word-break:break-all;">${l.uDate}</td>
					<td style="width: 10%; height: 5px;word-break:break-all;">${l.hit}</td>
				</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	</div>
	
	<img src="${pageContext.request.contextPath}/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
</form>
<script>
//글쓰기 버튼 클릭시
function moveInsertPage(){
    var ajaxOption = {
            url : "MiniHpBoardInsert.do",
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxOption).done(function(data){
        $('#bodyContents').children().remove();
        $('#bodyContents').html(data);
    });
}
//게시물 제목 클릭시 상세 페이지로 넘어감
function moveDetailPage(boardSerial){
	console.log(boardSerial);
    var ajaxOption = {
            url : "MiniHpBoardDetail.do?serial="+boardSerial,
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxOption).done(function(data){
        $('#bodyContents').children().remove();
        $('#bodyContents').html(data);
    });
}
</script>