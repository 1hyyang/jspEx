<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Arrays"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체-request</title>
</head>
<body>
<%
	// 한글 깨짐 처리 -> web.xml의 설정파일에서 일괄적으로 설정
	// request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	// 체크박스는 여러 개가 선택될 수 있기 때문에 배열 형태로 받아서 처리해야 한다.
	String[] favo = request.getParameterValues("favo");
	// out.print(Arrays.toString(favo));	
	String intro = request.getParameter("intro");
%>
<ul>
	<li>아이디 : <%= id %></li>
	<li>성별 : <%= sex %></li>
	<li>관심사항 : <%= Arrays.toString(favo) %></li>	
	<!-- 줄바꿈처리 -->
	<li>자기소개 : <%= intro.replace("\r\n", "<br>") %> </li>	
</ul>
</body>
</html>