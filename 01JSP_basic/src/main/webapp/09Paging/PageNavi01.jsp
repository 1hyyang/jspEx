<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	// 총 게시물 수, 검색 조건(페이지 번호, 페이지당 게시물 수, 검색어, 검색 조건)
	int pageno = request.getParameter("pageno")==null?1
			:Integer.parseInt(request.getParameter("pageno"));

	int totalcount = 301;
	Criteria criteria = new Criteria(pageno);
	PageDto pageDto = new PageDto(totalcount, criteria);
	
	// 시작 페이지 번호가 1보다 큰 경우 이전 버튼을 출력
	if(pageDto.isPrev()){
		out.print("<a href='PageNavi.jsp?pageno=" + (pageDto.getStartno()-1) + "'>");
		out.print("<");
		out.print("</a>");
	}
	for(int i=pageDto.getStartno(); i<=pageDto.getEndno(); i++){
		out.print("<a href='PageNavi.jsp?pageno=" + i + "'>");
		out.print(i);
		out.print("</a>");
	}
	// 끝 페이지 번호가 게시물의 끝 페이지 번호와 일치하지 않으면
	if(pageDto.isNext()){
		out.print("<a href='PageNavi.jsp?pageno=" + (pageDto.getEndno()+1) + "'>");
		out.print(">");
		out.print("</a>");		
	}
%>
</body>
</html>