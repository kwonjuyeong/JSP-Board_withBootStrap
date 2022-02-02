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
<title>로그인</title>
</head>
<body>
<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		//bbsID를 불러와 안에 있는 내용을 가져와서 변형.
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
 				<table class = "table table-striped" style="text-align:center; border: 1px solid #dddddd">
 					<thead>
 						<tr>
 							<!-- colspan은 열의 갯수 -->
 							<th colspan="3" style = "background-color: #eeeeee; text-align: center;">게시판 글보기 양식</th>		
 						</tr>
 					</thead>
 					<tbody>
 						<tr>
 							<td style="width: 20%;">글 제목</td>
 							<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
 						</tr>
 						<tr>
 							<td>작성자</td>
 							<td colspan="2"><%= bbs.getUserID() %></td>
 						</tr>
 						<tr>
 							<td>작성일자</td>
 							<td colspan="2"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11, 13) + "시" 
 		                        	+ bbs.getBbsDate().substring(14,16) + "분" %></td>
 						</tr>
 						<tr>
 							<td>내용</td>
 							<!--  게시글에 특수문자(<), 공백 등을 웹사이트가 html 코드로 잘못 인식할 수 있기 때문에 따로 replace 처리를 해줘야한다.-->
 							<!--  특수문자 처리를 제대로 안해줄 시 해킹 공격에 취약할 수 있다. 해커가 제목이나 글에 스크립트문을 넣어 조작할 수 있음. -->
 							<td colspan="2" style ="min-height: 200px; text-align:left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
 						</tr>
 					</tbody>
 				</table>
 					<div class = "form-row float-right">
 						<a href="bbs.jsp" class="btn btn-primary" >목록</a>
 					</div>
 				    <% 
 				    if(userID != null && userID.equals(bbs.getUserID()))
                	{
           		 	%>
                		<a href="update.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">수정</a>
                		<a href="deleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">삭제</a>
                
            	<%     
                }
 				    
            	%>
 		</div>
 	</div>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
</body>
</html>