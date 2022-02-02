<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.io.PrintWriter" %>
    <%@ page import = "bbs.Bbs" %>
    <%@ page import = "bbs.BbsDAO" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
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
		if(userID == null){
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('로그인을 하세요.')");
	 		script.println("location.href = 'login.jsp'");
	 		script.println("</script>");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('유효하지 않은 글입니다.')");
	 		script.println("location.href = 'bbs.jsp'");
	 		script.println("</script>");		
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		
		//현재 로그인 한 사용자와 작성자 계정이 다를 경우
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('권한이 없습니다..')");
	 		script.println("location.href = 'bbs.jsp'");
	 		script.println("</script>");
		}
%>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
  		<a class="navbar-brand text-secondary" href="main.jsp">메인</a>
  		<!-- active속성 bootstrap 4버젼이라 디자인 체인지 요망 -->
  		<a class= "active" class="navbar-brand text-secondary" href="bbs.jsp">게시판</a>

		<div class="dropdown"> 
		  			<button class="btn btn-secondary dropdown-toggle"
		          			type="button" id="dropdownMenuButton" 
		          			data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">접속하기
		  			</button>
		  			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		    				<a class="dropdown-item" href="logoutAction.jsp">로 그 아 웃</a>
		  			</div>
		 </div>
 </nav>
 

 <div class = "container">
 		<div class="raw">
 			<form method="post" action="updateAction.jsp?bbsID=<%= bbsID%>">
 				<table class = "table table-striped" style="text-align:center; border: 1px solid #dddddd">
 					<thead>
 						<tr>
 							<th colspan="2" style = "background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>		
 						</tr>
 					</thead>
 					<tbody>
 						<tr>
 							<td><input type="text" class="form-control" placeholder ="글 제목" name="bbsTitle" maxlength="50" value = "<%=bbs.getBbsTitle()%>"></td>
 						</tr>
 						<tr>
 							<td><textarea class="form-control" placeholder ="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"><%=bbs.getBbsContent()%></textarea></td>
 						</tr>
 					</tbody>
 				</table>
 					<div class = "form-row float-right">
 						<input type = "submit" class="btn btn-primary" value = "글수정">
 					</div>
 			</form>
 		</div>
 	</div>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
</body>
</html>