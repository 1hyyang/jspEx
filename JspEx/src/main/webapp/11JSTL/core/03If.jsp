<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단일 조건문(if)</title>
</head>
<body>
<!-- 
	test	: if문에서 사용할 조건 지정 (표현 언어 사용 가능)
	var		: 조건의 결과를 저장할 변수명
	scope	: 변수가 저장될 영역
 --> 
 
<h2>JSTL의 if 태그로 짝수/홀수 판별하기</h2>
<c:set var="num" value="100"/> 
<c:if test="${ num mod 2 eq 0 }" var="res1">
	<!-- 조건이 참인 경우 실행 -->
	${ num }은 짝수입니다.
</c:if>
<!-- else 구문 흉내내기 -->
<c:if test="${ not res1 }">
	${ num }은 홀수입니다.
</c:if>
res1: ${ res1 }

<h2>문자열 비교하기</h2>
<c:set var="str" value="JSP"/>
<c:if test="${ str eq 'JAVA' }" var="res2">
	문자열은 JAVA입니다.
</c:if>
<c:if test="${ not res2 }">
	JAVA가 아닙니다.
</c:if>
res2: ${ res2 }

<h2>조건식 주의사항</h2>
<c:if test="100" var="res3">
	EL이 아닌 일반값이 오면 false를 반환
	하지만 일반값으로 true가 사용되는 것은 예외
</c:if>
res3: ${ res3 }<br>

<c:if test="tRuE" var="res4">
	문자열 "tRuE"는 대소문자에 상관없이 true를 반환
</c:if>
res4: ${ res4 }<br>

<c:if test=" ${ true } " var="res5">
	EL에 공백이 삽입되면 false를 반환
</c:if>
res5: ${ res5 }<br>
</body>
</html>