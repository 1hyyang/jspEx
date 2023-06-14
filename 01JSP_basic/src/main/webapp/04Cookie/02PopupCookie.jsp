<%@page import="util.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창 제어</title>
</head>
<body>
<h1>쿠키를 이용한 팝업창 제어</h1>
<%
	// 하루동안 팝업창이 열리지 않도록 쿠키 생성
	CookieManager.makeCookie(response, "popupClose", "Y", 60*60*24);
	// response.sendRedirect("02PopupMain01.jsp");
%>
</body>
</html>