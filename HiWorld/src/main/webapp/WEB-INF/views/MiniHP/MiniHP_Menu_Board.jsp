<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
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
	
	<div id="nowFolder" style="float: left; padding-left: 20px;">
		${currentFolderName}
	</div>
	<div id="write-btn" style="float: right; padding-right: 20px; cursor:pointer;" onclick="moveInsertPage();">
		글쓰기
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
					<td style="width: 30%; height: 5px;word-break:break-all; cursor:pointer;" onclick="moveDetailPage('${l.boardSerial}');">
						${l.title}
						<!-- 댓글 개수 출력 -->
						[${l.replyCnt}]
						<!-- 게시글 등록되고 3일동안 new 아이콘 표시 -->
						<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
						<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
						<fmt:parseNumber value="${l.cDate.time / (1000*60*60*24)}" integerOnly="true" var="chgDttm" /><!-- 게시글 작성날짜를 숫자로 -->
						<c:if test="${today - chgDttm le 3}"><!-- 3일동안은 new 표시 -->
							<i><img src="resources/images/new.png" width="12px" alt="new" /></i>
						</c:if>
						<!-- 파일 있을시 파일 아이콘 표시 -->
						<c:if test="${l.file!=null}">
							<img alt="file" src="resources/images/disk-file.png" width="10px">
						</c:if>
					</td>
					<td style="width: 30%; height: 5px;word-break:break-all;">${l.userName}</td>
					<td style="width: 30%; height: 5px;word-break:break-all;">${l.uDate}</td>
					<td style="width: 10%; height: 5px;word-break:break-all;">${l.hit}</td>
				</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	</div>
	<input id="currentFolderSerial" type="hidden" value="${currentFolderSerial}">
     <div>
        <c:if test="${pagination.curRange ne 1 }">
            <a href="#" onClick="fn_paging(1)">[처음]</a> 
        </c:if>
        <c:if test="${pagination.curPage ne 1}">
            <a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a> 
        </c:if>
        <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
            <c:choose>
                <c:when test="${pageNum eq  pagination.curPage}">
                    <span style="font-weight: bold;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
                </c:when>
                <c:otherwise>
                    <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
            <a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a> 
        </c:if>
        <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
            <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
        </c:if>
    </div>
    
    <%-- <div>
        총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
    </div> --%>
	
	<img src="${pageContext.request.contextPath}/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
</form>
<script>
//글쓰기 버튼 클릭시
function moveInsertPage(){
	var currentFolderSerial = $('#currentFolderSerial').val();
    var ajaxOption = {
            url : "MiniHpBoardInsert.do/"+currentFolderSerial,
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
//페이징
function fn_paging(curPage) {
	var folderSerial = $('#currentFolderSerial').val();
	var ajaxMain = {
	        url : 'miniHpBoard.do?folderSerial='+folderSerial+"&curPage="+curPage,
	        async : true,
	        type : "GET",
	        dataType : "html",
	        cache : false
	};
	
	$.ajax(ajaxMain).done(function(data){
	    // Contents 영역 삭제
	    $('#bodyContents').children().remove();
	    // Contents 영역 교체
	    $('#bodyContents').html(data);
	});
}
</script>