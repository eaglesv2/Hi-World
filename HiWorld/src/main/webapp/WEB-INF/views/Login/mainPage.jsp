<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/mainPage.css">
<link rel="stylesheet" href="resources/css/reset.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/mainPage.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link href="jquery.bxslider/jquery.bxslider.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/Favicon.png" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/Favicon.png" type="image/x-icon">
<title>Hi-World</title>

<script type="text/javascript">
                
	 $(document).ready(function(){
		 	var main = $('.bxslider').bxSlider({
				       mode: 'fade',
				       auto:false,
				       speed:500,
				       controls: false,
				       pager: false
				   })
				   
						   
			});
      
        function signUp(){
        	location.href="userInsertForm.do";
        }
        
          function notice(){
             //ajax option
              console.log("1234") 
             var ajaxOption={
            		 type: "GET",
                     url : "noticePage.do",
                     dataType : "html", 
                     async:true,
                     cache:false
 
             }
        	  $.ajax(ajaxOption).done(function(data){
        		  //Contents 영역삭제
        		  $('#bodyContext').children().remove();
        		  console.log("1111") 
        		  //Contents 영역 교체
        		  $('#bodyContext').html(data);
        	  }).fail(function(error) {
                  alert(JSON.stringify(error));
                  console.log("에러를 찾자");
              });
            };
        	
             
             function shopping(list){
                 console.log("1234") 
                 var ajaxOption2={
                		 type: "GET",
                         url : "sangpoom.do",
                         data: {"list":list},
                         dataType : "html", 
                         async:true,
                         cache:false
                 }
                 
                 
            	  $.ajax(ajaxOption2).done(function(data){
            		  //Contents 영역삭제
            		  $('#bodyContext').children().remove();
            		  console.log("1111") 
            		  //Contents 영역 교체
            		  $('#bodyContext').html(data);
            	  })
             };
             function board(Name){
            	 if(Name!="" && Name!=null){
            		 console.log("1234") 
                     var ajaxOption3={
                    		 type: "GET",
                             url : "boardPage.do",
                             dataType : "html", 
                             async:true,
                             cache:false
                    		 
                     }
                	  $.ajax(ajaxOption3).done(function(data){
                		  //Contents 영역삭제
                		  $('#bodyContext').children().remove();
                		  console.log("1111") 
                		  //Contents 영역 교체
                		  $('#bodyContext').html(data);
                	  })
            	 }else {
					alert("로그인하세요");
				}
            	 
             };
             
             function question(Name){
            	 if(Name!="" && Name!=null){
             	 console.log("1234") 
                 var ajaxOption4={
                		 type: "GET",
                         url : "questionPage.do",
                         dataType : "html", 
                         async:true,
                         cache:false
                		 
                 }
            	  $.ajax(ajaxOption4).done(function(data){
            		  //Contents 영역삭제
            		  $('#bodyContext').children().remove();
            		  console.log("1111") 
            		  //Contents 영역 교체
            		  $('#bodyContext').html(data);
            	  })
            	 }else{
            		 alert("로그인하세요");
            	 }
             };
             
             function myinfo(){
                 var ajaxOption5={
                		 type: "GET",
                         url : "logincheck.do",
                         dataType : "html", 
                         async:true,
                         cache:false
                		 
                 }
            	  $.ajax(ajaxOption5).done(function(data){
            		  console.log("dddd")
            		  //Contents 영역삭제
            		  $('#bodyContext').children().remove();
            		  console.log("1111") 
            		  //Contents 영역 교체
            		  $('#bodyContext').html(data);
            	  })
             }
             function MiniHP() {
            	var popupWidth = 880
            	var popupHeight = 580
            	var popupX = (window.screen.width/2)-(popupWidth/2);
            	var popupY = (window.screen.height/2)-(popupHeight/2);
            	window.open("MiniHP_Home.do","미니홈페이지",'status=no, scrollbars=no, menubar=no, toolbar=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY)  
			}
    	
             
            function bamTol(){
            	var popupWidth =880
            	var popupHeight =580
            	var popupX = (window.screen.width/2)-(popupWidth/2);
            	var popupY = (window.screen.height/2)-(popupHeight/2);
            	window.open("BamTolCharge.do","미니홈페이지",'status=no, scrollbars=no, menubar=no, toolbar=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY)  
            }
	
            function kaja2(){
            	var UserPW = $('#password').val();
    		   	console.log(UserPW);
                  $.ajax({
                	url: "pwCheck.do",
                	type: "POST",
                	data: {"UserPW":UserPW},
                	success: function(data) {
                		console.log(data)
    					if(data==1){
    		                 var ajaxOption5={
    		                		 type: "GET",
    		                         url : "getOneClient.do",
    		                         dataType : "html", 
    		                         async:true,
    		                         cache:false
    		                		 
    		                 }
    		            	  $.ajax(ajaxOption5).done(function(data){
    		            		  console.log("dddd")
    		            		  //Contents 영역삭제
    		            		  $('#bodyContext').children().remove();
    		            		  console.log("1111") 
    		            		  //Contents 영역 교체
    		            		  $('#bodyContext').html(data);
    		            	  })
    					}else{
    						Swal.fire('비밀번호를 다시 입력해주세요.')
    					}
    				},
                  error: function(){
                	  alert("에러입니다.")
                 		 }
                	})
           
    		
    			}
            
            function shoppingcart(){
            	console.log("1234") 
                var ajaxOption={
               		 type: "GET",
                        url : "basketJoin.do",
                        dataType : "html", 
                        async:true,
                        cache:false
               		 
                }
           	  $.ajax(ajaxOption).done(function(data){
           		  //Contents 영역삭제
           		  console.log('adfdasf')
           		  $('#bodyContext').children().remove();
           		  console.log("1111") 
           		  //Contents 영역 교체
           		  $('#bodyContext').html(data);
           	  })
            }
            
            /*  여기부터 userview */
   function updateName() {
	   alert("버튼 눌렀어요");
		var ajaxData = $('input[name=username]').val();
		alert("여기가 오류난거야?")
		var upDatech = 1;
		console.log("여기 왔니?")
		alert(ajaxData)
		$.ajax({
			url : "UserUpdate.do",
			type:"POST",
			data : {"userName" : ajaxData, "upDatech":upDatech},
			success: function(data) {
				
				if($('#name_hiden2').css('display') == 'none'){
					$('#name_hiden2').show();
					}
				},
			   			error : function () {
							alert("error")
			}
		});
		}
        	function basket(ArticleName) {
    			var UserSerial = '${sessionVO.userSerial}';
    			$.ajax({
    				type: "GET",
    				url: "basket.do",
    				data: {
    					"UserSerial" : UserSerial,
    					"ArticleName" : ArticleName
    				},
    				success : function (data) {
    					if(data==1){
    						alert("성공")
    					}else if(data==0){
    						alert("이미 구매한 상품")
    					}else if(data==-1){
    						alert("실패")
    					}else if(data==-2){
    						alert("이미 장바구니 들어감")
    					}
    				}
    			})
    	}
    	
    	function bay(ArticleName) {
    		var UserSerial = '${sessionVO.userSerial}';
    		
    		/* alert 창 */
    		const swalWithBootstrapButtons = Swal.mixin({
     			customClass: {
        		cancelButton: 'btn btn-danger',
        		confirmButton: 'btn btn-success'
      			},
      			buttonsStyling: false
    		})
    		swalWithBootstrapButtons.fire({
    	  		title: '정말 구매하실껀가요??',
    			text: "구매 하신 후 환불은 어렵습니다.",
    			icon: 'warning',
    			showCancelButton: true,
    			confirmButtonText: '구매 하지 않겠습니다.',
    			cancelButtonText: '구매 하겠습니다.',
    			reverseButtons: true
    		}).then((result) => {
    			
    			if (result.isConfirmed) {
    				swalWithBootstrapButtons.fire(
    	 				      '취소 하였습니다.'
    	 				    )
     		} else if (result.dismiss === Swal.DismissReason.cancel) {
     			$.ajax({
    					type: "GET",
    					url: "bay.do",
    					data:{
    						"UserSerial" : UserSerial,
    						"ArticleName" : ArticleName
    					},
    					success: function (data) {
    						if(data==1){
    							swalWithBootstrapButtons.fire(
    							     '결제 성공 하였습니다.'
    			    			)
    						}else if(data==0){
    							swalWithBootstrapButtons.fire(
    							     '밤톨이 부족합니다'
    			    				)
    						}else if(data==-1){
    							swalWithBootstrapButtons.fire(
    						    	 '이미 구매한 상품입니다.'
    			    			)
    						}
    					}
    				})
    		}
    		})
    	}
    	
    	/*  여기부터 userview */
    	   function updateName() {
    		   alert("버튼 눌렀어요");
    			var ajaxData = $('input[name=username]').val();
    			alert("여기가 오류난거야?")
    			var upDatech = 1;
    			console.log("여기 왔니?")
    			alert(ajaxData)
    			$.ajax({
    				url : "UserUpdate.do",
    				type:"POST",
    				data : {"userName" : ajaxData, "upDatech":upDatech},
    				success: function(data) {
    					
    					if($('#name_hiden2').css('display') == 'none'){
    						$('#name_hiden2').show();
    						}
    					},
    				   			error : function () {
    								alert("error")
    				}
    			});
    			}
    	
    	/* 어드민 회원관리 */
    	function Manage_Client(){
    		$.ajax({
    			url: "Manage_Client.do",
    			type: "GET",
    			data: {"check":"all"},
    			dataType: "html",
    			success: function(data) {
    				$("#bodyContext").html(data);
    			}
    		})
    	}	
    	
    	/* 어드민 상품등록 */
    	function Manage_Article() {
    		$.ajax({
    			url: "Manage_Article.do",
    			type: "GET",
    			dataType: "html",
    			success: function(data) {
    				$("#bodyContext").html(data);
    			}
    		})
    	}
    	
    	/* 어드민 공지사항 등록 */
    	function Manage_Board() {
    		$.ajax({
    			url: "Manage_Board.do",
    			type: "GET",
    			dataType: "html",
    			success: function(data) {
    				$("#bodyContext").html(data);
    			}
    		})
    	}
    	

    	/* 홈페이지 즐겨찾기 */
    	function bookmark_add() {
    	     bookmark_url  = "도메인입력";
    	     bookmark_name = "홈페이지 타이틀";
    	    
    	     try {
    	      window.external.AddFavorite(bookmark_url,bookmark_name);
    	     } catch(e) {
    	      alert('이 브라우저는 즐겨찾기 추가 기능을 지원하지 않습니다.');
    	      return false;
    	     }
    	 }
    	$(document).ready(function() {
			$.ajax({
				type: 'get',
				url: "boardPage.do",
				dataType: "json",
				//data: {"param":"param"},
				success: function(data) {
					console.log(data);
    	                        	   	                        	
					let source = $.map(data, function(item) { //json[i] 번째 에 있는게 item 임.
						return {
							label: item.hpTitle+"      "+item.userName+"("+item.userID+")",    //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
							userID: item.userID, //그냥 사용자 설정값
							userSerial: item.userSerial
						}
					});
					
					$("#searchInput").autocomplete({
						source : source, // source 는 자동 완성 대상
						select : function(event, ui) {    //아이템 선택시
							console.log(ui);//사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
							console.log(ui.item.label);    //label
							console.log(ui.item.userID);    //value
							console.log(ui.item.test);    //김치 볶음밥test
							
							var userID = '${sessionVO.userID}';
							
							if(userID==''){
								alert("로그인후 이용하실수 있습니다.")
							}else{
								var popupWidth = 880;
								var popupHeight = 580;
								var popupX = (window.screen.width/2)-(popupWidth/2);
								var popupY = (window.screen.height/2)-(popupHeight/2);
								window.open("miniHp_guestHome.do?OwnerSerial="+ui.item.userSerial,ui.item.userID,'status=no, scrollbars=no, menubar=no, toolbar=no, height='+popupHeight +',width='+popupWidth +',left='+popupX+',top='+popupY);
							};
						},
						focus : function(event, ui) {    //포커스 가면
							  return false;//한글 에러 잡기용도로 사용됨
						},
						minLength: 1,// 최소 글자수
						autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
						classes: {    //잘 모르겠음
							"ui-autocomplete": "highlight"
						},
						delay: 500,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
						disabled: false, //자동완성 기능 on,off
						position: { my : "right top", at: "right bottom" },    //잘 모르겠음
						close : function(event){    //자동완성창 닫아질때 호출
							$(this).val('');
						}
					});
				}
			})
		})	
    	
		function Id_Pw_find(){
    		location.href="pw_Id_find.do";
		}
		
      </script>
      <style>
	      	.kakaobutton > img{
			width: 200px;
			height: 33px;
			vertical-align: middle;
		}
		.bx-wrapper{
			margin-right:15px;
			border:none;
			margin-bottom:15px;
		}
/* 		@font-face {
		    font-family: 'PFStardust';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/PFStardust.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		} */
		@font-face {
	    font-family: 'SDSamliphopangche_Outline';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
		body{
			 font-family: 'SDSamliphopangche_Outline';
			 font-weight: 400;
		}
		input{
			font-family:'SDSamliphopangche_Outline';
		}
		
      </style>



</head>
<body>
	
    <div class="MainContainer">
	   
		    <div id="mainlogo">
		    	<img src="resources/images/로고5.png" alt="로고사진" />
		    		<div id="mainserch">
			    		 <input type="text" id="searchInput"/>
			    		<img src="resources/images/돋보기.png" alt="" />
		    		</div>
		    		<div id="startpage">
			    		<a href="#" onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('localhost:8081/hiworld/login.do');">Hi-World를 시작페이지로</a>
			    		 <a href="javascript: bookmark_add();">즐겨찾기 추가</a>
					</div>
			    		
		    </div>
		<hr />
		<div id="Navmenu"> 
			    <div id="Navli">
				      <li id="kong" onclick="notice()">
		                  	공지사항
		              </li>
		              <li id="shopping" onclick="shopping('쇼핑')">
		              		    쇼핑
		              </li>
<%-- 		              <li id="board" onclick="board('${sessionVO.userName}')">
		                               	이웃찾기
		              </li> --%>
		               <li id="question" onclick="question('${sessionVO.userName}')">
		                          	  문의
		              </li>
		              
		              <li id="shoppingcart" onclick="shoppingcart()">
		              		장바구니
		              </li>
		              <li id="bamtolcharge" onclick="bamTol()">
		              		밤톨충전
		              </li>
	           </div>   
         </div>
         <hr />
        <div class="leftCon">
            <div id="Nav">

                <div id="bx_div">
                	<ul class="bxslider">
				        <li><img src="resources/images/mainbanner.png" alt="사진"></li>
		    		</ul>

                </div>
                <div id="bodyContext">

                </div>
            </div>
        </div>

        <div class="rightCon">
          <div id="minimi">

		    <c:choose>
					<c:when test="${sessionVO.userName != null}">
						<c:if test="${sessionVO.userName != 'ADMIN'}">
							<div id="minimi">

						        <div id="icon">
						            <img src="bb.jpg" alt="">
						            <div>
						               <div id="nickname">
						              		 ${sessionVO.userName} 님
						              	</div>
						              	<div id="haveCash">
						              		보유 밤톨: ${sessionVO.userCash}개
						              	</div>
						          	     
						            </div>
						        </div>
						        <div id="jang">
						            <div id="jang-top">
						                <div onclick="myinfo()">내정보보기</div>
						                <a href="logout.do">로그아웃</a>
						            </div>
						        </div>
						    </div>
					</c:if>

					<c:if test="${sessionVO.userID == 'ADMIN'}">
					<!-- 어드민이 들어왔을 경우 -->
							<div id="minimi">
								<div id="icon">
									<img src="bb.jpg" alt="">
									<div>
										<div id="nickname">${sessionVO.userName}님</div>
										<div id="haveCash">보유 밤톨: ${sessionVO.userCash}개</div>

									</div>
								</div>
								<div id="jang">
									<div id="jang-top">
										<div onclick="Manage_Client()">회원관리</div>
										<div onclick="Manage_Article()">상품등록</div>
									</div>
									<div id="jang-bottom">
										<div onclick="Manage_Board()">공지등록</div>
										<a href="logout.do">로그아웃</a>
									</div>
								</div>
							</div>

						</c:if>
					</c:when>



					<c:otherwise>

						<!-- 기존 홈페이지를 통해 로그인한 사람이 로그인 할경우 -->

						<form action="checkClient.do" method="post">

							<table id="formtable">
								<tr>
									<td><input type="text" name="UserID" id="UserID"
										placeholder="아이디" required> <br></td>

									<td rowspan="2" style="vertical-align: middle;"><input
										type="submit" value="로그인" id="loginCheck" tabindex="-1">
									</td>
								</tr>
								<tr>
									<td><input type="password" id="UserPW" name="UserPW"
										placeholder="비밀번호" required> <br></td>

								</tr>
							</table>
							<input type="button" onclick="signUp()" value="회원가입" id="signup">
						</form>
						<div>
							<input type="button" onclick="Id_Pw_find()" value="아이디 비빌먼호 찾기" id="find-id" />
						</div>

						<!-- 네이버 로그인 창으로 이동 -->
						<div id="naver_id_login" style="text-align: center">

							<!-- 네아 확인 url주소가 넘어옴 -->
							<a href="${url}"> <img width="200px" height="33px"
								src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
						</div>

						<div id="kakao_id_login" style="text-align: center">
							<a id="kakao-login-btn" class="kakaobutton"></a>
						</div>
						<br>

					</c:otherwise>
				</c:choose>
			</div>
			<c:choose>
				<c:when test="${sessionVO.userName != null}">
					<div id="minihome">
						<a href="#" onclick="MiniHP()">미니홈피 들어가기</a>
					</div>
					<div id="add">
						<img src="resources/images/mainadd.png" alt="" />
					</div>
				</c:when>
				<c:otherwise>
					<div id="add1">
						<img src="resources/images/mainadd.png" alt="" />
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<div id="footer"></div>
</body>
<script>
	Kakao.init('f5c86bb2fcdff7b7a5ee465e8109c2a1');
	Kakao.isInitialized();
	
	
	Kakao.Auth.createLoginButton({ 
		container: '#kakao-login-btn', 
		success: function(authObj) { 
			Kakao.API.request({
	    	    url: '/v2/user/me',
	    	    success: function(data) {
	    	    	var UserID = data.id
	    	    	var UserName = data.properties.nickname
	    	    	location.href="kakaoLogin.do?UserID="+UserID+"&&UserName="+UserName
	    	    	
	    	      }
	    	});		
			}, 
		fail: function(err) { 
			alert(JSON.stringify(err)); 
			} 
		});
</script>
</html>