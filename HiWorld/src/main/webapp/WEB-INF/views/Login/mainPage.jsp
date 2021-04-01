<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/mainPage.css?after">
    <link rel="stylesheet" href="resources/css/reset.css">
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="resources/js/mainPage.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link href="jquery.bxslider/jquery.bxslider.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <title>Document</title>
    <script type="text/javascript">
                

	 $(document).ready(function(){
		 	var main = $('.bxslider').bxSlider({
				       mode: 'fade',
				       auto:true,
				       controls:true,
				       speed:500,
	   

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
             
             function question(){
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
      </script>
      <style>
	      	.kakaobutton > img{
			width: 200px;
			height: 33px;
			vertical-align: middle;
		}
		.bx-wrapper{
			margin-bottom:30px;
		}
      </style>
</head>
<body>
	
    <div class="MainContainer">
		    <ul class="bxslider">
		        <li><img src="resources/images/AttractionsBanner.jpg" alt="사진"></li>
		        <li><img src="resources/images/CommerceBanner.jpg" alt=""></li>
		        <li><img src="resources/images/CommunityBanner.jpg" alt=""></li>
		        <li><img src="resources/images/FoodBanner.jpg" alt=""></li>
		    </ul>
        <div class="leftCon">
            <div id="Nav">
                <div id="Navmenu">
                        <li id="kong" onclick="notice()">
                         	   공지사항
                        </li>
                        <li id="shopping" onclick="shopping('쇼핑')">
                 		           쇼핑
                        </li>
                        <li id="board" onclick="board('${sessionVO.userName}')">
                           	 이웃찾기
                        </li>
                        <li id="question" onclick="question()">
                           	 문의
                        </li>
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
						                <div onclick="bamTol()">밤톨충전</div>
						            </div>
						            <div id="jang-bottom">
						                <div onclick="shoppingcart()">장바구니</div>
						                <a href="logout.do">로그아웃</a>
						        	</div>
						        </div>
						    </div>
					</c:if>
					<c:if test="${sessionVO.userName == 'ADMIN'}">
					<!-- 어드민이 들어왔을 경우 -->
                  	
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
						                <div onclick="bamTol()">밤톨충전</div>
						            </div>
						            <div id="jang-bottom">
						                <div onclick="shoppingcart()">장바구니</div>
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
										<td>
											<input type="text" name="UserID" id="UserID" placeholder="아이디" required> <br>
										</td>
										 
										<td rowspan="2" style="vertical-align:middle;">
											<input type="submit" value="로그인" id="loginCheck" tabindex="-1">	
										</td>
									</tr>
									<tr>
										 <td>
											 <input type="password" id="UserPW" name="UserPW" placeholder="비밀번호" required> <br>
										 </td>
									
									</tr>							
								</table>
							<input type="button" onclick="signUp()" value="회원가입" id="signup">
						</form>
						<div>
							<input type="button" value="아이디 비빌먼호 찾기" id="find-id" />
						</div>
				
						<!-- 네이버 로그인 창으로 이동 -->
						<div id="naver_id_login" style="text-align: center">
			
							<!-- 네아 확인 url주소가 넘어옴 -->
							<a href="${url}"> <img width="200px" height="33px" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
						</div>
						
						<div id="kakao_id_login" style="text-align: center">
							<a id="kakao-login-btn" class="kakaobutton" ></a>
						</div>
						<br>
						
						</c:otherwise>
					</c:choose>
            </div>
                <div id="minihome">
                    <a href="#" onclick="MiniHP()">미니홈피 들어가기</a>
                </div>

                <div id="add">
                  	  <img src="resources/images/mainadd.png" alt="" />
                </div>
        </div>
    </div>
    
    <div id="footer">
    	
    </div>
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