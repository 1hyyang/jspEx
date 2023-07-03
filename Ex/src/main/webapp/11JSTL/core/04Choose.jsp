<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다중 조건문(choose)</title>
</head>
<body>
<h2>choose 태그로 짝수/홀수 판별하기</h2>
<c:set var="num" value="100"/>
<c:choose>
	<c:when test="${ num mod 2 eq 0 }">
		${ num }은 짝수입니다.
	</c:when>
	<c:otherwise>
		${ num }은 홀수입니다.
	</c:otherwise>
</c:choose>

<h2>국,영,수 점수를 입력 받아 평균을 내어 학점 출력하기</h2>
>=90 : A, >=80 : B, >=70 : C, >=60 : D, <60 : F
<!-- 과목별 점수 입력 받기 -->
<form>
	<ul>
		<li>국어점수: <input type="text" name="kor"></li>
		<li>영어점수: <input type="text" name="eng"></li>
		<li>수학점수: <input type="text" name="math"></li>
		<button type="submit">학점구하기</button>
	</ul>
</form>

<!-- 모든 과목의 점수가 입력되었는지 확인 -->
<c:if test="${ not (empty param.kor or empty param.eng or empty param.math) }">
	<!-- 과목별 점수 출력 -->
	<ul>
		<li>국어점수: ${ param.kor }</li>
		<li>영어점수: ${ param.eng }</li>	
		<li>수학점수: ${ param.math }</li>
	</ul>
	
	<!-- 평균 점수 계산 -->
	<c:set var="avg" value="${ (param.kor+param.eng+param.math)/3 }"/>
	평균점수는 ${ avg } 입니다.
	
	<!-- 학점 출력 -->
	학점은 
	<c:choose>
		<c:when test="${ avg >= 90 }">A</c:when>
		<c:when test="${ avg >= 80 }">B</c:when>
		<c:when test="${ avg ge 70 }">C</c:when>
		<c:when test="${ avg ge 60 }">D</c:when>
		<c:otherwise>F</c:otherwise>
	</c:choose>
	입니다.
</c:if>
</body>
</html>