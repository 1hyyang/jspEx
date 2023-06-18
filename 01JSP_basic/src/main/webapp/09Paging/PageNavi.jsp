<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 블록</title>
<script>
	function go(pageno){
		location.href="PageNavi.jsp?pageno=" + pageno;
	}
</script>
</head>
<body>
<%
	String pageno = request.getParameter("pageno");
	Criteria criteria = new Criteria(pageno);

	int total = 301;
	PageDto pageDto = new PageDto(total, criteria);

	// 페이지 블록의 시작 번호가 1보다 크면
	if(pageDto.isPrev()){
		// 1페이지로 이동하는 버튼 출력
		out.print("<input type='button' value='<<' onclick='go(1)'>");
		// (현재 페이지 블록의 시작 번호-1 = 이전 페이지 블록의 끝 번호)로 이동하는 버튼 출력
		out.print("<input type='button' value='<' onclick='go(" + (pageDto.getStartno()-1) + ")'>");		
	}
	
	for(int i=pageDto.getStartno(); i<=pageDto.getEndno(); i++){
		// 해당 번호의 페이지로 이동하는 버튼 출력
		out.print("<input type='button' value='" + i + "' onclick='go(" + i + ")'>");
	}

	// 페이지 블록의 끝 번호가 마지막 페이지 번호와 같지 않으면
	if(pageDto.isNext()){
		// 다음 페이지 블록의 시작 번호로 이동하는 버튼 출력
		out.print("<input type='button' value='>' onclick='go(" + (pageDto.getEndno()+1) + ")'>");	
		// 마지막 페이지로 이동하는 버튼 출력
		out.print("<input type='button' value='>>' onclick='go(" + (pageDto.getRealendno()) + ")'>");		
	}
%>
</body>
</html>