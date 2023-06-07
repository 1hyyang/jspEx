<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<% 
	String id = request.getParameter("userid");
	String pw = request.getParameter("userpw");
	
	if("abc".equals(id) && "123".equals(pw)){
		response.sendRedirect("gogreen.jsp?name=" + id);
	} else{
		response.sendRedirect("gogreen.jsp?loginErr=Y");
	}
%>
</body>
</html>