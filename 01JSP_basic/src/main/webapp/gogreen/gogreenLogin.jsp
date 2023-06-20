<%@page import="util.CookieManager"%>
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
	
	// 아이디저장 체크박스
	String saveYN = request.getParameter("savecheck");
	// 아이디저장에 체크가 되어있다면 쿠키에 아이디를 저장
	if("Y".equals(saveYN)){
		CookieManager.makeCookie(response, "userid", id, 60*60*24*7);
	}
		
	if("abc".equals(id) && "123".equals(pw)){
		// response.sendRedirect("gogreen.jsp?name=" + id);
		
		// 세션 영역에 Id를 저장
		session.setAttribute("id", id);
		response.sendRedirect("gogreen.jsp");
	} else{
		response.sendRedirect("gogreen.jsp?loginErr=Y");
	}
%>
</body>
</html>