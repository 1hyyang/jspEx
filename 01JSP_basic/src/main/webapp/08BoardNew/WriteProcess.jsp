<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDaoNew"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판 - 글쓰기(Write)</title>
</head>
<body>
<%@include file="../08Board/02-01IsLogin.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = session.getAttribute("userid").toString();
	
	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	board.setId(id);
	
	BoardDaoNew dao = new BoardDaoNew();
	if(dao.insertPost(board)>0){
		JSFunction.alertLocation("게시물을 등록하였습니다.", "View.jsp?num=" + dao.insertPostNum(id), out);
	} else{
		JSFunction.alertBack("게시물 등록 중 오류가 발생하였습니다.", out);
	}
%>
</body>
</html>