<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 파일 기본 구조</title>
</head>
<body>
<h1>JSP에서 JAVA 코드를 작성하는 방법</h1>
<h2>JSP Script Elements</h2>
<ul>
	<li>선언부	: 변수, 메소드를 선언 (전역 변수, 메소드)</li>
	<li>스크립틀릿	: 자바 코드를 작성 (지역 변수)</li>
	<li>표현식	: 값을 출력</li>
</ul>

<!-- 선언부 -->
<p>선언부 %!% : JSP 파일이 서블릿 파일로 변환시 _jspService() 메소드 외부에 작성되어 전역 변수, 메소드 생성</p>
<%!
	// 전역 변수를 선언
	String str = "Java Server Page";
	// 메소드를 선언
	public int add(int num1, int num2){
		return num1 + num2;
	}
%>
	
<!-- 스크립틀릿 -->
<p>스크립틀릿 %% : 자바 코드를 작성하는 영역. JSP 파일이 서블릿 파일로 변환시 _jspService() 메소드 내부에 기술, 메소드 선언 불가</p>
<%
	// 지역 변수
	int res = add(10, 20);
%>
	
<!-- 표현식 -->
<p>표현식 %=% : 변수, 상수, 수식 등을 출력. 실행 결과 하나의 값이 남는 문장을 화면에 출력</p>
<mark><%= str %></mark>
<mark><%= res %></mark>
<mark><%= add(10, 20) %></mark>
</body>
</html>