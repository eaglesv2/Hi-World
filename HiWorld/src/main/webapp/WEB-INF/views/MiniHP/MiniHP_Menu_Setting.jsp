<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${resourcePath}/img${fontCss}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	function openOrCloseMenu(index){
		
		var menu = document.getElementById("menu"+index);
		
		if(menu.style.display=="none"){
			menu.style.display="block";
		}else{
			menu.style.display="none"
		}
	}
	
	function setBasicInformation(){
		
		$.ajax({
			type : 'POST',
			url : 'miniHp_setBasicInformation_pw.do',
			
			success : function(result) {
				$("#bodyContents").children().remove();
				$("#bodyContents").html(result)
			}
		});
	}
	
	function setMenuAvailable(){

		$.ajax({
			type : 'POST',
			url : 'miniHp_menuAvailable.do',
			
			success : function(result) {
				$("#bodyContents").children().remove();
				$("#bodyContents").html(result);
			}
		});
	}
	
	function setNeighborList(){
		console.log('11');
		
		$.ajax({
			type : 'POST',
			url : 'miniHp_setNeighborList.do',
			
			success : function(result) {
				console.log('22')
				$("#bodyContents").children().remove();
				$("#bodyContents").html(result);
			}
		});
	}
	
	<%-- function setUsingBackGound(){
		var url="<%=cp%>/cy/setting/usingBackGround.action";
		  
		$.post(url,{},function(args){
			$("#browser").html(args); 
		});
	}
	
	function setUsingStoryMinimi(){
		var url="<%=cp%>/cy/setting/usingStoryMinimi.action";		  
		$.post(url,{},function(args){
			$("#browser").html(args); 
		});
	}

	function setUsingSong(){
		var url="<%=cp%>/cy/setting/changeUsingSong.action";
		  
		$.post(url,{},function(args){
			$("#browser").html(args); 
		});
	}
	
	function setUsingFont(){
		var url="<%=cp%>/cy/setting/changeUsingFont.action";
		  
		$.post(url,{},function(args){
			$("#browser").html(args); 
		});
	}
	
	
	 --%>
</script>
<style>
#managerTitle{
	width: 150px;
	height: 30px;
	font-size: 15pt; 
	font-weight: bold; 
	color: #1294AB; 
	letter-spacing: 1px;
}
#menus{
	border-top: 3px solid #EBEBEB; 
	border-bottom: 3px solid #EBEBEB; 
	width: 150px; 
	height: 370px; 
	word-break:break-all;
	overflow: auto;
	overflow-x: hidden;
}
.menuTitle{
	border: 0px solid black;
	width: 100%;
	font-size: 10pt;
	font-weight: bold;
}
#menuManage{
	border: 0px solid black;
	width: 100%;
	padding-left: 4px;
}
#menuItem{
	border: 0px solid black;
	width: 100%;
	padding-left: 4px;
	display: none;
}
.subMenu{
	font-size: 9pt;
	font-weight: bold;
	color: #1294AB;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="managerTitle" align="left">
		Manager
	</div>
								
	<div id="menus" align="left">
		<div class="menuTitle">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/setting_menu_3lines.png" height="13px" width="13px">
			<span onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" onclick="openOrCloseMenu('Manage')">
				미니홈피관리
			</span>
		</div>
		<div id="menuManage">
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<span class="subMenu" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';" onclick="setBasicInformation();">
				기본정보
			</span>
			<br/>
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<span class="subMenu" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';" onclick="setMenuAvailable()">
				메뉴
			</span>
			<br/>
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<span class="subMenu" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';" onclick="setNeighborList()">
				이웃관리
			</span>
			<br/><br/>
		</div>
				
		<div class="menuTitle">
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_3lines.png" height="13px" width="13px">
			<span onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" onclick="javascript:openOrCloseMenu('Item')">
				아이템 설정관리
			</span>
		</div>
		<div id="menuItem">
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<span class="subMenu" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';" onclick="javascript:setUsingBackGound()">
				미니홈피 스킨 설정
			</span>
			<br/>
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<span class="subMenu" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';" onclick="javascript:setUsingFont()">
				글꼴 설정
			</span>
			<br/>
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<span class="subMenu" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';" onclick="javascript:setUsingStoryMinimi()">
				스토리룸,미니미 설정
			</span>
			<br/>
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<span class="subMenu"  onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';" onclick="javascript:setUsingSong()">
				음악 설정
			</span>
			<br/><br/>
		</div>
		
		<div class="menuTitle">
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_3lines.png" height="13px" width="13px">
			<span onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" onclick="javascript:openOrCloseMenu('4')">
				관리자 정보
			</span>
		</div>
		<%-- 
		<div id="menu4" style="border: 0px solid black;width: 100%;padding-left: 4px;display: none;">
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<font  style="font-size:9pt;font-weight: bold;color: #1294AB;">
				<span onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';"
				onclick="javascript:swal('지켜본다', '', '<%=cp %>/resources/images/developer.png')">
					여승현
				</span>
			</font><br/>
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<font  style="font-size:9pt;font-weight: bold;color: #1294AB;">
				<span onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';"
					onclick="javascript:swal('의빈아 밥먹자', '', '<%=cp %>/resources/images/developer.png')">
					임의빈
				</span>
			</font><br/>
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<font  style="font-size:9pt;font-weight: bold;color: #1294AB;">
				<span onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';"
					onclick="javascript:swal('현종씨 계신가요. 현종씨', '', '<%=cp %>/resources/images/developer.png')">
					유현종
				</span>
			</font><br/>
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<font  style="font-size:9pt;font-weight: bold;color: #1294AB;">
				<span onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';"
					onclick="javascript:swal('누나 놀지말고 코딩해라', '', '<%=cp %>/resources/images/developer.png')">
					이예리
				</span>
			</font><br/>
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<font  style="font-size:9pt;font-weight: bold;color: #1294AB;">
				<span onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';"
					onclick="javascript:swal('형 그것 좀 해주세요', '', '<%=cp %>/resources/images/developer.png')">
					최원석
				</span>
			</font><br/>
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<font  style="font-size:9pt;font-weight: bold;color: #1294AB;">
				<span onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';"
					onclick="javascript:swal('재진아 던파하니', '', '<%=cp %>/resources/images/developer.png')">
					이재진
				</span>
			</font><br/>
		</div>
		 --%>
	</div>

</body>
</html>