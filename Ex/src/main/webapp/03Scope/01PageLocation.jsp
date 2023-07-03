<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체의 영역-page</title>
</head>
<body>
<h2>페이지 이동 후 page 영역의 속성값 읽기</h2>
<%
	Object page_str = pageContext.getAttribute("page");
	Object page_int = pageContext.getAttribute("page_int");
	Object page_person = pageContext.getAttribute("page_person");
%>
<ul>
	<li>str: <%= (page_str==null)?"값 없음":page_str %></li>
	<li>int: <%= (page_int==null)?"값 없음":page_int %></li>
	<li>person: <%= (page_person==null)?"값 없음":page_person %></li>
</ul>
</body>
</html>