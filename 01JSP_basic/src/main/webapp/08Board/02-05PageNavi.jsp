<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이징</title>
</head>
<body>
<script>
	function go(pageno){
		document.searchform.pageno.value = pageno;
		document.searchform.submit();
		// location.href="02-00Board.jsp?pageno=" + pageno;
	}
</script>
<%
	if(pageDto.isPrev()){
		// 첫 페이지 블록
		out.print("<input type='button' value='<<' onclick='go(1)'>");
		// 이전 페이지 블록
		out.print("<input type='button' value='<' onclick='go(" + (pageDto.getStartno()-1) + ")'>");		
	}	
	for(int i=pageDto.getStartno(); i<=pageDto.getEndno(); i++){
		out.print("<input type='button' value='" + i + "' onclick='go(" + i + ")'>");
	}
	if(pageDto.isNext()){
		// 이후 페이지 블록
		out.print("<input type='button' value='>' onclick='go(" + (pageDto.getEndno()+1) + ")'>");	
		// 마지막 페이지 블록
		out.print("<input type='button' value='>>' onclick='go(" + (pageDto.getRealendno()) + ")'>");		
	}
%>
</body>
</html>