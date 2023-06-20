<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<c:set var="number" value="100"/> 
<c:if test="${ number mod 2 eq 0 }" var="result">
	<!-- 조건이 참인 경우 실행 -->
	${ number }은 짝수입니다.
</c:if>
<!-- else 구문 흉내내기 -->
<c:if test="${ not result }">
	${ number }은 홀수입니다.
</c:if>
result: ${ result }

<h2>문자열 비교하기</h2>
<c:set var="str" value="JSP"/>
<c:if test="${ str eq 'JAVA' }" var="result2">
	문자열은 JAVA입니다.
</c:if>
<c:if test="${ not result2 }">
	JAVA가 아닙니다.
</c:if>
result2: ${ result2 }

<h2>조건식 주의사항</h2>
<c:if test="100" var="result3">
	EL이 아닌 일반값이 오면 false를 반환
	하지만 일반값으로 true가 사용되는 것은 예외
</c:if>
result3: ${ result3 }<br>

<c:if test="tRuE" var="result4">
	문자열 "tRuE"는 대소문자에 상관없이 true를 반환
</c:if>
result4: ${ result4 }<br>

<c:if test=" ${ true } " var="result5">
	EL에 공백이 삽입되면 false를 반환
</c:if>
result5: ${ result5 }<br>
</body>
</html>