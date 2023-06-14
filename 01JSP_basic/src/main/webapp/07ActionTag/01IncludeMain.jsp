<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action tag-include</title>
</head>
<body>
<%
	/*
		액션 태그
			JSP에서 사용하는 표준 태그로 페이지 사이에서 이동을 제어하거나 
			자바 객체(자바빈)를 생성할 때 주로 사용된다.
				- XML 문법을 따르며 반드시 종료 태그를 작성해야 한다.
				- 액션 태그 사이에 주석을 사용할 수 없다.
				- 표현식을 사용할 수 없다.
		
		액션 태그의 종류
			<jsp:include> 		: 외부 파일을 현재 파일에 포함시킨다.
			<jsp:forward> 		: 다른 페이지로 요청을 넘긴다.
			<jsp:param> 		: 다른 페이지로 매개 변수를 전달한다.
								  jsp:include, jsp:forward 태그와 함께 사용한다.		
			<jsp:useBean>		: 자바빈을 생성한다.
	*/
	pageContext.setAttribute("pAttr", "동명왕");
	request.setAttribute("rAttr", "온조왕");
%>
 
<h2>지시어와 액션 태그 동작 방식 비교</h2>
<h3>지시어 방식</h3>
<%@ include file="inc/OuterPage01.jsp" %>
<p>외부 파일에 선언한 변수: <%= newVar1 %></p>

<h3>액션 태그 방식</h3>
<!-- 
	액션 태그 방식
	페이지 영역이 공유되지 않음
	외부 파일에서 생성된 변수가 공유되지 않음
 -->
<jsp:include page="inc/OuterPage02.jsp"/>
<p>외부 파일에 선언한 변수: <%--= newVar2 --%></p>
</body>
</html>