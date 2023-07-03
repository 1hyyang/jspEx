<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDaoNew"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
<%@include file="../08Board/02-01IsLogin.jsp" %>
<%	
	//request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");	
	Board board = new Board(num, title, content, "", "", 0);
	
	BoardDaoNew dao = new BoardDaoNew();
	if(dao.updatePost(board)>0){
		JSFunction.alertLocation("게시물이 등록되었습니다.", "View.jsp?num=" + board.getNum(), out);
	} else{
		JSFunction.alertBack("게시물 등록 중 오류가 발생했습니다.", out);
	};	
%>
</body>
</html>