<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체-response</title>
</head>
<body>
<% 
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pwd");
	
	// id!=null && id.equals("abc")
	if("abc".equals(id) && "123".equals(pw)){
		// 요청할 페이지 정보
		response.sendRedirect("02ResponseWelcome.jsp");
	} else{
		response.sendRedirect("02ResponseMain.jsp?loginErr=Y");
	}
%>
</body>
</html>