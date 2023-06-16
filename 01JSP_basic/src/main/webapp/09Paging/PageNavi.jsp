<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이징</title>
<script>
	function go(pageno){
		location.href="PageNavi.jsp?pageno=" + pageno;
	}
</script>
</head>
<body>
<!--
	PageDto 객체로 페이지 블록을 생성
	- 페이지 블록의 시작 번호
	- 페이지 블록의 끝 번호
	- 게시물의 끝 페이지 번호
	- 이전 버튼 출력 여부
	- 다음 버튼 출력 여부
 -->
 
<%
	int pageno = request.getParameter("pageno")==null?1
		:Integer.parseInt(request.getParameter("pageno"));

	int total = 301;
	Criteria criteria = new Criteria(pageno);
	PageDto pageDto = new PageDto(total, criteria);

	// 페이지 블록의 시작 번호가 1보다 큰 경우 이전 버튼을 출력
	if(pageDto.isPrev()){
		// 첫 페이지 블록
		out.print("<input type='button' value='<<' onclick='go(1)'>");
		// 이전 페이지 블록
		out.print("<input type='button' value='<' onclick='go(" + (pageDto.getStartno()-1) + ")'>");		
	}	
	for(int i=pageDto.getStartno(); i<=pageDto.getEndno(); i++){
		out.print("<input type='button' value='" + i + "' onclick='go(" + i + ")'>");
	}
	// 페이지 블록의 끝 번호가 게시물의 끝 페이지 번호와 일치하지 않으면 다음 버튼을 출력
	if(pageDto.isNext()){
		// 다음 페이지 블록
		out.print("<input type='button' value='>' onclick='go(" + (pageDto.getEndno()+1) + ")'>");	
		// 마지막 페이지 블록
		out.print("<input type='button' value='>>' onclick='go(" + (pageDto.getRealendno()) + ")'>");		
	}
%>
</body>
</html>