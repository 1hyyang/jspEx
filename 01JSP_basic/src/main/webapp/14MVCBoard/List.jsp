<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록 보기</title>
</head>
<body>
<h2>파일 첨부형 게시판</h2>
<c:set var="pageno" value="${ criteria.pageno }"/>
<form action="/mvcboard/list.do?pageno=${ pageno }'">
	<table border="1" style="width: 90%">
		<tr>
			<td align="center">
				<select name="searchfield">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="name">작성자</option>
				</select>
				<c:set var="searchword" value="${ criteria.searchword }"/>
				<input type="text" name="searchword" value="${ searchword }">
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
</form>
<table border="1" style="width: 90%">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
		<th>첨부</th>
	</tr>
<c:set var="boardlist" value="${ requestScope.boardlist }"/>
<c:if test="${ empty boardlist }">
	<tr>
		<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
	</tr>
</c:if>
<c:if test="${ not empty boardlist }">
	<c:forEach items="${ boardlist }" var="board">
		<tr>
			<td>${ board.idx }</td>
			<td>${ board.title }</td>
			<td>${ board.name }</td>
			<td>${ board.visitcount }</td>
			<td>${ board.postdate }</td>
			<td>${ board.ofile }</td>
		</tr>
	</c:forEach>
</c:if>
	<tr align="center">
		<td colspan="5">페이지</td>
		<td><input type="button" value="글쓰기"></td>
	</tr>
</table>
</body>
</html>