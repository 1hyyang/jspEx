<!-- errorPage : 오류 발생시 보여줄 페이지를 지정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage = "03-02ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error page 지정</title>
</head>
<body>
<%	
	// 사용자의 요청을 담고 있는 객체
	int age = Integer.parseInt(request.getParameter("age"));	
	out.print("당신의 나이는 " + age + "세 입니다.");	
%>
</body>
</html>