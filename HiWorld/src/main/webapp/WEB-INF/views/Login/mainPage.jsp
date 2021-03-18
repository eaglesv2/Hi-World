<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/mainPage.css">
    <link rel="stylesheet" href="resources/css/reset.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="resources/js/mainPage.js"></script>
    <title>Document</title>
    <script type="text/javascript" language="javascript">
                
        $(document).ready(function(){    
              $("#header").load("header.html");
    
    
          });
      
          function Notice(){
              $.ajax({
                   type: "GET",
                   url : "NoticePage.html",
                   dataType : "text",
                      error : function(){
                          alert("통신실패!!!!");
                      },
                      success : function(babo){

                          $('#bodyContext').html(babo);
                     
                      }
                  })
 
             };
             
             function shopping(){
              $.ajax({
                   type: "GET",
                   url : "ShoppingPage.html",
                   dataType : "text",
                      error : function(){
                          alert("통신실패!!!!");
                      },
                      success : function(babo){

                          $('#bodyContext').html(babo);
                     
                      }
                  })
 
             };

             function board(){
              $.ajax({
                   type: "GET",
                   url : "BoardPage.html",
                   dataType : "text",
                      error : function(){
                          alert("통신실패!!!!");
                      },
                      success : function(babo){

                          $('#bodyContext').html(babo);
                     
                      }
                  })
 
             };
             
             function question(){
              $.ajax({
                   type: "GET",
                   url : "QuestionPage.html",
                   dataType : "text",
                      error : function(){
                          alert("통신실패!!!!");
                      },
                      success : function(babo){
                            console.log("성공")
                          $('#bodyContext').html(babo);

                      }
                  })
 
             };
             
             
    

                
      </script>
</head>
<body>

    <div class="MainContainer">
            <div id="header">
                
            </div>
        <div class="leftCon">
            <div id="Nav">
                <div id="Navmenu">
                        <li id="kong" onclick="Notice()">
                            공지사항
                        </li>
                        <li id="shopping" onclick="shopping()">
                            쇼핑
                        </li>
                        <li id="board" onclick="board()">
                            게시판
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

                <form action="">    
                    <div id="id">
                            <label for="id">아이디</label> 
                            <input type="text" id="id">
                    </div>
                    
                    <div id="password">
                            <label for="password">비밀번호</label>
                            <input type="text" id="password">
                    </div>

                    <div>
                        <input type="submit" id="loginbutton" value="로그인">
                        <input type="button"  id="signup" value="회원가입">
                    </div>
                </form>
            </div>
                <div id="minihome">
                    <a href="">미니홈피 들어가기</a>
                </div>

                <div id="add">
                    광고입니다
                </div>
        </div>
    </div>
</body>

</html>