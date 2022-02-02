<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.io.PrintWriter" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1"> <!-- 반응형 웹 메타 태그 -->
<link rel="stylesheet" href="css/bootstrap.min.css"> 
<link rel="stylesheet" href="css/custom.css"> 
<title>로그인</title>
</head>
<body>
<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
%>


 <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
  <a class="active" class="navbar-brand text-secondary" href="main.jsp">메인</a>
  <a class="navbar-brand text-secondary" href="bbs.jsp">게시판</a>

	<%
		if(userID ==null){
			
	%>	
	
	
	 <div class="dropdown">
  		<button class="btn btn-secondary dropdown-toggle"
          type="button" id="dropdownMenuButton" 
          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">접속하기
  		</button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    	<a class="dropdown-item" href="login.jsp">로 그 인</a>
    	<a class="dropdown-item" href="join.jsp">회 원 가 입</a>	
  </div>
  </div>
		
	<%

		}else{
	%>	
			 <div class="dropdown">
		  		<button class="btn btn-secondary dropdown-toggle"
		          type="button" id="dropdownMenuButton" 
		          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">접속하기
		  		</button>
		  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		    	<a class="dropdown-item" href="logoutAction.jsp">로 그 아 웃</a>
		  </div>
		  </div>
			
		<% 			
		}
	%>
 </nav>
 
  <!-- 메인 페이지 이미지 삽입 : Carousel을 통해 웹사이트에 이미지 파일을 넣어줘서 꾸밀 수 있다. -->
 <div class = "container">
 		<div id="myCarousel" class="carousel slide" data-ride="carousel">
	 			<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
	 			<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="images/1.jpg"  > <!-- style = "width : 100%" ->  css에 넣어서 일일히 안써도됨. -->
						</div>
						<div class="carousel-item">
							<img src="images/2.jpg">
						</div>
						<div class="carousel-item">
							<img src="images/3.jpg" >
						</div>
				</div>
			 			<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="carousel-control-next" href="#myCarousel" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>			
 		</div>
 </div>
 
 
 <div class ="container">
 	<div class="jumbotron">
 		<div class = "container">
 			<h1>웹 사이트 소개</h1>
 			<p>웹 사이트 개발 연습용 페이지입니다. JSP, 부트스트랩을 이용해 개발하였습니다. 간단한 로직으로 기본을 구현하였습니다.</p>
 			<p><a class = "btn btn-primary btn-pull" href="login.jsp" role="button" value = "로그인">회원이신가요?</a></p>
 			<p><a class = "btn btn-primary btn-pull" href="join.jsp" role="button" value = "로그인">회원이아니신가요?</a></p>
 		</div>
 	</div>
 </div>
 


 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
</body>
</html>