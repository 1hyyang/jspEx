<%@page import="common.JSFunction"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDaoNew"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판 - 삭제하기(Delete)</title>
</head>
<body>
<%
	String num = request.getParameter("num");
	Board board = new Board();
	BoardDaoNew dao = new BoardDaoNew();
	if(dao.deletePost(num)>0){
		JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
	} else{
		JSFunction.alertBack("삭제 중 오류가 발생하였습니다.", out);
	};
%>
</body>
</html>