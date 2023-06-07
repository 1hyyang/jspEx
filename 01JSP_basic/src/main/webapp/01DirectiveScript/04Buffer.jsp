<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Error : JSP 버퍼 오버플로우 
	버퍼의 크기를 충분히 크게 지정하거나 autoFlush 속성을 true로 설정하여 해결한다. -->
<%@ page buffer="1kb" autoFlush="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buffer</title>
</head>
<body>
<!-- 
	버퍼
		응답 결과를 웹 브라우저로 즉시 전송하지 않고 출력할 내용을 버퍼에 저장해 두었다가 일정량이 차면 클라이언트로 전송한다.
		(CPU나 메모리에 비해 IO(입출력) 속도가 느리므로 응답 결과를 버퍼에 저장해 두었다가 전송한다.)
	 	buffer="none"으로 지정시 포워드, 에러 페이지 등의 기능을 사용하지 못한다.
	 	크기를 줄일 경우 JSP의 기능을 온전히 사용하지 못하므로 값을 변경하는 경우는 거의 없다.
	 	
	버퍼를 사용하는 까닭
		- 성능 향상
		- JSP 실행 도중 버퍼를 비우고 새로운 내용을 전송 가능
		- 버퍼가 다 차기 전에 응답 헤더를 변경 가능
	
	autoFlush
		true	: 버퍼가 차면 자동 전송
		false	: 버퍼가 차면 예외exception 발생으로 실행 중지
 -->
 
<%
	for(int i=0; i<100; i++){
		out.print("abcde12345");
	}
	out.print(out.getBufferSize());
	out.print(out.isAutoFlush());
%>
</body>
</html>