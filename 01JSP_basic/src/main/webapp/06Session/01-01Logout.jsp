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
	// 방법 1 : 회원 인증 정보 속성 삭제
	session.removeAttribute("member");
	// 방법 2 : 세션 무효화
	// session.invalidate();	
	// 세션 아이디 새로 발급
	request.getSession(true);	
	// 페이지 이동
	response.sendRedirect("01-01LoginForm.jsp");
%>
</body>
</html>