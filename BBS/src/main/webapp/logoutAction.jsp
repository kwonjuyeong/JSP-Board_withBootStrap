<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate(); //세션을 종료시키면
	%>
	<script>
		location.href = 'main.jsp' //메인 페이지로 이동시킴

	</script>
</body>
</html>