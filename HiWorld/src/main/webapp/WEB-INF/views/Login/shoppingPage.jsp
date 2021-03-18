<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/ShoppingPage.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
      function shop_character(){
          $.ajax({
                 type: "GET",
                 url : "shop_character.jsp",
                  dataType : "text",
                      error : function(){
                          alert("통신실패!!!!");
                      },
                      success : function(babo){

                          $('.sangpum').html(babo);
                     
                      }
                  })
 
             };
    function shop_background(){
          $.ajax({
                 type: "GET",
                 url : "shop_bacground.jsp",
                  dataType : "text",
                      error : function(){
                          alert("통신실패!!!!");
                      },
                      success : function(babo){

                          $('.sangpum').html(babo);
                     
                      }
                  })
 
             };

     function shop_music(){
          $.ajax({
                 type: "GET",
                 url : "shop_music.jsp",
                  dataType : "text",
                      error : function(){
                          alert("통신실패!!!!");
                      },
                      success : function(babo){

                          $('.sangpum').html(babo);
                     
                      }
                  })
 
             };


    function shop_mouse(){
          $.ajax({
                 type: "GET",
                 url : "shop_mouse.jsp",
                  dataType : "text",
                      error : function(){
                          alert("통신실패!!!!");
                      },
                      success : function(babo){

                          $('.sangpum').html(babo);
                     
                      }
                  })
 
             };
    </script>
</head>
<body>
    <div class="Navi">
        <div onclick="shop_character()">캐릭터</div>
        <div onclick="shop_bacground()">배경화면</div>
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