<!-- isErrorPage="true" 지정 : 해당 페이지가 에러를 처리할지 여부를 지정-->
<!-- trimDirectiveWhitespaces="true" 지정 : page 지시어로 생성된 불필요한 공백을 제거 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"
    trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error page</title>
</head>
<body>
<h1>서비스 중 일시적인 오류가 발생하였습니다.</h1>
<p>
	오류코드	: E404<br>
	관리자에게 문의하세요.<br>
	오류명	: <%= exception.getClass().getName() %><br>
	오류메시지	: <%= exception.getMessage() %>
</p>	
</body>
</html>