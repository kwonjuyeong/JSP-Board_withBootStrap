<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.io.PrintWriter" %>
    <%@ page import = "bbs.BbsDAO" %>
    <%@ page import = "bbs.Bbs" %>
    <%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css"> 
<title>게시판 웹 사이트</title>
<!--  게시글 태그 커스텀-->
<style type = "text/css">
    a, a:hover
    {
        color: #000000;
        text-decoration: none;
    }
</style>
</head>
<body>
<%
		String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
		if (session.getAttribute("userID") != null)
			{
    			userID = (String)session.getAttribute("userID");
			}
			int pageNumber = 1; // 기본페이지 기본적으로 페이지 1부터 시작한다.
			if (request.getParameter("pageNumber") != null)
			{
    			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
 			<table class = "table table-striped" style="text-align:center;border:ipx solid #dddddd">
 				<thead>
 					<tr>
 						<th style = "background-color: #eeeeee; text-align: center;">번호</th>
 						<th style = "background-color: #eeeeee; text-align: center;">제목</th>
 						<th style = "background-color: #eeeeee; text-align: center;">작성자</th>
 						<th style = "background-color: #eeeeee; text-align: center;">작성일</th>
 					</tr>
 				</thead>
 				<tbody>
 						<%			
 						BbsDAO bbsDAO = new BbsDAO();
 	                    ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
 	                    for(int i = 0; i < list.size(); i++)
 	                    {
 						%>		
 					
 					<tr>
 							<td><%=list.get(i).getBbsID() %></td>
                        	<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
                        	<td><%=list.get(i).getUserID() %></td>
                        	<td><%=list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11, 13) + "시" 
                        	+ list.get(i).getBbsDate().substring(14,16) + "분" %></td>	
 					</tr>
 					<%
 						}
 					%>
 				</tbody>
 			</table>
 			<%
                if(pageNumber != 1) {
            %>
                <a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-left">이전</a>
            <%
                } if (bbsDAO.nextPage(pageNumber + 1)) {
            %>
                <a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left">다음</a>
            
            <%
                }
            %>
 			
 			
 			<div class = "form-row float-right">
 			<a href = "write.jsp" class = "btn btn-primary">글쓰기</a>
 			</div>
 		</div>
 	</div>
 
 
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
</body>
</html>