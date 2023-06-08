<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="dto.Person"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체의 영역-page</title>
</head>
<body>
<%
	// 페이지 영역에 저장
	pageContext.setAttribute("page", "페이지영역(스코프)");
	pageContext.setAttribute("page_int", 10000);
	pageContext.setAttribute("page_person", new Person("콩지", 20));
%>

<h2>page 영역의 속성값 읽기</h2>
<%
	// Object 타입으로 변환되므로 변수에 담기 위해서는 형변환이 필요
	String page_str = (String)pageContext.getAttribute("page");
	// String page_str = pageContext.getAttribute("page").toString();
	int page_int = (Integer)pageContext.getAttribute("page_int");
	Person page_person = (Person)pageContext.getAttribute("page_person");
%>
<ul>
	<li>str: <%= page_str %></li>
	<li>int: <%= page_int %></li>
	<li>person: <%= page_person.getName()%>, <%= page_person.getAge() %></li>
</ul>

<h2>include된 파일에서 page 영역 읽어오기</h2>
<%@ include file="01PageInclude.jsp" %>

<h2>페이지 이동 후 page 영역 읽어오기</h2>
<!-- 링크를 이용해서 페이지를 다시 요청하면 페이지 영역이 초기화된다. -->
<a href="01PageLocation.jsp">01PageLocation.jsp 바로가기</a>
</body>
</html>