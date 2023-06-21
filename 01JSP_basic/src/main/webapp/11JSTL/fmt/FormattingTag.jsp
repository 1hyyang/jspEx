<%@page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formatting tag</title>
</head>
<body>
<!-- 
	formatNumber
		var 	: 변수명 (변수명을 지정하지 않으면 바로 출력)
    	value 	: 출력할 숫자
    	pattern : 숫자 패턴
    	scope 	: 영역    	
    	type 	: 출력 양식을 설정
    		- percent 	: 퍼센트
    		- currency 	: 통화
    		- number 	: 기본값, 일반 숫자
       	groupingUsed : 구분 기호 사용 여부
 -->
 
<h2>숫자 포맷 설정</h2>
<c:set var="num" value="12345"/>
(기본) 콤마 출력: <fmt:formatNumber value="${ num }"/><br>
콤마 출력 X: <fmt:formatNumber value="${ num }" groupingUsed="false"/><br>

<fmt:formatNumber value="${ num }" var="saveVar" type="currency"/><br>
(변수에 저장된 값) 통화 출력: ${ saveVar }<br><br>

퍼센트 출력: <fmt:formatNumber value="0.03" type="percent"/>

<h2>패턴을 지정하여 숫자를 활용</h2>
<c:set var="num" value="12345.1234"/>
0, # 자릿수를 의미<br>
0 표현: 자리에 수가 없으면 0으로 표시 - 자릿수를 맞추어 출력하고 싶을 때<br>
# 표현: 자리에 수가 없으면 공란으로 표시<br><br>

(기본) 소수 세 자리 수까지 출력: <fmt:formatNumber value="${ num }"/><br><br>

<fmt:formatNumber value="${ num }" pattern="0,000.0"/><br>
<fmt:formatNumber value="${ num }" pattern="000000.00"/><br>
<fmt:formatNumber value="${ num }" pattern="#,###.#####"/><br>
<fmt:formatNumber value="${ num }" pattern="###,###.000000"/><br>

<fmt:parseNumber value="${ num }" integerOnly="true" var="saveVar"/><br>
(변수에 저장된 값) 정수 부분만 출력: ${ saveVar }

<h2>날짜 포맷</h2>
<c:set var="today" value="<%= new Date() %>"/>
(기본) 날짜/시간 모두 출력: ${ today }<br><br>

<fmt:formatDate value="${ today }" type="date" dateStyle="full"/><br>
<fmt:formatDate value="${ today }" type="date" dateStyle="short"/><br>
<fmt:formatDate value="${ today }" type="date" dateStyle="long"/><br>
<fmt:formatDate value="${ today }" type="date" dateStyle="default"/><br>
<fmt:formatDate value="${ today }" type="date" dateStyle="medium"/><br><br>

<fmt:formatDate value="${ today }" type="time" timeStyle="full"/><br>
<fmt:formatDate value="${ today }" type="time" timeStyle="short"/><br>
<fmt:formatDate value="${ today }" type="time" timeStyle="long"/><br>
<fmt:formatDate value="${ today }" type="time" timeStyle="default"/><br>
<fmt:formatDate value="${ today }" type="time" timeStyle="medium"/>

<h3>날짜/시간 표시</h3>
<fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="default"/>

<h3>패턴 지정 후 출력</h3>
<fmt:formatDate value="${ today }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/>

<h3>타임존 설정</h3>
<fmt:timeZone value="GMT">
	<fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/>
</fmt:timeZone><br>
<fmt:timeZone value="America/Chicago">
	<fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/>
</fmt:timeZone>

<h2>로케일 설정</h2>
<c:set var="today" value="<%= new java.util.Date() %>"/>

한글로 설정: <fmt:setLocale value="ko_KR"/>
<fmt:formatNumber value="10000" type="currency"/>
<fmt:formatDate value="${ today }"/><br>

일어로 설정: <fmt:setLocale value="ja_JP"/>
<fmt:formatNumber value="10000" type="currency"/>
<fmt:formatDate value="${ today }"/><br>

영어로 설정: <fmt:setLocale value="en_US"/>
<fmt:formatNumber value="10000" type="currency"/>
<fmt:formatDate value="${ today }"/><br>
</body>
</html>