<%@page import="java.net.URLEncoder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.FileDao"%>
<%@page import="fileupload.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB에 등록된 파일 목록 보기</title>
</head>
<body>
<h2>DB에 등록된 파일 목록 보기</h2>
<a href="FileUpload.jsp">파일 업로드</a>
<%-- 
<%
	FileDao dao = new FileDao();
	List<FileDto> filelist = dao.getFileList();
%>
 --%>
<!-- 게시글 목록 -->
<table border="1">
	<tr> 
		<th>번호</th> 
		<th>작성자</th> 
		<th>제목</th> 
		<th>카테고리</th> 
		<th>원본 파일명</th>
		<th>저장된 파일명</th>
		<th>등록한 날짜</th>
		<th></th>		 
	</tr>
<%-- <c:set var="filelist" value="<%= filelist %>"/> --%>
<c:set var="filelist" value="${ requestScope.filelist }"/>
<c:if test="${ empty filelist }">
	<tr>
		<td colspan="7" align="center">등록된 파일이 없습니다.</td>
	</tr>
</c:if>
<c:if test="${ not empty filelist }">
	<c:forEach items="${ filelist }" var="file">
		<tr align="center"> 
			<td>${ file.idx }</td> 
			<td>${ file.name }</td> 
			<td>${ file.title }</td> 
			<td>${ file.cate }</td> 
			<td>${ file.ofile }</td>
			<td>${ file.sfile }</td>		
			<td>${ file.postdate }</td>
			<td><a href="FileDownload.jsp?ofile=${ file.ofile }&sfile=${ file.sfile }">다운로드</a></td>
		</tr>
	</c:forEach>
</c:if>
</table>