<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL)-객체 전달</title>
</head>
<body>
<%
	// request 영역에 객체를 생성 후 forward된 페이지에서 출력
	request.setAttribute("personObj", new Person("콩지", 20));
	request.setAttribute("stringObj", "문자열");
	request.setAttribute("integerObj", new Integer(99));
%>
<h2>객체 매개 변수</h2>
<jsp:forward page="03ObjectResult.jsp">
	<jsp:param value="10" name="firstNum"/>
	<jsp:param value="20" name="secondNum"/>
</jsp:forward>
</body>
</html>