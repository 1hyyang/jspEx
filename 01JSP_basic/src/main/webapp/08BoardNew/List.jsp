<%@page import="dto.Criteria"%>
<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
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
<h2>목록보기(List)</h2>
<%
	String searchfield = request.getParameter("searchfield");
	String searchword = request.getParameter("searchword");
	String pageno = request.getParameter("pageno");	
	Criteria criteria = new Criteria(searchfield, searchword, pageno);
	
	BoardDaoNew dao = new BoardDaoNew();
	List<Board> boardlist = dao.getListPage(criteria);
	
	int totalcount = dao.getTotalcount(criteria);
%>
총 건수: <%= totalcount %>

<!-- 검색폼 --> 
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
	        <input type="text" name="searchword" value="<%= criteria.getSearchword() %>"/>
	        <input type="submit" value="검색" />
	    </td>
	</tr>   
	</table>
</form>

<!-- 게시물 목록 테이블(표) --> 
<table border="1" style="width: 90%">
    <!-- 각 칼럼의 이름 --> 
    <tr>
        <th width="10%">번호</th>
        <th width="50%">제목</th>
        <th width="15%">작성자</th>
        <th width="15%">작성일</th>
        <th width="10%">조회수</th>
    </tr>
    <!-- 목록의 내용 --> 
<%
	if(boardlist.isEmpty()){
%>
	<tr>
		<td colspan="5" style="text-align: center">조회된 게시물이 없습니다.</td>
	</tr>
<%		
	} else{
		for(Board board:boardlist){
%>
    <tr align="center">
        <td><%= board.getNum() %></td>	<!--게시물 번호-->
        <td align="left">	<!--제목(+ 하이퍼링크)-->
        	<a href="View.jsp?num=<%= board.getNum() %>&pageno=<%= criteria.getPageno() %>">
        		<%= board.getTitle() %>
        	</a> 
        </td>
        <td align="center"><%= board.getId() %></td>	<!--작성자 아이디-->
        <td align="center"><%= board.getPostdate() %></td>	<!--작성일-->
        <td align="center"><%= board.getVisitcount() %></td>	<!--조회수-->
    </tr>
<%			
		}
	}
%>    
</table>

<!--목록 하단의 [글쓰기] 버튼-->
<%
	if(session.getAttribute("userid")!=null && !"".equals(session.getAttribute("userid"))){
%>
<table border="1" style="width: 90%">
    <tr align="right">
        <td><button type="button" onclick="location.href='Write.jsp'">글쓰기</button></td>
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
		<%@include file="../08Board/02-05PageNavi.jsp" %>
		</td>
	</tr>
</table>
</body>
</html>