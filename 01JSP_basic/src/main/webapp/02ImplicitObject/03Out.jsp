<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체-out</title>
</head>
<body>
<!-- 
	out 객체
		웹 브라우저에 변수 등의 값을 출력할 때 사용
		스클립틀릿(%%) 내부에서 변수 등을 출력하기 위해 사용
 -->
 
<%
 	// 버퍼 내용 삭제하기
 	out.print("즐거운 목요일~!"); // 버퍼에 저장
 	out.clearBuffer(); // 버퍼를 비움 
 	
 	out.print("<h2>out 내장 객체</h2>");
 	
 	// getBufferSize() : 현재 페이지에 설정된 버퍼의 크기를 가져온다.(기본값 8kb(1kb=1024byte))
 	out.print("출력 버퍼의 크기: " + out.getBufferSize() + "<br>");
 	// getRemaining() : 사용하고 남은 버퍼의 크기를 출력한다.
 	out.print("남은 버퍼의 크기: " + out.getRemaining() + "<br>");
 	
 	out.flush(); // 버퍼에 담긴 내용을 화면에 출력
 	out.print("남은 버퍼의 크기: " + out.getRemaining() + "<br>");
 	
	// 다양한 타입을 출력할 수 있다.
 	out.print(1);
	out.print(false);
%>
</body>
</html>