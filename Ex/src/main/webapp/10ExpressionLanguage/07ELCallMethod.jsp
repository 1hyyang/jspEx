<%@page import="util.CookieManager"%>
<%@page import="el.MyELClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL)-메소드 호출</title>
</head>
<body>
<h2>영역에 저장 후 메소드 호출하기</h2>
<h3>주민번호를 입력 받아 성별을 반환</h3>
<% pageContext.setAttribute("myELClass", new MyELClass()); %>
${ myELClass.getGender("001225-3000000") }<br>
${ myELClass.getGender("000505-4000000") }<br>

<h2>정적 메소드 호출하기</h2>
<h3>입력 받은 문자열이 숫자인지 판별</h3>
${ MyELClass.isNumber("12a34b") }<br>

<h3>입력 받은 정수까지 구구단을 HTML 테이블로 출력</h3>
${ MyELClass.showGugudan(9) }<br>

<h2>정적 메소드 호출하기 - 쿠키 생성하기</h2>
<% pageContext.setAttribute("response", response); %>
${ CookieManager.makeCookie(response, "ELCookie", "EL좋아요", 10) }<br>
${ cookie.ELCookie.value }<br>
</body>
</html>