<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<%
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	MemberDao dao = new MemberDao();
	Member member = dao.login(userid, userpw);	
	if(member!=null){
		// 로그인 성공 -> 세션에 userid와 member 객체를 저장
		session.setAttribute("userid", userid);
		session.setAttribute("member", member);	
		// 페이지 이동 - response 객체의 redirect 방식으로
		response.sendRedirect("01LoginForm.jsp");
	} else{
		// 로그인 실패 -> 오류 메시지 저장, LoginForm.jsp로 이동
		request.setAttribute("LoginErrMsg", "아이디/비밀번호가 일치하지 않습니다.");
		// 페이지 이동 - request 객체의 forward 방식으로
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
%>
</body>
</html>