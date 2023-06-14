<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="util.CookieManager"%>
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
	
	// 아이디저장 체크박스
	String saveYN = request.getParameter("savecheck");
	// 체크박스에 체크가 되어 있다면
	if("Y".equals(saveYN)){
		// 아이디 값을 저장한 쿠키를 생성하고 응답 객체에 추가한다.
		/*
		Cookie cookie = new Cookie("userid", userid);
		cookie.setMaxAge(60*60);
		response.addCookie(cookie);
		*/
		CookieManager.makeCookie(response, "userid", userid, 60*60);
	}
	
	if(member!=null && !"".equals(member.getName())){
		response.sendRedirect("01-01Login.jsp?name=" + userid);
	} else {
		out.print("로그인 실패");
	}
%>
</body>
</html>