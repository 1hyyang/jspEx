<%@page import="java.util.List"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<jsp:include page="01-00Link.jsp"/>
<h2>목록보기</h2>
<%
	BoardDao dao = new BoardDao();
	List<Board> boardlist = dao.getList();
	
	// 총 건수 출력
	int totalcount = dao.getTotalCount();
%>
총 건수: <%= totalcount %>

<%
	String searchfield = request.getParameter("searchfield");
	String searchword = request.getParameter("searchword");
%>
<!-- 검색 -->
<form method="get">
	<table border="1" width="90%">
		<tr>
			<td align="center">
				<select name="searchfield">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="searchword" value="<%= searchword==null?"":searchword %>">
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
</form>

<!-- 게시물 -->
<table border="1" width="90%">
	<tr> 
		<th>번호</th> 
		<th>제목</th> 
		<th>작성자</th> 
		<th>작성일</th> 
		<th>조회수</th> 
	</tr>
<%
	if(boardlist.isEmpty()){
%>
	<tr>
		<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
	</tr>
<%		
	} else{
		for(Board board:boardlist) {		
%>
	<tr> 
		<td><%= board.getNum() %></td> 
		<td><%= board.getTitle() %></td> 
		<td><%= board.getId() %></td> 
		<td><%= board.getPostdate() %></td> 
		<td><%= board.getVisitcount() %></td>
	</tr>
<%		
		}
	}
%>

<!-- 글쓰기 -->
</table>
<form method="get">
	<table border="1" width="90%">
		<tr>
			<td align="right">
				<input type="submit" value="글쓰기">
			</td>
		</tr>
	</table>
</form>
</body>
</html>