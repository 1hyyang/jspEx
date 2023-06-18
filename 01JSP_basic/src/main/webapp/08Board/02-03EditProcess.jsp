<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
</head>
<body>
<!-- 사용자가 로그아웃을 하지 않았더라도 일정 시간이 경과되면 세션이 제거되므로 오류가 발생할 수 있다. -->
<jsp:include page="02-01IsLogin.jsp"/>
<%
	// request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	Board board = new Board(num, title, content, "", "", 0);
	
	BoardDao dao = new BoardDao();
	if(dao.updatePost(board)>0){
		JSFunction.alertLocation("게시물이 등록되었습니다.", "02-02View.jsp?num=" + board.getNum(), out);
	} else{
		JSFunction.alertBack("게시물 등록 중 오류가 발생했습니다.", out);
	};
%>
</body>
</html>