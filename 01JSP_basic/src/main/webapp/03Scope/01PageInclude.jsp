<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체의 영역-page</title>
</head>
<body>
<ul>
	<li>str: <%= pageContext.getAttribute("page") %></li>
	<li>int: <%= pageContext.getAttribute("page_int") %></li>
	<!-- Person 객체로 형변환하지 않았기 때문에 getName(), getAge() 사용 불가 -->
	<li>person: <%= pageContext.getAttribute("page_person") %></li>
</ul>
</body>
</html>