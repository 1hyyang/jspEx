<%@page import="common.JSFunction"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
<style>
	* {box-sizing: border-box;}
</style>
</head>
<body>
<jsp:include page="00Link.jsp"/>
<h2>수정하기</h2>
<%
	BoardDao dao = new BoardDao();	
	Board board = dao.selectPost(request.getParameter("num"));
	if(board==null){
		JSFunction.alertBack("게시글이 존재하지 않습니다.", out);
	}
%>
<form name="editform" method="post" action="02-03EditProcess.jsp?num=<%= board.getNum() %>"
	onsubmit="return validateForm(this);">
	<table border="1" style="width: 90%;">	
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" value="<%= board.getTitle() %>" style="width: 100%;"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" style="width: 100%; height: 200px;"><%= board.getContent() %></textarea></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="submit" value="작성완료">
				<input type="reset" value="다시입력">	
				<input type="button" onclick="location.href='02-00Board.jsp'" value="목록으로" >			
			</td>
		</tr>	
	</table>
</form>
</body>
</html>