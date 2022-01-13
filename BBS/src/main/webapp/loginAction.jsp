<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="user.UserDAO" %>
 <%@ page import="java.io.PrintWriter" %>
 <% request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="user" class ="user.User" scope ="page"/>
 <jsp:setProperty name="user" property="userID"/> <!-- 아이디 패스워드 불러옴 -->
 <jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
 
 <%
 	UserDAO userDAO = new UserDAO();
 	int result = userDAO.login(user.getUserID(), user.getUserPassword());
 	if(result == 1){
 		session.setAttribute("userID", user.getUserID());
 		PrintWriter script = response.getWriter();
 		script.println("<script>");
 		script.println("location.href = 'main.jsp'"); //로그인 성공하면 main으로 넘겨줌
 		script.println("</script>");
 	}
 	else if(result == 0){
 		PrintWriter script = response.getWriter();
 		script.println("<script>");
 		script.println("alert('비밀번호가 틀립니다.')");
 		script.println("history.back()"); //이전 페이지(로그인)로 돌림
 		script.println("</script>");	
 	}
 	else if(result == -1){
 		PrintWriter script = response.getWriter();
 		script.println("<script>");
 		script.println("alert('존재하지 않는 아이디입니다.')");
 		script.println("history.back()");
 		script.println("</script>");	
 	}
 	else if(result == -2){
 		PrintWriter script = response.getWriter();
 		script.println("<script>");
 		script.println("alert('데이터베이스 오류가 발생했습니다.')");
 		script.println("history.back()");
 		script.println("</script>");	
 	}
 	%>
 
</body>
</html>