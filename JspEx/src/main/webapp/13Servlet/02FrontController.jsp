<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하나의 매핑으로 여러 가지 요청 처리하기</title>
</head>
<body>
<h2>하나의 매핑으로 여러 가지 요청 처리하기</h2>
${ resultValue }
<ul>
	<li>URI: ${ uri }</li>
	<li>요청명: ${ commandStr }</li>
</ul>
<ul>
	<li><a href="../13Servlet/regist.one">회원가입</a></li>
	<li><a href="../13Servlet/login.one">로그인</a></li>
	<li><a href="../13Servlet/freeboard.one">자유게시판</a></li>
</ul>
</body>
</html>