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
				 // return문이 없으면 아래의 코드가 실행되고, 이때 board 객체가 null이므로 NullPointerException이 발생
	}
	
	// EL 사용하기 위해 영역에 저장
	request.setAttribute("board", board);
%>
<table border="1" style="width: 90%">
	<tr>
		<td>번호</td>
		<td>${ board.num }</td>
		<td>작성자</td>
		<td>${ board.id }</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${ board.postdate }</td>
		<td>조회수</td>
		<td>${ board.visitcount }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3">${ board.title }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3">${ board.content }</td>
	</tr>
	<tr style="text-align: center;">
		<td colspan="4">
		<%
			if(session.getAttribute("userid")!=null && board.getId().equals(session.getAttribute("userid"))){
		%>
			<input type="button" onclick="location.href='02-03Edit.jsp?num=<%= board.getNum() %>'" value="수정">
			<input type="button" onclick="deletePost()" value="삭제">		
		<%		
			}
		%>
		<%        
        	String pageno = "1";
        	if(request.getParameter("pageno")!=null){
        		pageno = request.getParameter("pageno");
        	}
        %> 
			<input type="button" onclick="location.href='02-00List.jsp?pageno=<%= pageno %>'" value="목록으로">
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