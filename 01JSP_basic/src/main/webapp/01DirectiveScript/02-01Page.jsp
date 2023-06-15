<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
	java.lang 패키지에 속하지 않은 클래스를 JSP 문서에서 사용하기 위해 임포트
	패키지명을 포함한 클래스명을 입력
 -->
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어</title>
</head>
<body>
<h2>page 지시어</h2>

<h3>language</h3>
<p>스크립팅 언어(응용 프로그램에서 사용되는 프로그램 언어)를 지정</p>

<h3>contentType</h3>
<p>문서의 타입과 인코딩 방식을 지정</p>

<h3>pageEncoding</h3>
<p>소스 코드의 인코딩 방식을 지정</p>

<h3>import</h3>
<p>java.lang 패키지에 속하지 않은 클래스를 JSP 문서에서 사용하기 위해 임포트</p>
<%
	LocalDateTime ldt = LocalDateTime.now();
	String date = ldt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss"));
%>
<%= date %>
</body>
</html>