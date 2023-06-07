<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error trycatch</title>
</head>
<body>
<%	
	try{
		// 사용자의 요청을 담고 있는 객체
		int age = Integer.parseInt(request.getParameter("age"));
		
		out.print("당신의 나이는 " + age + "세 입니다.");
	} catch(Exception e){
		// out.print("오류메시지: " + e.getMessage());
%>
<h1>오류가 발생하였습니다.</h1>
<p>관리자에게 문의하세요.</p>
오류 메시지: <%= e.getMessage() %>
<%	
	}		
%>
</body>
</html>