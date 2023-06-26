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
총 게시물 수: ${ totalcount }
<form name="searchform"> <!-- 검색 버튼 또는 페이징 버튼(PageNavi.jsp)에 의해 submit -->
	<input type="hidden" name="pageno">
	<table border="1" style="width: 90%">
		<tr>
			<td align="center">
				<select name="searchfield">
					<option value="title" ${ "title" eq searchfield?"selected":"" }>제목</option>
					<option value="content" ${ "content" eq searchfield?"selected":"" }>내용</option>
					<option value="name" ${ "name" eq searchfield?"selected":"" }>작성자</option>
				</select>
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
		<th>첨부파일</th>
	</tr>
<c:if test="${ empty boardlist }">
	<tr>
		<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
	</tr>
</c:if>
<c:if test="${ not empty boardlist }">
	<c:forEach items="${ boardlist }" var="board">
		<tr align="center">
			<td>${ board.idx }</td>
			<td align="left"><a href="../mvcboard/view.do?idx=${ board.idx }&searchfield=${ searchfield }&searchword=${ searchword }&pageno=${ pageno }">${ board.title }</a></td>
			<td>${ board.name }</td>
			<td>${ board.visitcount }</td>
			<td>${ board.postdate }</td>
			<td><c:if test="${ not empty board.ofile }"><a href="../mvcboard/download.do?ofile=${ board.ofile }&sfile=${ board.sfile }">${ board.ofile }</a></c:if></td>
		</tr>
	</c:forEach>
</c:if>
	<tr align="center">
		<td colspan="5"><%@ include file="PageNavi.jsp" %></td>
		<td><input type="button" onclick="location.href='../14MVCBoard/Write.jsp'" value="글쓰기"></td>
	</tr>
</table>
</body>
</html>