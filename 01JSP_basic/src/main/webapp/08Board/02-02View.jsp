<%@page import="common.JSFunction"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
<jsp:include page="00Link.jsp"/>
<h2>상세보기</h2>
<%
	BoardDao dao = new BoardDao();
	dao.updateVisitcount(request.getParameter("num"));
	
	Board board = dao.selectPost(request.getParameter("num"));
	if(board==null){
		JSFunction.alertBack("존재하지 않는 게시물입니다.", out);
		return;  // 아래의 코드를 더 이상 실행하지 않고 종료한다. 
				 // return문이 없으면 아래의 코드가 실행되고, 이때 board 객체가 null이므로 NullPointerException 발생
	}
%>
<table border="1" style="width: 90%">
	<tr>
		<td>번호</td>
		<td><%= board.getNum() %></td>
		<td>작성자</td>
		<td><%= board.getId() %></td>
	</tr>
	<tr>
		<td>작성일</td>
		<td><%= board.getPostdate() %></td>
		<td>조회수</td>
		<td><%= board.getVisitcount() %></td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3"><%= board.getTitle() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3"><%= board.getContent().replace("\r\n", "<br>") %></td>
	</tr>
	<tr style="text-align: center;">
		<td colspan="4">
			<input type="button" onclick="location.href='02-00Board.jsp'" value="목록으로">
			<%
				if(session.getAttribute("userid")!=null && board.getId().equals(session.getAttribute("userid"))){
			%>
			<button type="button" onclick="location.href='02-03Edit.jsp?num=<%= board.getNum() %>'">수정</button>
			<button type="button" onclick="deletePost()">삭제</button>			
			<%		
				}
			%>
		</td>
	</tr>
</table>
<script>
	function deletePost(){
		if(confirm("삭제하시겠습니까?")){
			location.href="02-04DeleteProcess.jsp?num=<%= board.getNum() %>"
		}
	}
</script>		
</body>
</html>