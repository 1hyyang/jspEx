<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체의 영역-request</title>
</head>
<body>
<h2>forward 페이지</h2>
<h3>02RequestMain.jsp파일의 request 영역의 속성 읽기</h3>
<%
	Person p = (Person)request.getAttribute("request_person");
%>
attribute 정보 출력
<ul>
	<li><%= p.getName()%>, <%= p.getAge() %></li>
</ul>
파라미터 정보 출력
<%
	request.setCharacterEncoding("UTF-8");
%>
<ul>
	<li><%= request.getParameter("name")%>, <%= request.getParameter("age") %></li>
</ul>
</body>
</html>