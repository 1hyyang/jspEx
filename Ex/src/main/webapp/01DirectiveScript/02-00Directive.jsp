<!--
	지시어(Directive)
		JSP 페이지를 자바(서블릿) 코드로 변환하는 데 필요한 정보
	
	지시어의 종류
		page	: JSP 페이지에 대한 정보를 설정
		include	: 외부 파일을 현재 JSP 페이지에 포함시킴
		taglib	: 표현 언어에서 사용할 자바 클래스나 JSTL을 선언
	
	작성 방법
		<%@ 지시어종류 속성1="값", ...(속성 나열) %>
	
	JSP 파일 생성시 기본 인코딩을 변경하는 방법
	 	Window > Preferences > JSP Files > Encoding UTF-8
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지시어</title>
</head>
<body>
</body>
</html>