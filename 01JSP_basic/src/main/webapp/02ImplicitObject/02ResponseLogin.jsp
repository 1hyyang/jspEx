<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체-response</title>
</head>
<body>
<% 
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pwd");
	
	// id!=null && id.equals("abc")
	if("abc".equals(id) && "123".equals(pw)){
		
		/*
		response 객체는 요청에 대한 응답을 웹 페이지로 보내주는 역할
			1. redirect (페이지 주소 바뀜)
				웹 서버가 웹 브라우저에게 다른 페이지로 이동하라고 응답하는 기능
				웹 브라우저로부터 새로운 요청을 받게 되므로 기존 요청 정보가 사라진다.
				[사용방법]
					response.sendRedirect("페이지주소");
		*/
		response.sendRedirect("02ResponseWelcome.jsp");
	} else{
		// response.sendRedirect("02ResponseMain.jsp?loginErr=Y");
		
		/*
			2. forward (페이지 주소 그대로, 정보만 전달)
				다른 JSP 페이지로 요청 처리(정보)를 전달
				반환하는 페이지에서 이전 요청에 대한 정보를 사용할 수 있다.
				[사용방법]
					request.getRequestDispatcher("페이지주소").forward(request, response);							
		*/
		// 사용자로부터 전달 받은 request 객체가 공유되므로 아이디를 출력할 수 있다. (redirect시 null 출력)
		RequestDispatcher rd = request.getRequestDispatcher("02ResponseMain.jsp?loginErr=Y");
		rd.forward(request, response);		
	}
%>
</body>
</html>