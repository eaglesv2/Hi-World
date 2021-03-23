<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
	Border
	<hr>
	<ul>
		<c:forEach var="i" items="${folderList}">
			<li><font size="2pt"> 
				<span id="folder-${i.serial}">
					<a href="#" onclick="">
						${i.folderName}
					</a>
					<img src="resources/images/folder_edit.png" width="10px" class="" height="10px" onclick="updateForm();">
					<img src="resources/images/folder_deleted.png" width="10px" height="10px" onclick="deletedFolder('${i.serial}');">
				</span>
			</font></li>
			<div id="updateFolder" style="display: none;">
				<input type="text" id="updateFolderName" style="width: 100px;" value="${i.folderName}" /><br />
				<font size="1pt"> 
					<input type="radio" name="updateScope" value="2" checked="checked">전체공개<br /> 
					<input type="radio" name="updateScope" value="1">일촌공개<br /> 
					<input type="radio" name="updateScope" value="0">비공개<br />
				</font>
				<input type="button" value="수정" onclick="updateFolder('${i.serial}');" />
				<input type="button" value="취소" onclick="cancelFolder();" />
			</div>
		</c:forEach>
	</ul>
	<img src="resources/images/folder_add.png" width="10px" height="10px" align="left" onclick="addFolder();">
	<div id="addFolder" style="display: none;">
		<input type="text" id="folderName" style="width: 100px;" /><br />
		<font size="1pt"> 
			<input type="radio" name="scope" value="2" checked="checked">전체공개<br /> 
			<input type="radio" name="scope" value="1">일촌공개<br /> 
			<input type="radio" name="scope" value="0">비공개<br />
		</font>
		<input type="button" value="추가" onclick="insertFolder();" />
		<input type="button" value="취소" onclick="cancelFolder();" />
	</div>
</body>
<script>
	//사이드 불러오기
	function getBoardSide() {
		var ajaxSide = {
	            url : "MiniHpBoardSide.do",
	            async : true,
	            type : "GET",
	            dataType : "html",
	            cache : false
	    };
	    $.ajax(ajaxSide).done(function(data){
	        // Contents 영역 삭제
	        $('#sideContents').children().remove();
	        // Contents 영역 교체
	        $('#sideContents').html(data);
	    });
	}
	//"+" 버튼 클릭시 폴더 제목 작성란, 공개 범위 설정창 열림
	function addFolder() {
		if($('#addFolder').css("display")==="none")
			$('#addFolder').css("display","");
		else
			$('#addFolder').css("display","none");
	}
	//폴더 추가 취소
	function cancelFolder() {
		getBoardSide();
	}
	
	//폴더 추가
	function insertFolder() {
		var scope = $(":input:radio[name=scope]:checked").val();
		
		var data = {
			folderName : $('#folderName').val(),
			scope : scope
		}
		console.log(JSON.stringify(data));
		$.ajax({
			type: 'POST',
			url: 'MiniHpBoardSide.do',
			datatype: 'json',
			contentType:'application/json; charset=utf-8',
			data: JSON.stringify(data)
		}).done(function() {
			//사이드 불러오기
			getBoardSide();
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
	//폴더 삭제
	function deletedFolder(serial) {
		$.ajax({
			type: 'DELETE',
			url: 'MiniHpBoardSide.do/'+serial,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function(data) {
			alert(data);
			//사이드 불러오기
			getBoardSide();
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
	
	//폴더 수정하기
	function updateFolder(serial) {
		
		var folderName = $('#updateFolderName').val();
		var scope = $(":input:radio[name=updateScope]:checked").val();
		$.ajax({
			type: 'PUT',
			url: 'MiniHpBoardSide.do/'+serial+'/'+folderName+'/'+scope,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function() {
			//alert('폴더가 수정되었습니다.');
			//사이드 불러오기
			getBoardSide();
		}).fail(function(error) {
			alert(JSON.stringify(error));
		}); 
	}
	
	//폴더명 수정화면 펼치기
	function updateForm() {
		$('#updateFolder').toggle();
	}
</script>