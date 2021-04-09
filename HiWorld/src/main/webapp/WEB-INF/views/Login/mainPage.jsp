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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/mainPage.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link href="jquery.bxslider/jquery.bxslider.css" rel="stylesheet" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/Favicon.png" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/Favicon.png" type="image/x-icon">
<script src="https://kit.fontawesome.com/9fa8ba39be.js" crossorigin="anonymous"></script>
<title>Hi-World</title>

<script type="text/javascript">
                
	 $(document).ready(function(){
		 	var main = $('.bxslider').bxSlider({
				       mode: 'fade',
				       auto:true,
				       speed:500,
				       controls: false,
				       pager: false
				   })
				   
	$.ajax({
			url : "allClientCount.do",
			type : "GET",
			success : function(data) {
				console.log(data);
				let text = 'Hi-World에 오신것을 환영합니다';
				let text2 = '총 가입자수 : '+data;
				 $('#startpage1').append(text);
				 $('#startpage2').append(text2);
				 
				}
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
            	var popupWidth = 1080
            	var popupHeight = 600
            	var popupX = (window.screen.width/2)-(popupWidth/2);
            	var popupY = (window.screen.height/2)-(popupHeight/2);
            	window.open("MiniHP_Home.do","미니홈페이지",'status=no, scrollbars=no, menubar=no, toolbar=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY)  
			}
    	
             
            function bamTol(){
            	let userSerial = '${sessionVO.userSerail}';
            	if(userSerial!=''){
            		var popupWidth =880
                	var popupHeight =580
                	var popupX = (window.screen.width/2)-(popupWidth/2);
                	var popupY = (window.screen.height/2)-(popupHeight/2);
                	window.open("BamTolCharge.do","미니홈페이지",'status=no, scrollbars=no, menubar=no, toolbar=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY)  
            	}else{
            		alert("로그인하세요.");
            	}
            	
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
            	let serial = '${sessionVO.userSerial}';
            	if(serial==''){
            		alert("로그인하세요")
            	}else{
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
								var popupWidth = 1080;
								var popupHeight = 600;
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
    		
    		window.open('pw_Id_find.do','_blank','top=80,left=20,width=550, height=500');
		}
    	
    	
    	$().ready(function() {
    		$.ajax({
    			url : "weather.do",
    			type : "GET",
    			dataType : "json",
    			async : true,
    			cache : false,
    			success : function(data) {
    				
    				// 서울
    				// 비올확률 %
    				//console.log(data[0])
    				// 현재 온도
    				//console.log(data[1])
    				
    				// 부산
    				// 비올확률 %
    				//console.log(data[2])
    				// 현재 온도
    				//console.log(data[3])
    				
    				// 대구
    				// 비올확률 %
    				//console.log(data[4])
    				// 현재 온도
    				//console.log(data[5])
    				
    				// 인천
    				// 비올확률 %
    				//console.log(data[6])
    				// 현재 온도
    				//console.log(data[7])
    				
    				// 광주
    				// 비올확률 %
    				//console.log(data[8])
    				// 현재 온도
    				//console.log(data[9])
    				
    				// 대전
    				// 비올확률 %
    				//console.log(data[10])
    				// 현재 온도
    				//console.log(data[11])
    				
    				// 울산
    				// 비올확률 %
    				//console.log(data[12])
    				// 현재 온도
    				//console.log(data[13])
    				
    				// 수원
    				// 비올확률 %
    				//console.log(data[14])
    				// 현재 온도
    				//console.log(data[15])
    				
    				const seoul = '서울 온도 : '+data[1]+'℃ 비올 확률 : '+data[0]+'%<br>';
    				const busan = '부산 온도 : '+data[3]+'℃ 비올 확률 : '+data[2]+'%<br>';
    				const daegu = '대구 온도 : '+data[5]+'℃ 비올 확률 : '+data[4]+'%<br>';
    				const incheon = '인천 온도 : '+data[7]+'℃ 비올 확률 : '+data[6]+'%<br>';
    				const gwangju = '광주 온도 : '+data[9]+'℃ 비올 확률 : '+data[8]+'%<br>';
    				const daejeon = '대전 온도 : '+data[11]+'℃ 비올 확률 : '+data[10]+'%<br>';
    				const ulsan = '울산 온도 : '+data[13]+'℃ 비올 확률 : '+data[12]+'%<br>';
    				const suwon = '수원 온도 : '+data[15]+'℃ 비올 확률 : '+data[14]+'%<br>';
    				
    				$('#seoul').html(seoul);
    				$('#busan').html(busan);
    				$('#daegu').html(daegu);
    				$('#incheon').html(incheon);
    				$('#gawngju').html(gwangju);
    				$('#daejeon').html(daejeon);
    				$('#ulsan').html(ulsan);
    				$('#suwon').html(suwon);
    			}
    		})
    		
    		
    		
    		$.ajax({
    			type: "GET",
    			url: "covid19.do",
    			dataType: "json",
    			async:true,
                cache:false,
                success: function(data) {            	
                	// 코로나 완치 수
    				//console.log(data[0])
    				
    				// 코로나 확진자 수 전체
    				//console.log(data[1])
    				
    				// 오늘 코로나 확진자 수
    				//console.log(data[2])
    				
    				// 오늘 날짜
    				//console.log(data[3])
    				
    				/* 전체완치 오늘완치 전체확진 오늘확진 */
    				
                	const allCovid = '현재 확진자 수 : '+data[0]+'명('+data[1]+'↑)';
        			const clearCovid = '현재 완치자 수 : '+data[2]+'명('+data[3]+'↑)';
                	
    				$('#allCovid').html(allCovid);
    				$('#clearCovid').html(clearCovid);
    			}
    		})
    		
    		
    		/* $('#seoul').hide();
    		$('#busan').hide();
    		$('#daegu').hide();
    		$('#incheon').hide();
    		
    		$('#daejeon').hide();
    		$('#ulsan').hide();
    		$('#suwon').hide(); */
    		
    		
    		let count = 1;
    		
    		setInterval(function() {
    			switch (count) {
    			case 1:
    				$('#allCovid').slideUp();
    				setTimeout(function() {		
    					$('#clearCovid').slideDown()					
    				}, 400)
    				break;
    			case 2:
    				$('#clearCovid').slideUp();
    				setTimeout(function() {		
    					$('#seoul').slideDown();
    				}, 400)
    				break;
    			case 3:
    				$('#seoul').slideUp();
    				setTimeout(function() {		
    					$('#busan').slideDown();
    				}, 400)
    				break;
    			case 4:
    				$('#busan').slideUp();
    				setTimeout(function() {		
    					$('#daegu').slideDown();
    				}, 400)
    				break;
    			case 5:
    				$('#daegu').slideUp();
    				setTimeout(function() {		
    					$('#incheon').slideDown();
    				}, 400)
    				break;
    			case 6:
    				$('#incheon').slideUp();
    				setTimeout(function() {		
    					$('#gawngju').slideDown();
    				}, 400)
    				break;
    			case 7:
    				$('#gawngju').slideUp();
    				setTimeout(function() {		
    					$('#daejeon').slideDown();
    				}, 400)
    				break;
    			case 8:
    				$('#daejeon').slideUp();
    				setTimeout(function() {		
    					$('#ulsan').slideDown();
    				}, 400)
    				break;
    			case 9:
    				$('#ulsan').slideUp();
    				setTimeout(function() {		
    					$('#suwon').slideDown();
    				}, 400)
    				break;
    			case 10:
    				$('#suwon').slideUp();
    				setTimeout(function() {		
    					$('#allCovid').slideDown();
    				}, 400)
    				count = 0;
    				break;
    			default:
    				break;
    			}

    			console.log(count);
    			count += 1;
    		}, 5000)
    	})
    	

		
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
		    	<img src="resources/images/로고7.png" alt="로고사진" />
		    		<div id="mainserch">
			    		 <input type="text" id="searchInput" placeholder="이웃검색하기"/>
			    		<i class="fas fa-search fa-2x"></i>
		    		</div>
		    		<div id="startpage">
		    			<div id="startpage1"></div>
			    		<div id="startpage2"></div>
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
	           <div id="weather">
	           		<div id="menu_slider">
						<div id="allCovid"></div>
						<div id="clearCovid" style="display: none;"></div>
						<div id="seoul" style="display: none;"></div>
						<div id="busan" style="display: none;"></div>
						<div id="daegu" style="display: none;"></div>
						<div id="incheon" style="display: none;"></div>
						<div id="gawngju" style="display: none;"></div>
						<div id="daejeon" style="display: none;"></div>
						<div id="ulsan" style="display: none;"></div>
						<div id="suwon" style="display: none;"></div>
					</div>
	           </div>   
         </div>
         <hr />
        <div class="leftCon">
            <div id="Nav">

                <div id="bx_div">
                	<ul class="bxslider">
				        <li><img src="resources/images/mainbanner.png" alt="사진"></li>
				        <li><img src="resources/images/메인배너2.png" alt="" /></li>
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
						            <img src="${itemList.characterSrc}" alt="미니미">
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
						                <div onclick="myinfo()" id="myinfo">내정보보기</div>
						                <a href="logout.do" id="logoutbutton">로그아웃</a>
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
									<div id="jang-top2">
										<div onclick="Manage_Client()">회원관리</div>
										<div id="article_manage" onclick="Manage_Article()">상품등록</div>
									</div>
									<div id="jang-bottom2">
										<div onclick="Manage_Board()">공지등록</div>
										<a id="logout" href="logout.do">로그아웃</a>
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
						<a href="#" onclick="MiniHP()" id="joinminihome">미니홈피 들어가기</a>
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
		<div id="footer">
			<div id="footer_img">
				<img src="resources/images/로고4.png" alt="" />
			</div>
			<div id="footer_con">
				<div id="footer_top">누구든지 정보통신망을 통하여 음란물, 지적 재산권/저작권 침해 자료, 선거법에 어긋나는 자료, 타인의 명예를 훼손하는 자료,</div>
				<div>청소년 유해자료, 기타 위법 자료 등을 게시하거나 전송하는 경우 게시물은 경고없이 삭제되며,</div>
				<div>게시자는 각 해당 법률에 따라 민·형사상의 책임을 질 수 있습니다.</div>
				<div id="footerText">Copyright © <p>HI-WORLD</p>. All rights reserved.</div>
			</div>
		</div>
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