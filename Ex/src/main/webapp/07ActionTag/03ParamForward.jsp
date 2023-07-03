<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action tag-param</title>
</head>
<body> 
<h2>자바빈즈를 이용한 매개 변수 전달</h2>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="person" class="dto.Person" scope="request"/>
<jsp:getProperty name="person" property="name"/><br>
<jsp:getProperty name="person" property="age"/>

<h2>forward된 페이지에서 매개 변수 확인</h2>
<%= request.getParameter("param1") %><br>
<%= request.getParameter("param2") %><br>
<%= request.getParameter("param3") %><br>

<h2>include된 페이지에서 매개 변수 확인</h2>
<jsp:include page="inc/ParamInclude.jsp">
	<jsp:param name="loc1" value="서울 구로구"/>
	<jsp:param name="loc2" value="개봉동"/>	
</jsp:include>
</body>
</html>