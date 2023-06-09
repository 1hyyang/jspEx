<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체-request</title>
</head>
<body>
<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
<!-- 메소드를 지정하지 않은 경우는 모두 get 방식으로 호출된다.
	(아무 설정도 하지 않으면 기본이 get 방식) -->

<!-- 404 : 페이지를 찾을 수 없음 
	서버에 파일이 없는 경우 또는 경로가 일치하지 않는 경우 
	URL 경로를 확인해 보아야 한다. 
	URL로 호출 	  - get 방식으로 호출 
	http://	 	  - 프로토콜 : 통신 규약
	www.naver.com - 도메인 : ip, port를 통해 웹 서버를 찾아간다. 
	경로 			  - 파일 정보, 매핑 정보 -->
<a href="01RequestWebInfo.jsp?eng=hello&kor=안녕">GET 방식 요청</a>

<!-- form : 서버에 페이지를 요청 -->
<form action="01RequestWebInfo.jsp" method="post">
	영어: <input type="text" name="eng" value="bye"><br>
	한글: <input type="text" name="kor" value="잘가"><br>
	<input type="submit" value="post전송">
</form>

<h2>2. 클라이언트의 요청 매개 변수 읽기</h2>
<form action="01RequestParameter.jsp" method="post">
	아이디: <input type="text" name="id" value=""><br>
	성별:
	<input type="radio" name="sex" value="man">남자
	<input type="radio" name="sex" value="woman" checked="checked">여자<br>
	관심사항:
	<input type="checkbox" name="favo" value="eco">경제
	<input type="checkbox" name="favo" value="pol" checked="checked">정치
	<input type="checkbox" name="favo" value="ent">연예<br>
	자기소개:
	<textarea name="intro" cols="30" rows="4"></textarea><br>
	<input type="submit" value="전송하기">
</form>

<h2>3. HTTP 요청 헤더 정보 읽기</h2>
<a href="01RequestHeader.jsp">요청 헤더 정보 읽기</a>
</body>
</html>