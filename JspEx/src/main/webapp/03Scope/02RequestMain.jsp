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
<%
	request.setAttribute("request_str", "request 영역에 문자열을 저장");
	request.setAttribute("request_person", new Person("콩지", 20));
%>

<h2>request 영역의 속성값 읽어오기</h2>
<%
	String request_str = (String)request.getAttribute("request_str");
	Person request_person = (Person)request.getAttribute("request_person");
%>
<ul>
	<li><%= request_str %></li>
	<li><%= request_person.getName()%>, <%= request_person.getAge() %></li>
</ul>

<h2>request 영역의 속성값 삭제하기</h2>
<%
	request.removeAttribute("request_str");
%>
request_str 삭제: <%= request.getAttribute("request_str") %>

<h2>forward된 페이지에서 request 영역의 속성값 읽기</h2>
<%
	//request.getRequestDispatcher("02RequestForward.jsp?name=츠르후&age=18").forward(request, response);
%>
</body>
</html>