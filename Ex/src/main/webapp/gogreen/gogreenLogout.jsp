<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
<%
	// 세션 무효화
	session.invalidate();
	// 세션 아이디 새로 발급
	request.getSession(true);
	// 페이지 이동
	response.sendRedirect("gogreen.jsp");
%>
</body>
</html>