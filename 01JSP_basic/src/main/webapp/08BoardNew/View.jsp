<%@page import="dao.BoardDaoNew"%>
<%@page import="common.JSFunction"%>
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
<%@include file="../08Board/00Link.jsp" %>
<h2>회원제 게시판 - 상세보기(View)</h2>
<%
	BoardDaoNew dao = new BoardDaoNew();
	String num = request.getParameter("num");	
	dao.updateVisitcount(num);
	
	Board board = dao.selectPost(num);
	if(num==null){
		JSFunction.alertBack("존재하지 않는 게시물입니다.", out);		
		return;
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
        <td colspan="3" height="100"><%= board.getContent().replace("\r\n", "<br>") %></td> 
    </tr>
    <tr>
        <td colspan="4" align="center">
        <%
        	if(session.getAttribute("userid")!=null && board.getId().equals(session.getAttribute("userid"))){
        %>		
            <button type="button" onclick="location.href='Edit.jsp?num=<%= board.getNum() %>'">수정</button>
            <button type="button" onclick="deletePost()">삭제</button>
        <% 
        	}
        %>
        <%        
        	String pageno = "1";
        	if(request.getParameter("pageno")!=null){
        		pageno = request.getParameter("pageno");
        	}
        %>        
            <button type="button" onclick="location.href='List.jsp?pageno=<%= pageno %>'">목록으로</button>
        </td>
    </tr>
</table>
<script>
	function deletePost(){
		if(confirm("삭제하시겠습니까?")){
			location.href="DeleteProcess.jsp?num=<%= board.getNum() %>"
		}
	}
</script>
</body>
</html>
