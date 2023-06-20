<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>변수 선언(set)</title>
</head>
<body>
<!-- 
	JSTL(JSP Standard Tag Library)
		JSP의 표준 태그 라이브러리를 이용하면 스크립틀릿을 사용하지 않고 태그를 사용하여 제어문, 반복문 등을 사용할 수 있다.
		기본 태그가 아닌 확장 태그이므로 사용하기 위해서는 별도의 라이브러리가 필요하다.
		메이븐 리파지토리로 접근하여 jstl-1.2.jar 파일을 다운로드 받고 lib 폴더에 추가한다.
		
	JSTL 종류
		Core 태그			: 변수 선언, 조건문/반복문, URL 처리
		접두어			: c
		Formatting 태그 	: 숫자, 날짜, 시간 포맷 지정
		접두어			: fmt
	
	JSTL 사용 방법
		1. 라이브러리 추가
		2. taglib 지시어 추가
 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 
	Core태그
		변수 선언, 조건문, 반복문 등을 대체하는 태그를 제공
	
		set 		: 변수 선언 (setAttribute())
		remove 		: 변수 제거 (removeAttribute())
		if			: 단일 조건문 처리 (else문 없음)
		choose 		: 다중 조건문 처리 (when ~ otherwise 태그 이용)
		forEach 	: 반복문 처리
		forTokens	: 구분자로 분리된 토큰을 처리 
		import 		: 외부 파일 삽입
		redirect	: 지정한 경로로 이동 (sendRedirect())
		url 		: 경로를 설정
		out			: 내용을 출력
		catch		: 예외 처리
 -->
 
<!-- 
	1. 변수 선언(set)
		var		: 변수명
		value	: 값
		scope 	: 저장 영역
 -->
 
<h2>EL을 이용하여 변수 출력하기</h2>
<c:set var="directVar" value="100"/>
<c:set var="elVar" value="${ directVar mod 5 }"/>
<c:set var="expVar" value="<%= new Date() %>"/>
<c:set var="betweenVar">변수값</c:set>
<ul>
	<li>${ pageScope.directVar }</li>
	<li>${ elVar }</li>
	<li>${ expVar }</li>
	<li>${ betweenVar }</li>
</ul>

<h2>자바빈즈 생성-생성자 사용</h2>
<c:set var="personVar" value='<%= new Person("콩지", 20) %>' scope="request"/>
<ul>
	<li>이름: ${ personVar.name }</li>
	<li>나이: ${ requestScope.personVar.age }</li>
</ul>

<!-- 
	자바빈즈 생성 후 값을 변경하기
		target	 : 자바빈즈 변수명
		property : 자바빈즈 속성명 (멤버변수명)
		value	 : 값 지정
 --> 
 
<h2>자바빈즈 생성 후 값을 변경하기-target, property 사용</h2>
<c:set target="${ personVar }" property="name" value="츠르후"/>
<c:set target="${ personVar }" property="age" value="18"/>
<ul>
	<li>변경 후 이름: ${ personVar.name }</li>
	<li>변경 후 나이: ${ requestScope.personVar.age }</li>
</ul>

<h2>List 컬렉션 이용하기</h2>
<%
	ArrayList<Person> list = new ArrayList<Person>();
	list.add(new Person("콩지", 20));
	list.add(new Person("츠르후", 18));
%>
<c:set var="personList" value="<%= list %>" scope="request"/>
<ul>
	<li>이름: ${ personList[0].name }</li>
	<li>나이: ${ requestScope.personList[0].age }</li>
</ul>
<ul>
	<li>이름: ${ personList[1].name }</li>
	<li>나이: ${ requestScope.personList[1].age }</li>
</ul>

<h2>Map 컬렉션 이용하기</h2>
<%
	Map<String, Person> map = new HashMap<String, Person>();
	map.put("person1", new Person("콩지", 20));
	map.put("person2", new Person("츠르후", 18));
%>
<c:set var="map" value="<%= map %>" scope="request"/>
<ul>
	<li>이름: ${ map.person1.name }</li>
	<li>나이: ${ requestScope.map.person1.age }</li>
</ul>
<ul>
	<li>이름: ${ map.person2.name }</li>
	<li>나이: ${ requestScope.map.person2.age }</li>
</ul>
</body>
</html>