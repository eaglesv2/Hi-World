<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/shoppingPage.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
      function shop_character(){
              //ajax option
               console.log("1234") 
              var ajaxOption={
             		 type: "GET",
                      url : "shop_character.do",
                      dataType : "html", 
                      async:true,
                      cache:false
             		 
              }
         	  $.ajax(ajaxOption).done(function(data){
         		  //Contents 영역삭제
         		  $('.sangpum').children().remove();
         		  console.log("1111") 
         		  //Contents 영역 교체
         		  $('.sangpum').html(data);
         	  }).fail(function(error) {
                   alert(JSON.stringify(error));
                   console.log("에러를 찾자");
               });
             };
    function shop_background(){
		        //ajax option
		        console.log("1234") 
		       var ajaxOption2={
		      		 type: "GET",
		               url : "shop_background.do",
		               dataType : "html", 
		               async:true,
		               cache:false
		      		 
		       }
		  	  $.ajax(ajaxOption2).done(function(data){
		  		  //Contents 영역삭제
		  		  $('.sangpum').children().remove();
		  		  console.log("1111") 
		  		  //Contents 영역 교체
		  		  $('.sangpum').html(data);
		  	  }).fail(function(error) {
		            alert(JSON.stringify(error));
		            console.log("에러를 찾자");
		        });
		      };

     function shop_music(){
		         //ajax option
		         console.log("1234") 
		        var ajaxOption3={
		       		 type: "GET",
		                url : "shop_music.do",
		                dataType : "html", 
		                async:true,
		                cache:false
		       		 
		        }
		   	  $.ajax(ajaxOption3).done(function(data){
		   		  //Contents 영역삭제
		   		  $('.sangpum').children().remove();
		   		  console.log("1111") 
		   		  //Contents 영역 교체
		   		  $('.sangpum').html(data);
		   	  }).fail(function(error) {
		             alert(JSON.stringify(error));
		             console.log("에러를 찾자");
		         });
		       };


    function shop_mouse(){
		        //ajax option
		        console.log("1234") 
			       var ajaxOption4={
			      		 type: "GET",
			               url : "shop_mouse.do",
			               dataType : "html", 
			               async:true,
			               cache:false
		      		 
		       }
		  	  $.ajax(ajaxOption4).done(function(data){
		  		  //Contents 영역삭제
		  		  $('.sangpum').children().remove();
		  		  console.log("1111") 
		  		  //Contents 영역 교체
		  		  $('.sangpum').html(data);
		  	  }).fail(function(error) {
		            alert(JSON.stringify(error));
		            console.log("에러를 찾자");
		        });
		      };
    </script>
</head>
<body>
	<div class="Navi">
		<div onclick="shop_character()">캐릭터</div>
		<div onclick="shop_background()">배경화면</div>
		<div onclick="shop_music()">음악</div>
		<div onclick="shop_mouse()">마우스모양</div>
	</div>
		<div class="sangpum">
		<table>
				<tr id="tablehead">
						<td>상품</td>
						<td>종류</td>
						<td>상품명</td>
						<td>가격</td>
						<td>구매하기</td>
						<td>장바구니로가기</td>
				</tr>
				<c:forEach var="kinds" items="${ArticleList}">
					<tr>
						<td><img src="${kinds.articleImg}" /></td>
						<td>${kinds.articleKinds}</td>
						<td>${kinds.articleName}</td>
						<td>${kinds.articlePrice}BT</td>
						<td><a href="#"
							onclick="bay('${kinds.articleName}'+','+'${kinds.articlePrice}')">구매하기</a></td>
						<td><a href="#" onclick="basket('${kinds.articleName}')">장바구니담기</a></td>
					</tr>
			
				</c:forEach>
			
		</table>
	</div>
	
	<div>
		<a href="basketJoin.do">장바구니</a>
		<h1>물품 최신순으로 나열</h1>
	</div>




</body>
<script>
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
</html>