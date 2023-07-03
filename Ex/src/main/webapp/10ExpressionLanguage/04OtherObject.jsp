<%@page import="util.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL)-그 외 전달</title>
</head>
<body>
<!-- 
	쿠키, 헤더값을 읽을 수 있는 내장 객체를 제공
	
	cookie : 쿠키를 읽을 때 사용
	header : 헤더 정보를 읽을 때 사용
	initParam : web.xml에 설정한 컨텍스트 초기화 매개 변수를 읽을 때 사용
	pageContext : JSP의 pageContext 객체와 동일한 역할
 -->

<h2>쿠키 값 읽기</h2>
<%
	// 쿠키 생성
	CookieManager.makeCookie(response, "ELCookie", "EL좋아요", 10);
%>
<li>${ cookie.ELCookie.value }</li>

<h2>HTTP 헤더 읽기</h2>
<ul>
	<li>${ header.host }</li>
	<li>${ header['user-agent'] }</li>
	<li>${ header.cookie }</li>
</ul>

<h2>컨텍스트 초기화 매개 변수</h2>
<ul>
	<li>${ initParam.INIT_PARAM }</li>
	<li>${ initParam.OracleDriver }</li>
</ul>

<h2>컨텍스트 루트 경로 읽기</h2>
<ul>
	<li>${ pageContext.request.contextPath }</li>
</ul>
</html>