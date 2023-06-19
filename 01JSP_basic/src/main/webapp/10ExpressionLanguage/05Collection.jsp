<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Person"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컬렉션</title>
</head>
<body>
<%
	// 리스트 생성 (Object 타입 -> 어떤 타입이든지 저장 가능)
	List<Object> list = new ArrayList<Object>();
	list.add("청해진");
	list.add(new Person("콩지", 20));
	
	// 페이지 영역에 list 객체 저장
	pageContext.setAttribute("list", list);
%>

<h2>List 컬렉션</h2>
<ul>
	<!-- 영역을 지정하지 않았지만 페이지 영역에 저장된 list의 값이 출력 -->
	<!-- List는 index로 접근 -->
	<li>0번째 요소: ${ list[0] }</li>
	<li>1번째 요소: 
		<p>객체의 주소값: ${ list[1] }</p>
		<p>이름: ${ list[1].name }</p>
		<p>나이: ${ list[1].age }</p>
	</li>
</ul>

<h2>Map 컬렉션</h2>
<%
	Map<String, String> map = new HashMap<String, String>();
	// key, value
	map.put("한글", "훈민정음");
	map.put("Eng", "English");
	
	pageContext.setAttribute("map", map);
%>
<ul>
	<!-- Map은 key로 접근 -->
	<li>한글:
		<p>${ map['한글'] }</p> <!-- 한글은 .으로 접근 불가 -->
		<p><%= map.get("한글") %></p>
	</li> 	
	<li>Eng: 
		<p>${ map.Eng }</p>
		<p><%= map.get("Eng") %></p>
	</li>
</ul>
</body>
</html>