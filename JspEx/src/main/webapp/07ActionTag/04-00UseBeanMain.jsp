<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action tag-use bean</title>
</head>
<body>
<h2>액션 태그 useBean</h2>
<!--
	useBean 액션 태그로 자바빈즈 생성하기 
		id		: 자바빈즈 이름
		class 	: 패키지명을 포함한 클래스명
		scope	: 저장될 영역
	
		액션 태그를 이용하여 자바빈을 생성시 기본 생성자가 이용된다.
 --> 
<!-- dto 패키지의 Person 객체를 생성 후 request 영역에 저장한다. -->
<jsp:useBean id		= "person"
			 class	= "dto.Person"
			 scope	= "request"></jsp:useBean>

<!--
	setProperty 액션 태그로 자바빈즈 속성 지정하기
		name	 : 자바빈즈 이름
		property : 필드명
		value	 : 필드값
 -->
<jsp:setProperty name="person" property="name" value="콩지"/>
<jsp:setProperty name="person" property="age" value="20"/>

<h3>getProperty 액션 태그로 자바빈즈 속성 읽기</h3>
<ul>
	<li>이름: <jsp:getProperty name="person" property="name"/></li>
	<li>나이: <jsp:getProperty name="person" property="age"/>	</li>	
</ul>

<h3>request 객체를 이용하여 자바빈즈 속성 읽기</h3>
<%
	Person p = (Person)request.getAttribute("person");
%>
<ul>
	<li>이름: <%= p.getName() %></li>
	<li>나이: <%= p.getAge() %></li>	
</ul>
</body>
</html>