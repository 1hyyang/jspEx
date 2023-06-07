<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 지시어</title>
</head>
<body>
<!-- 외부 파일 불러오기 
	반복되는 부분을 별도의 파일에 작성해두고 필요한 페이지에서 include 지시어로 포함 -->
<%@ include file="02-02IncludeHeader.jsp" %>
오늘 날짜 : <%= today %>
<br> 내일 날짜 : <%= tomorrow %>
</body>
</html>