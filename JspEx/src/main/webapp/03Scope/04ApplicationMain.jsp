<%@page import="java.util.Map"%>
<%@page import="dto.Person"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체의 영역-application</title>
</head>
<body>
<!-- 
	application 영역
		웹 서버가 실행시 생성되는 영역
		클라이언트가 요청하는 모든 페이지가 application 영역을 공유
		웹 서버를 종료할 때 소멸
 -->
 
<h2>application 영역의 공유</h2>
<%
	//Map은 key, value가 쌍으로 저장되는 컬렉션 타입
	Map<String, Person> maps = new HashMap<>();
	maps.put("actor1", new Person("콩지", 20));
	maps.put("actor2", new Person("츠르후", 18));
	
	application.setAttribute("maps", maps);
%>
application 영역에 속성이 저장되었습니다.
</body>
</html>