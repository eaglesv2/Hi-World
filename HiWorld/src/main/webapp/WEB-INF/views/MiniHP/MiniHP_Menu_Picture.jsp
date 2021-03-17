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

	<!-- 상단 사진올리기 버튼 -->
	<div id="pictureTop">
		<input type="button" value="사진올리기"> &nbsp;&nbsp;&nbsp;
	</div>
	<img src="${pageContext.request.contextPath}/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
	
	<!-- 사진첩 -->
	<div id="pictureMain">
	<c:choose>
		<c:when test="${list==null}">
			<h3>등록된 사진이 없습니다</h3>
		</c:when>
		<c:otherwise>
			사진첩
		</c:otherwise>
	</c:choose>
	</div>
	
	<img src="${pageContext.request.contextPath}/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
</form>
<script>
	
</script>