<%@page import="common.JSFunction"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDaoNew"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
<%@include file="../08Board/00Link.jsp" %>
<h2>회원제 게시판 - 수정하기(Edit)</h2>
<%
	BoardDaoNew dao = new BoardDaoNew();
	Board board = dao.selectPost(request.getParameter("num"));
	if(board==null){
		JSFunction.alertBack("게시글이 존재하지 않습니다.", out);
		return;
	}
%>
<form action="EditProcess.jsp?num=<%= board.getNum() %>" method="post">
	<table border="1" style="width: 90%">
	    <tr>
	        <td>제목</td>
	        <td>
	            <input type="text" name="title" style="width: 90%;" value="<%= board.getTitle() %>"/> 
	        </td>
	    </tr>
	    <tr>
	        <td>내용</td>
	        <td>
	            <textarea name="content" style="width: 90%; height: 100px;"><%= board.getContent().replace("<br>", "\r\n") %></textarea>
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	            <button type="submit">작성완료</button>
	            <button type="reset">다시입력</button>
	            <button type="button" onclick="location.href='List.jsp'">목록으로</button>
	        </td>
	    </tr>
	</table>
</form>
</body>
</html>