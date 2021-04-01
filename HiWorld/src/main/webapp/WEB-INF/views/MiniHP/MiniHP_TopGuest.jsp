<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><link rel="stylesheet" href="${resourcePath }/img${fontCss}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	displayTitle();
});

function displayTitle(){
	console.log('display title');
	
	$.ajax({
		type : 'GET',
		url : 'miniHp_getGuestIntroTitle.do',
		data : { OwnerID : '${OwnerID}'},
		
		success : function(result) {
			console.log('ajax success4');
			console.log(result);
			$("#inText").html(result);
		}
	})
}

</script>
<body style="overflow:hidden;">
	<div id="titleName" style="padding-top:12px;">
		<span style="font-weight:bold; font-size: 15px; color: #4B9687; cursor: pointer;" id="inText"></span>
	</div>
</body>
</html>
