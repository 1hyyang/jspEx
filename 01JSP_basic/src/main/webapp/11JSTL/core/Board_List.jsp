<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
<!-- EL을 사용하기 위해 변수를 (영역 설정 안 했으므로) 페이지 영역에 저장 -->
<c:set var="boardlist" value="<%= boardlist %>"/>
<!-- 리스트가 비었는지 확인 -->
<c:if test="${ empty boardlist }">
	<tr>
		<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
	</tr>
</c:if>
<!-- 리스트가 비어있지 않다면 리스트를 출력 -->
<c:if test="${ not (empty boardlist) }">
	<!-- 반복문을 통해 리스트에 담긴 board 객체를 출력 (items : 향상된 for문에서 사용) -->
	<c:forEach items="${ boardlist }" var="board">
		<tr align="center"> 
			<td>${ board.num }</td> 
			<td align="left">
				<!-- href 속성을 통해 경로를 설정할 때에는 웹 애플리케이션의 루트를 기준으로 삼아야 한다. -->
				<a href="${ pageContext.request.contextPath }/08Board/02-02View_el.jsp?num=${ board.num }&pageno=<%= criteria.getPageno() %>">
					${ board.title }
				</a>
			</td> 
			<td>${ board.id }</td> 
			<td>${ board.postdate }</td> 
			<td>${ board.visitcount }</td>
		</tr>
	</c:forEach>
</c:if>
</table>

<!-- 글쓰기 -->
<c:if test="${ not empty sessionScope.userid }">
<table border="1" style="width: 90%">
	<tr>
		<td align="right">
			<input type="button" onclick="location.href='${ pageContext.request.contextPath }/08Board/02-01Write.jsp'" value="글쓰기">
		</td>
	</tr>
</table>
</c:if>

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