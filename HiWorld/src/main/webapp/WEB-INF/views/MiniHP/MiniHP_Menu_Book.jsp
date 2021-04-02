<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	#main{
		height: 400px;
		width: 450px;
		overflow-x: hidden;
		
		/* border-bottom: 2px solid blue;
		border-top: 2px solid blue; */
	}
	
	#writeFrame{
		height: 150px;
		border-bottom: 1px solid gray;
		border-top: 1px solid gray;
		background-color: #FAFAFA;
		
	}
	#writeForm{
		margin-top: 10px;
		margin-bottom: 10px;
		margin-left: 10px;
		margin-right: 10px;
		height: 100px;
		
		/* border-bottom: 2px solid pink;
		border-top: 2px solid pink; */
	}
	.bookBtns{
		float: right;
		margin-right: 10px;
		background-color: white;
		border: 1px solid gray;
		border-radius: 5px;
	}
	.bookMiniMeFrame{
		height: 100%;
		width: 25%;
		float: left;
		background-color: white;
	}
	.bookMiniMe{
		height: 100%;
	}
	.ta{
		resize: none;
		height: 100%;
		width: 70%;
		float: right;
	}
	.books{
		margin-top: 30px;
		height: 120px;
		border-top: 1px solid gray;
		
		/* border-bottom: 2px solid pink; */
	}
	.booksTop{
		background-color: #F2F2F2;
		height: 20%;
	}
	.booksTop-left{
		float: left;
	}
	.booksTop-right{
		float: right;
	}
	.booksMiddle{
		height: 80%;
	}
	.booksContent{
		float: left;
		width: 70%;
		height: auto;
		text-align: left;
		overflow: hidden;
	}
	.booksReply{
		/* height: auto; */
		/* border-top: 1px solid red;
		border-bottom: 1px solid red; */
	}
	.replys{
		/* width: 100%;
		background-color: #F2F2F2; */
		/* height: 10px; */
	}
	.btns{
		font-size:10pt;
	}
	.date{
		font-size:10pt;
		color: gray;
	}
	.taUpdate{
		resize: none;
		height: 70%;
		width: 70%;
		float: right;
	}
	.insertReplyArea{
		height: 50px;
		background-color: #F2F2F2;
	}
	.insertReplyForm{
		margin-top: 5px;
		margin-left: 5px;
		margin-right: 5px;
		width: 360px;
		resize: none;
		float: left;
	}
	.bookBigBtns{
		float: right;
		margin-right: 10px;
		margin-top: 5px;
		height: 35px;
		background-color: white;
		border: 1px solid gray;
		border-radius: 5px;
	}
	.replySrc{
		width: 100%;
		background-color: #F2F2F2;
		text-align: left;
	}
</style>
<div id="main">
	<div id="writeFrame">
		<div id="writeForm">
			<div class="bookMiniMeFrame">
				<!-- 작성자 미니미 사진은 컨트롤러에서 sessionVO 사용해서 select해서 가져와야됨 -->
				<img class="bookMiniMe" alt="미니미" src="resources/images/article/남성1.png">
			</div>
			<textarea class="ta" id="bookWriteContent"></textarea>
		</div>
		<input id="bookInsertBtn" class="bookBtns" type="button" value="확인">
	</div>
	
	<c:forEach items="${list}" var="l">
	<div class="books">
		<div class="booksTop">
			<span class="booksTop-left">
				<span>${l.writeUserName}</span>
				<span class="date">(<fmt:formatDate value="${l.uDate}" pattern="yyyy-MM-dd HH:mm"/>)</span>
			</span>
			<span class="booksTop-right">
				<span class="btns" onclick="updateBookForm('${l.bookSerial}');">수정</span><!-- 글쓴이만 가능하게 -->
				<span class="btns" onclick="deleteBook('${l.bookSerial}')">삭제</span><!-- 글쓴이+홈피주인 -->
			</span>
		</div>
		<div class="booksMiddle">
			<span class="bookMiniMeFrame">
				<img class="bookMiniMe" alt="미니미" src="${l.miniMe}">
			</span>
			<span id="booksContent-${l.bookSerial}" class="booksContent">
				${l.content}
			</span>
			<span id="booksContentUpdate-${l.bookSerial}" style="display: none;">
				<textarea class="taUpdate" id="updateContent-${l.bookSerial}">${l.content}</textarea><br>
				<input class="bookBtns" type="button" value="취소" onclick="updateBookForm('${l.bookSerial}');"><br>
				<input class="bookBtns" type="button" value="수정" onclick="updateBook('${l.bookSerial}');">
			</span>
		</div>
	</div>
	<div class="booksReply">
		<div class="insertReplyArea"><!-- 댓글 작성란, 주인만 보이게 -->
			<textarea class="insertReplyForm" id="replyContent-${l.bookSerial}"></textarea>
			<input class="bookBigBtns" type="button" value="확인" onclick="insertReply('${l.bookSerial}');">
		</div>
		<!-- 댓글 있을경우 가져옴 -->
		<c:if test="${l.replyCnt!=0}">
			<%-- <iframe class="replys" src="MiniHpBookReply.do?bookSerial=${l.bookSerial}" frameborder="1" marginheight="0" marginwidth="0" width="100%" height="50%"></iframe> --%>
			<script> $("#replySrc-"+'${l.bookSerial}').load("MiniHpBookReply.do?bookSerial=${l.bookSerial}");</script> 
			<div id="replySrc-${l.bookSerial}" class="replySrc"></div> 
		</c:if>
	</div>
	</c:forEach>
	
	<!-- 페이징 -->
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
</div>
<script>
$(function() {
	//insert
	$('#bookInsertBtn').click(function() {insertBook();});
	//수정, 삭제 버튼 이벤트
	$('.btns').mouseover(function() {
		this.style.cursor='pointer';
		this.style.color='#FF5E00';
	}).mouseout(function() {
		this.style.color='black';
	});
});

