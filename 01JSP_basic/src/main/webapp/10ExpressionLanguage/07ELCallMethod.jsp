<%@page import="util.CookieManager"%>
<%@page import="el.MyELClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	pageContext.setAttribute("myELClass", new MyELClass());
	pageContext.setAttribute("response", response);
%>

<h2>영역에 저장 후 메소드 호출하기</h2>
${ myELClass.getGender("001225-3000000") }<br>
${ myELClass.getGender("000505-4000000") }<br>

<h2>정적 메소드 호출하기</h2>
${ MyELClass.isNumber("12a34b") }<br>
${ MyELClass.showGugudan(9) }<br>

<h2>정적 메소드 호출하기 - 쿠키 생성하기</h2>
${ CookieManager.makeCookie(response, "ELCookie", "EL좋아요", 10) }<br>
${ cookie.ELCookie.value }<br>
</body>
</html>