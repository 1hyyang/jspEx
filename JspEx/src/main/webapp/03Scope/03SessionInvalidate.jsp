<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체의 영역-session</title>
</head>
<body>
<%
	// 세션의 기본 유효 시간은 30분
	
	// 세션 무효화
	session.invalidate();
%>
세션이 무효화되었습니다.
<a href="03SessionLocation.jsp">03SessionLocation.jsp 바로가기</a>
</body>
</html>