function insertBook() {
	var content = $('#bookWriteContent').val();
	if(content==="")
		alert('내용을 입력하세요');
	else{
		var data = {
			content : content
		}
		console.log(JSON.stringify(data));
		$.ajax({
			type: 'POST',
			url: 'miniHpBook.do',
			datatype: 'json',
			contentType:'application/json; charset=utf-8',
			data: JSON.stringify(data)
		}).done(function() {
			getBook();
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
function deleteBook(serial) {
	if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type: 'DELETE',
			url: 'miniHpBook.do/'+serial,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function(data) {
			getBook();
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
//update창
function updateBookForm(serial) {
	$('#booksContent-'+serial).toggle();
	$('#booksContentUpdate-'+serial).toggle();
}
function updateBook(serial) {
	var content = $('#updateContent-'+serial).val();
	if(content==="")
		alert('내용을 입력하세요');
	else{
		console.log(content);
		$.ajax({
			type: 'PUT',
			url: 'miniHpBook.do/'+serial+'/'+content,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function() {
			getBook();
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
//페이징
function fn_paging(curPage) {
	var ajaxMain = {
	        url : 'miniHpBook.do?curPage=' + curPage,
	        async : true,
	        type : "GET",
	        dataType : "html",
	        cache : false
	};
	
	$.ajax(ajaxMain).done(function(data){
	    $('#bodyContents').children().remove();
	    $('#bodyContents').html(data);
	});
}
//댓글
function insertReply(bookSerial) {
	var replyContent = $('#replyContent-'+bookSerial).val();
	if(replyContent==="")
		alert('내용을 입력하세요');
	else{
		var data = {
			replyContent : replyContent,
			bookSerial : bookSerial
		}
		console.log(JSON.stringify(data));
		$.ajax({
			type: 'POST',
			url: 'MiniHpBookReply.do',
			datatype: 'json',
			contentType:'application/json; charset=utf-8',
			data: JSON.stringify(data)
		}).done(function() {
			$("#replySrc-"+bookSerial).load("MiniHpBookReply.do?bookSerial="+bookSerial);
			$('#replyContent-'+bookSerial).val("");
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
function deleteReply(bookSerial,serial) {
	if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type: 'DELETE',
			url: 'MiniHpBookReply.do/'+serial,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function(data) {
			$("#replySrc-"+bookSerial).load("MiniHpBookReply.do?bookSerial="+bookSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
//update 칸 만들기
function updateReplyForm(serial) {
	$('#reply-'+serial).toggle();
	$('#replyForm-'+serial).toggle();
}
function updateReply(bookSerial,serial) {
	var content = $('#updateReplyContent-'+serial).val();
	if(content==="")
		alert('내용을 입력하세요');
	else{
		console.log(content);
		$.ajax({
			type: 'PUT',
			url: 'MiniHpBookReply.do/'+serial+'/'+content,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function() {
			$("#replySrc-"+bookSerial).load("MiniHpBookReply.do?bookSerial="+bookSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
</script>