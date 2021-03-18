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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="resources/js/mainPage.js"></script>
    <title>Document</title>
    <script type="text/javascript" language="javascript">
                
        $(document).ready(function(){    
              $("#header").load("header");
    
    
          });
      
          function notice(){
              $.ajax({
                   type: "GET",
                   url : "noticePage",
                   dataType : "text",
                      error : function(){
                          alert("통신실패!!!!");
                      },
                      success : function(babo){
							alert("성공")
                          $('#bodyContext').html(babo);
                     
                      } 
                  })
 
             };
             
             function shopping(){
              $.ajax({
                   type: "GET",
                   url : "Login/shoppingPage.jsp",
                   dataType : "html",
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
                   url : "Login/boardPage.jsp",
                   dataType : "html",
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
                   url : "Login/questionPage.jsp",
                   dataType : "html",
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
                        <li id="kong" onclick="notice()">
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

		    <c:choose>
				
					<c:when test="${UserName != null}">
							<div id="minimi">
						        <div id="icon">
						            <img src="bb.jpg" alt="">
						            <div>
						                ${UserName}
						            </div>
						        </div>
						        <div id="jang">
						            <div id="jang-top">
						                <a href="getOneClient.do?UserID=${UserID}">내정보보기</a>
						                <a href="">내이웃보기</a>
						            </div>
						            <div id="jang-bottom">
						                <a href="">장바구니</a>
						                <a href="logout.do">로그아웃</a>
						        </div>
						        </div>
						    </div>
					</c:when>
					
				<c:otherwise>
					
						<!-- 기존 홈페이지를 통해 로그인한 사람이 로그인 할경우 -->
						<h2>로그인</h2>
						<form action="checkClient.do" method="post">
							<input type="text" name="UserID" id="UserID" placeholder="아이디" required> <br> 
							<input type="password" id="UserPW" name="UserPW" placeholder="비밀번호" required> <br>
							<input type="submit" value="로그인" id="loginCheck"> <br>
						</form>
						<a href="userInsertForm.do">회원가입</a>
						<br>
						
						<!-- 네이버 로그인 창으로 이동 -->
						<div id="naver_id_login" style="text-align: center">
							<!-- 네아 확인 url주소가 넘어옴 -->
							<a href="${url}"> <img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
						</div>
						<br>
						</c:otherwise>
					</c:choose>
            </div>
                <div id="minihome">
                    <a href="MiniHP_Home.do">미니홈피 들어가기</a>
                </div>

                <div id="add">
                    광고입니다
                </div>
        </div>
    </div>
</body>

</html>