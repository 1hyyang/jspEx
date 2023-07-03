<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL)</title>
</head>
<body>
<h2>각 영역에 저장된 속성 읽기</h2>
<ul>
	<li>${ pageScope.scopeValue }</li>
	<li>${ requestScope.scopeValue }</li>
	<li>${ sessionScope.scopeValue }</li>
	<li>${ applicationScope.scopeValue }</li>
</ul>

<h2>영역 지정 없이 속성 읽기</h2>
<ul>
	<li>${ scopeValue }</li>
</ul>
</body>
</html>