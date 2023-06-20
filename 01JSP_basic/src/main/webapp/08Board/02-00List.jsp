<%@page import="dto.Criteria"%>
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
<jsp:include page="/08Board/00Link.jsp"/>
<h2>목록보기</h2>
<%
	String searchfield = request.getParameter("searchfield");
	String searchword = request.getParameter("searchword");
	String pageno = request.getParameter("pageno");	
	Criteria criteria = new Criteria(searchfield, searchword, pageno);
	
	BoardDao dao = new BoardDao();
	List<Board> boardlist = dao.getListPage(criteria);
	
	int totalcount = dao.getTotalcount(criteria);
%>
총 건수: <%= totalcount %>

<!-- 검색 -->
<form name="searchform" method="get">
	<input type="hidden" name="pageno" value="<%= criteria.getPageno() %>">
	<table border="1" style="width: 90%">
		<tr>
			<td align="center">
				<select name="searchfield">
					<option value="title" <%= "title".equals(criteria.getSearchfield())?"selected":"" %>>제목</option> 
	            	<option value="content" <%= "content".equals(criteria.getSearchfield())?"selected":"" %>>내용</option>
	            	<option value="id" <%= "id".equals(criteria.getSearchfield())?"selected":"" %>>작성자</option>
				</select>
				<input type="text" name="searchword" value="<%= criteria.getSearchword() %>">
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
</form>

<!-- 게시글 목록 -->
<table border="1" style="width: 90%">
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
	<tr align="center"> 
		<td><%= board.getNum() %></td> 
		<td align="left">
			<a href="02-02View_el.jsp?num=<%= board.getNum() %>&pageno=<%= criteria.getPageno() %>">
				<%= board.getTitle() %>
			</a>
		</td> 
		<td><%= board.getId() %></td> 
		<td><%= board.getPostdate() %></td> 
		<td><%= board.getVisitcount() %></td>
	</tr>
<%		
		}
	}
%>
</table>

<!-- 글쓰기 -->
<%
	if(session.getAttribute("userid")!=null){
%>
<table border="1" style="width: 90%">
	<tr>
		<td align="right">
			<input type="button" onclick="location.href='02-01Write.jsp'" value="글쓰기">
		</td>
	</tr>
</table>
<%
	}
%>

<!-- 페이지 블록 -->
<%
	PageDto pageDto = new PageDto(totalcount, criteria);
%>
<table border="1" style="width: 90%">
	<tr>
		<td align="center"> 
		<%@include file="/08Board/02-05PageNavi.jsp" %>
		</td>
	</tr>
</table>
</body>
</html>