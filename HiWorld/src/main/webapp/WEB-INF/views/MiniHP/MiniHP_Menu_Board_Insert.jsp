<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#menuBoardInsert {
  border-collapse: collapse;
  line-height: 1.5;
  border-left: 1px solid #ccc;
  margin: 20px 10px;
  height: 400px;
}

#menuBoardInsert thead th {
  padding: 10px;
  font-weight: bold;
  border-top: 1px solid #ccc;
  border-right: 1px solid #ccc;
  background: #dcdcd1;
}
#menuBoardInsert tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  background: #ececec;
}
#menuBoardInsert td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
#content{
	resize: none;
	width: 430px;
	height: 150px;
}
</style>
<body>
	<form id="insertForm" name="insertForm" enctype="multipart/form-data">
		<table id="menuBoardInsert">
			<thead height="5">
				<tr>
					<th scope="cols" colspan="2">게시물 업로드</th>
				</tr>
			</thead>
			<tbody>
				<tr height="5">
					<th scope="row">제목</th>
					<td><input type="text" name="title" id="title"></td>
				</tr>
				<tr>
					<td colspan="2">
					내용<br>
						<textarea name="content" id="content"></textarea>
					</td>
				</tr>
				<tr>
					<!-- 파일 업로드 -->
					<th scope="row">파일</th>
					<td><input type="file" name="file1" id="file"></td>
				</tr>
				<tr style="text-align: right">
					<td colspan="2">
						<input type="hidden" value="${folderSerial}" name="folderSerial">
						<input type="button" value="저장" onclick="insertBoard();">
						<input type="reset" value="취소">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
<script>
function insertBoard(){
	
	 var form = $("form")[0];       
     var formData = new FormData(form);

     $.ajax({
         cache : false,
         url : "MiniHpBoardInsert.do", // 요기에
         processData: false,
         contentType: false,
         type : 'POST', 
         data : formData, 
         success : function(data) {
       			var ajaxMain = {
       		            url : 'miniHpBoard.do?folderSerial='+data,
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
         }, 
         error : function(xhr, status) {
             alert(xhr + " : " + status);
         }
     });
}
</script>