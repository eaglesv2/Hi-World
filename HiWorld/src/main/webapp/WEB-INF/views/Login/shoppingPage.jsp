<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div>
            <img src="" alt="상품">
            
        </div>
    </div>
</body>
</html>