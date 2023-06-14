<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
<!-- 
	Session
		클라이언트의 상태 정보를 저장한다.
		로그인 기능을 구현하는 데 사용된다.
	
		http 통신은 요청과 응답으로 구성되어 있다.
		클라이언트에서 서버로 페이지를 요청하면 서버는 페이지를 응답해주고 통신은 종료된다.		
		클라이언트에서 웹 브라우저로 서버에 최초로 접근시 
			-> 웹 서버는 웹 브라우저에게 세션 아이디를 발급 
			-> 세션 아이디는 쿠키로 생성되어 응답 객체의 쿠키에 담겨 클라이언트로 전송
				개발자도구의 쿠키를 확인해 보면 JSESESSIONID라는 값이 입력되어 있다.
				여기에 저장된 값이 세션 아이디이다.
				(웹 브라우저를 새로 열고 서버에 접근시 쿠키에 저장된 세션 아이디 값이 변경된 것을 확인할 수 있다.)		
		
	세션의 유지 시간
		유지 시간을 설정 하지 않으면 기본 30분(1800초)이며,
		유지 시간이 만료되기 전 새로운 요청이 들어오면 유지 시간이 연장된다.
		유지 시간 내 요청이 없는 경우 해당 세션은 서버에서 제거된다.
		클라이언트에서 JSESESSION 쿠키를 제거할 경우 서버는 새로운 세션 아이디를 발급한다.
	
	유지 시간 설정 방법
		web.xml : 유지 시간을 분 단위로 설정할 수 있다.
	 	session.setMaxInactiveInterval() : 유지 시간을 초 단위로 설정할 수 있다.
 -->

<h2>Session 설정 확인</h2>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); // 날짜 표시 형식
	long creationTime = session.getCreationTime(); // 최초 요청(세션 생성) 시각
	String creationTimeStr = sdf.format(new Date(creationTime));	
	long lastTime = session.getLastAccessedTime(); // 마지막 요청 시각
	String lastTimeStr = sdf.format(new Date(lastTime));
	
	// session.setMaxInactiveInterval(10);
%>
<ul>
	<li>최초 요청 시각: <%= creationTimeStr %></li>
	<li>마지막 요청 시각: <%= lastTimeStr %></li>
	<li>세션 아이디: <%= session.getId() %></li>
	<li>세션 유지 시간: <%= session.getMaxInactiveInterval() %>초</li>
</ul>
</body>
</html>