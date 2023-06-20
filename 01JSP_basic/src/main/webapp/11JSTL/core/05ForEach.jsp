<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Person"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반복문(forEach)</title>
</head>
<body>
<h2>일반 for문 형태의 forEach문</h2>
<!-- 
	forEach 태그를 활용한 반복문
		begin 	: 시작값
		end		: 종료값
		step	: 증가값
		var		: 변수
 -->
<c:forEach begin="2" end="10" step="2" var="i">
	${ i }
</c:forEach>

<h2>varStatus 속성 살펴보기</h2>
<!-- 
	varStatus : 루프의 현재 상태를 알려 주는 변수의 이름을 지정
		current	: var에 지정한 현재 루프의 변수값
		index	: var에 지정한 현재 루프의 인덱스값
		count	: 실제 반복 횟수 (1부터 시작)
		first	: 루프의 처음일 때 true
		last	: 루프의 마지막일 때 ture
 -->
<table border="1">
<c:forEach begin="3" end="5" var="i" varStatus="loop">
	<tr>
		<td>i: ${ i }</td>
		<td>current: ${ loop.current }</td>
		<td>index: ${ loop.index }</td>
		<td>count: ${ loop.count }</td>
		<td>first: ${ loop.first }</td>
		<td>last: ${ loop.last }</td>
	</tr>	 
</c:forEach>
</table>

<h2>1~100까지 정수 중 홀수의 합</h2>
<c:forEach begin="1" end="100" var="num">
	<c:if test="${ num mod 2 ne 0 }">
		${ num }
		<!-- 변수를 선언하고 초기화하지 않으면 0으로 설정된다. -->		
		<c:set var="sum" value="${ sum+num }"/>	<!-- sum+=num -->
	</c:if>
</c:forEach>
<br><u>sum:</u> ${ sum }

<h2>향상된 for문 형태의 forEach 태그</h2>
<%
	String[] rgb = {"red", "green", "blue", "black"};
%>
<table border="1">
<!-- 
	items 속성에 배열을 지정하고 변수 이름은 "color"로 입력
	배열을 처음부터 끝까지 돌면서 반복문을 수행
 -->
<c:forEach items="<%= rgb %>" var="color" varStatus="loop">
	<tr>
		<td><span style="color: ${ color }">${ color }</span></td>
		<td>current: ${ loop.current }</td>
		<td>index: ${ loop.index }</td>
		<td>count: ${ loop.count }</td>
		<td>first: ${ loop.first }</td>
		<td>last: ${ loop.last }</td>
	<tr>
</c:forEach>
</table>

<h2>List 컬렉션 사용하기</h2>
<%
	List<Person> list = new ArrayList<Person>();
	list.add(new Person("콩지", 20));
	list.add(new Person("츠르후", 18));
%>
<c:set var="list" value="<%= list %>"/>
<!-- 
	items  	: 반복을 위한 객체를 지정
	var		: 변수명
 -->
<ul>
<c:forEach items="${ list }" var="person">
	<li>이름: ${ person.name }, 나이: ${ person.age }</li>
</c:forEach>
</ul>

<h2>Map 컬렉션 사용하기</h2>
<%
	Map<String, Person> map = new HashMap<String, Person>();
	map.put("person1", new Person("찡다", 23));
	map.put("person2", new Person("구구맨", 20));
%>
<c:set var="map" value="<%= map %>"/>
<ul>
<c:forEach items="${ map }" var="map">
	<li>key: ${ map.key }<br>
		value: ${ map.value }<br>
		이름: ${ map.value.name }, 나이: ${ map.value.age }</li>	
</c:forEach>
</ul>

<h2>forTokens 태그 사용</h2>
<%
	String rgbStr = "red, green, blue, black";
%>
<!-- 
	Token	: 문법적으로 의미 있는 최소 단위
			  구분자를 기준으로 문자열을 나눠 토큰의 개수만큼 반복
	item	: 문자열 (문자열만 사용 가능)
	delims	: 구분자
	var		: 변수명
 -->
<c:forTokens items="<%= rgbStr %>" delims="," var="color">
	<span style="color: ${ color }">${ color }
</c:forTokens>
</body>
</html>