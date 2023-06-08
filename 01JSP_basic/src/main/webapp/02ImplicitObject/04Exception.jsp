<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exception</title>
</head>
<body>
<%
	// response 내장 객체로부터 에러 코드를 확인
	int status = response.getStatus();
	// 에러 코드에 맞게 적절한 메시지를 출력
	if(status==404){
		out.print("ERROR CODE: 404");
		out.print("<br>파일 경로를 확인하세요.");
	} else if(status==405){
		out.print("ERROR CODE: 405");
		out.print("<br>요청 방식(method)을 확인하세요.");
	} else if(status==500){
		out.print("ERROR CODE: 500");
		/*
			ERROR CODE 500
				서버가 예상하지 못한 에러 발생
					- 서버 통신의 Timeout 시간 지연 오류
					- 서버 트래픽 과부하
					- 서버 언어의 구문 에러(스크립트 문법 오류) 등
		*/
		out.print("<br>관리자에게 문의하세요.");
	}
%>
</body>
</html>