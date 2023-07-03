<%@page import="java.util.ArrayList"%>
<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체의 영역-session</title>
</head>
<body>
<!-- 
	sessionId를 발급 -> 응답 객체의 쿠키에 담아서 웹 브라우저로 전송 -> 웹 브라우저는 응답을 받아서 쿠키에 저장
	-> 서버에 요청시 쿠키 정보를 담아서 요청
	
	사용자가 웹 브라우저를 열고 서버에 접근해서 웹 브라우저를 닫을 때까지 요청하는 모든 페이지는 세션 객체를 공유할 수 있다.
	회원 인증 후 로그인 상태를 유지하는 처리에 사용된다. (로그인 상태에서 웹 브라우저를 닫으면 로그아웃이 되는 까닭)
	웹 브라우저를 닫았다가 다시 열면 세션 객체에 저장된 값이 사라지는 것을 확인할 수 있다.
 -->

<h2>페이지가 이동된 후 session 영역의 속성 읽기</h2>
<%
	session.setAttribute("person", new Person("콩지", 20));
	ArrayList<String> list = new ArrayList<String>();
	list.add("list");
	list.add("set");
	list.add("map");
	session.setAttribute("list", list);
%>
<a href="03SessionLocation.jsp">03SessionLocation.jsp 바로가기</a>
<a href="03SessionInvalidate.jsp">03SessionInvalidate.jsp 바로가기</a>
</body>
</html>