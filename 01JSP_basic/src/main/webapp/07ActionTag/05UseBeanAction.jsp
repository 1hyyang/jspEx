<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action tag-use bean</title>
</head>
<body>
<h2>액션 태그로 폼의 값을 한번에 받기</h2>
<!-- 05UseBeanForm.jsp로부터 폼의 값을 받아 온다. -->

<!-- 자바빈즈 생성하기 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="person" class="dto.Person"/>

<!-- 자바빈즈 속성 지정하기 -->
<!-- 와일드카드(*)를 사용하면 모든 폼의 값을 한번에 자바빈즈에 입력할 수 있다. -->
<jsp:setProperty name="person" property="*"/>

<!-- 자바빈즈 속성 읽기 -->
<ul>
	<li>이름: <jsp:getProperty name="person" property="name"/></li>
	<li>나이: <jsp:getProperty name="person" property="age"/></li>
</ul>
</body>
</html>