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
	#secretArea{
		float: left;
		margin-left: 10px;
		font-size: 12px;
	}
</style>
<input type="hidden" id="ownerSerial" value="${ownerSerial}">
<div id="main">
	<div id="writeFrame">
		<div id="writeForm">
			<div class="bookMiniMeFrame">
				<img class="bookMiniMe" alt="?????????" src="${writerMiniMe}">
			</div>
			<textarea class="ta" id="bookWriteContent"></textarea>
		</div>
		<span id="secretArea">
			<input type="checkbox" name="secretCheck">
			????????? ??????
		</span>
		<input id="bookInsertBtn" class="bookBtns" type="button" value="??????">
	</div>
	
	<c:forEach items="${list}" var="l">
	<c:if test="${l.isSecret==0 || l.writeUserSerial==sessionVO.userSerial}">
		<div class="books">
			<div class="booksTop" style='<c:if test="${l.isSecret==1}">background-color: #FAFABE;</c:if>'>
				<span class="booksTop-left">
					<span>${l.writeUserName}</span>
					<span class="date">(<fmt:formatDate value="${l.uDate}" pattern="yyyy-MM-dd HH:mm"/>)</span>
				</span>
				<c:if test="${l.writeUserSerial==sessionVO.userSerial}">
				<span class="booksTop-right">
					<c:if test="${l.isSecret==0}">
						<span class="btns" onclick="changeSecret('${l.bookSerial}',1)">????????? ??????</span>
					</c:if>
					<c:if test="${l.isSecret==1}">
						<span class="btns" onclick="changeSecret('${l.bookSerial}',0)">????????? ??????</span>
					</c:if>
					<span class="btns" onclick="updateBookForm('${l.bookSerial}');">??????</span><!-- ???????????? ???????????? -->
					<span class="btns" onclick="deleteBook('${l.bookSerial}')">??????</span><!-- ?????????+???????????? -->
				</span>
				</c:if>
			</div>
			<div class="booksMiddle">
				<span class="bookMiniMeFrame">
					<img class="bookMiniMe" alt="?????????" src="${l.miniMe}">
				</span>
				<span id="booksContent-${l.bookSerial}" class="booksContent">
					<c:if test="${l.isSecret==1}">
						<img alt="lock" src="resources/images/book-lock.png" width="10">
						<font style="color: #FFC31F; font-weight: bold;">????????????</font>
						<span style="color: #FFC31F; font-size: 12px;">(??? ?????? ???????????? ???????????? ??? ??? ?????????)</span>
						<br>
					</c:if>
					<span class="secondFont" style="height: 80px;display: flex;align-items: center;overflow: hidden;"><c:out value="${l.content}" /></span>
				</span>
				<span id="booksContentUpdate-${l.bookSerial}" style="display: none;">
					<textarea class="taUpdate" id="updateContent-${l.bookSerial}">${l.content}</textarea><br>
					<input class="bookBtns" type="button" value="??????" onclick="updateBookForm('${l.bookSerial}');"><br>
					<input class="bookBtns" type="button" value="??????" onclick="updateBook('${l.bookSerial}');">
				</span>
			</div>
		</div>
		<div class="booksReply">
			<!-- ?????? ?????????, ?????? ?????? ???????????? ?????? ?????? -->
			<c:if test="${l.writeUserSerial==sessionVO.userSerial}">
				<div class="insertReplyArea">
					<textarea class="insertReplyForm" id="replyContent-${l.bookSerial}"></textarea>
					<input class="bookBigBtns" type="button" value="??????" onclick="insertReply('${l.bookSerial}');">
				</div>
			</c:if>
			<!-- ?????? ???????????? ????????? -->
			<%-- <iframe class="replys" src="MiniHpBookReply.do?bookSerial=${l.bookSerial}" frameborder="1" marginheight="0" marginwidth="0" width="100%" height="50%"></iframe> --%>
			<script> $("#replySrc-"+'${l.bookSerial}').load("MiniHpBookReply.do?bookSerial=${l.bookSerial}");</script> 
			<div id="replySrc-${l.bookSerial}" class="replySrc"></div> 
		</div>
	</c:if>
	</c:forEach>
	
	<!-- ????????? -->
     <div>
        <c:if test="${pagination.curRange ne 1 }">
            <a href="#" onClick="fn_paging(1)">[??????]</a> 
        </c:if>
        <c:if test="${pagination.curPage ne 1}">
            <a href="#" onClick="fn_paging('${pagination.prevPage }')">[??????]</a> 
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
            <a href="#" onClick="fn_paging('${pagination.nextPage }')">[??????]</a> 
        </c:if>
        <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
            <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[???]</a> 
        </c:if>
    </div>
</div>
<script>
//?????? ????????? ??????
var ownerSerial = $('#ownerSerial').val();
$(function() {
	//insert
	$('#bookInsertBtn').click(function() {insertBook();});
	//??????, ?????? ?????? ?????????
	$('.btns').mouseover(function() {
		this.style.cursor='pointer';
		this.style.color='#FF5E00';
	}).mouseout(function() {
		this.style.color='black';
	});
});
function changeSecret(bookSerial,isSecret) {
	$.ajax({
		type: 'POST',
		url: 'miniHpBookSecret.do/'+bookSerial+'/'+isSecret,
		datatype: 'json',
		contentType:'application/json; charset=utf-8'
	}).done(function(data) {
		getBook(ownerSerial);
	}).fail(function(error) {
		alert(JSON.stringify(error));
	});
}
function insertBook() {
	var content = $('#bookWriteContent').val();
	if(content==="")
		alert('????????? ???????????????');
	else{
		//????????? ?????? ?????? ?????? ??????
		var isSecret = 0;
		if($("input:checkbox[name=secretCheck]").is(":checked") == true) {
			isSecret = 1;
		}
		$.ajax({
			type: 'POST',
			url: 'miniHpBookGuest.do/'+ownerSerial+'/'+content+'/'+isSecret,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function() {
			getBook(ownerSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
function deleteBook(serial) {
	if(confirm("?????? ?????????????????????????")){
		$.ajax({
			type: 'DELETE',
			url: 'miniHpBook.do/'+serial,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function(data) {
			getBook(ownerSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
//update???
function updateBookForm(serial) {
	$('#booksContent-'+serial).toggle();
	$('#booksContentUpdate-'+serial).toggle();
}
function updateBook(serial) {
	var content = $('#updateContent-'+serial).val();
	if(content==="")
		alert('????????? ???????????????');
	else{
		console.log(content);
		$.ajax({
			type: 'PUT',
			url: 'miniHpBook.do/'+serial+'/'+content,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function() {
			getBook(ownerSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
//?????????
function fn_paging(curPage) {
	var ajaxMain = {
	        url : 'miniHpBookGuest.do?curPage=' + curPage+'&ownerSerial='+ownerSerial,
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
//??????
function insertReply(bookSerial) {
	var replyContent = $('#replyContent-'+bookSerial).val();
	if(replyContent==="")
		alert('????????? ???????????????');
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
	if(confirm("?????? ?????????????????????????")){
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
//update ??? ?????????
function updateReplyForm(serial) {
	$('#reply-'+serial).toggle();
	$('#replyForm-'+serial).toggle();
}
function updateReply(bookSerial,serial) {
	var content = $('#updateReplyContent-'+serial).val();
	if(content==="")
		alert('????????? ???????????????');
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