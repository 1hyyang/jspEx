<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action tag-param</title>
</head>
<body>
<!-- 
	액션 태그는 태그의 형태를 지니고 있어 소스의 이질감이 줄어들고 
	jsp 코드보다 훨씬 짧은 코드로 동일한 기능을 구현할 수 있다.
 -->

<!-- 자바빈즈 객체를 파라미터로 전달하기 -->
<jsp:useBean id="person" class="dto.Person" scope="request"/>
<jsp:setProperty name="person" property="name" value="츠르후"/>
<jsp:setProperty name="person" property="age" value="18"/>

<!-- jsp:forward, jsp:include 액션 태그를 이용하여 파라미터를 전달하기 -->
<% String paramValue = "forward"; %>
<jsp:forward page="03ParamForward.jsp?param1=actiontag">
	<jsp:param name="param2" value="parameter"/>
	<jsp:param name="param3" value="<%= paramValue %>"/>
</jsp:forward>
</body>
</html>