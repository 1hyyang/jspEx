<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>Session</title></head>
<body>
<jsp:include page="01-00Link.jsp" />
<h2>로그인 페이지</h2>
<span style="color: red; font-size: 1.2em;"> 
</span>
<%= 
	// 로그인 실패
	request.getAttribute("LoginErrMsg")==null?"":request.getAttribute("LoginErrMsg")
%>
<%
	// 로그인 성공
 	if(session.getAttribute("member")!=null){
		Member member = (Member)session.getAttribute("member");
%>
<%= member.getName() %>님 환영합니다.
<%
	} else{
%>
<form action="01-01LoginProcess.jsp" method="post" name="loginFrm"
    onsubmit="return validateForm(this);">
    아이디 : <input type="text" name="userid" required="required"/><br />
    패스워드 : <input type="password" name="userpw" required="required"/><br />
    <input type="submit" value="로그인" />
</form>
<%
	}
%>  
</body>
</html>