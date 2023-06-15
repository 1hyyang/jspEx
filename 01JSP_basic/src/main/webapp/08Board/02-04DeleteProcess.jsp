<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제하기</title>
</head>
<body>
<%
	String num = request.getParameter("num");
	BoardDao dao = new BoardDao();
	if(dao.deletePost(num)>0){
		JSFunction.alertLocation("삭제되었습니다.", "02-00Board.jsp", out);
	} else{
		JSFunction.alertBack("삭제 중 오류가 발생했습니다.", out);
	};
%>
</body>
</html>