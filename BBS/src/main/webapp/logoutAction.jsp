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
		session.invalidate(); //������ �����Ű��
	%>
	<script>
		location.href = 'main.jsp' //���� �������� �̵���Ŵ

	</script>
</body>
</html>