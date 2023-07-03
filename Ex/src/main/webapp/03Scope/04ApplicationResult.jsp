<%@page import="java.util.Set"%>
<%@page import="dto.Person"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체의 영역-application</title>
</head>
<body>
<%
	// 브라우저를 닫았다가 다시 열어도 값이 유지된다.
	// 서버를 종료 후 다시 실행시 제거되는 것을 확인할 수 있다.		
	Map<String, Person> maps = (Map<String, Person>)application.getAttribute("maps");
	// keySet() : 키의 집합을 Set 타입으로 반환한다.
	// maps에 담긴 데이터의 키값을 받아온다.
	Set<String> keys = maps.keySet();		
	for(String key:keys){
		// get(key) : 키값을 이용하여 value값을 반환한다.
		Person p = maps.get(key);
		out.print(p.getName() + "/" + p.getAge() + "<br>");
	}
%>
</body>
</html>