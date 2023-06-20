<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>변수 제거(remove)</title>
</head>
<body>
<!-- 변수 선언 -->
<c:set var="scopeVar" value="pageValue"/>
<c:set var="scopeVar" value="requestValue" scope="request"/>
<c:set var="scopeVar" value="sessionValue" scope="session"/>
<c:set var="scopeVar" value="applicationValue" scope="application"/>

<h2>변수값 출력하기</h2>
<ul>
	<li>${ scopeVar }</li>
	<li>${ requestScope.scopeVar }</li>
	<li>${ sessionScope.scopeVar }</li>
	<li>${ applicationScope.scopeVar }</li>
</ul>

<h2>session 영역에서 삭제하기</h2>
<c:remove var="scopeVar" scope="session"/>
<ul>
	<li>${ scopeVar }</li>
	<li>${ requestScope.scopeVar }</li>
	<li>${ sessionScope.scopeVar }</li>
	<li>${ applicationScope.scopeVar }</li>
</ul>

<h2>영역을 지정하지 않고 삭제하기</h2>
<!-- 영역을 지정하지 않으면 모든 영역에서 변수를 삭제한다. -->
<c:remove var="scopeVar"/>
<ul>
	<li>${ scopeVar }</li>
	<li>${ requestScope.scopeVar }</li>
	<li>${ sessionScope.scopeVar }</li>
	<li>${ applicationScope.scopeVar }</li>
</ul>
</body>
</html>