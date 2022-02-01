<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.io.PrintWriter" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css"> 
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
  <a class="navbar-brand text-secondary" href="main.jsp">메인</a>
  <a class= "active" class="navbar-brand text-secondary" href="bbs.jsp">게시판</a><!-- active속성 bootstrap 4버젼이라 디자인 체인지 요망 -->
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
 

 <div class = "container">
 		<div class="raw">
 			<form method="post" action="writeAction.jsp">
 				<table class = "table table-striped" style="text-align:center; border: 1px solid #dddddd">
 					<thead>
 						<tr>
 							<th colspan="2" style = "background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>		
 						</tr>
 					</thead>
 					<tbody>
 						<tr>
 							<td><input type="text" class="form-control" placeholder ="글 제목" name="bbsTitle" maxlength="50"></td>
 						</tr>
 						<tr>
 							<td><textarea class="form-control" placeholder ="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"></textarea></td>
 						</tr>
 					</tbody>
 				</table>
 					<div class = "form-row float-right">
 						<input type = "submit" class="btn btn-primary" value = "글쓰기">
 					</div>
 			</form>
 		</div>
 	</div>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
</body>
</html>