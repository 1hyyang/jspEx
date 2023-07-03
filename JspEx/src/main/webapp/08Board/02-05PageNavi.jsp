<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 블록</title>
</head>
<body>
<script>
	function go(pageno){
		// location.href="${ pageContext.request.contextPath }/08Board/02-00List.jsp?pageno=" + pageno;
		document.searchform.pageno.value = pageno;
		document.searchform.submit();
	}
</script>
<c:set var="pageDto" value="<%= pageDto %>"/>
<c:if test="${ pageDto.prev }">
	<input type='button' value='<<' onclick='go(1)'>
	<input type='button' value='<' onclick='go(${ pageDto.startno-1 })'>
</c:if>
<c:forEach begin="${ pageDto.startno }" end="${ pageDto.endno }" var="pageno">
	<input type='button' value='${ pageno }' onclick='go(${ pageno })'>
</c:forEach>
<c:if test="${ pageDto.next }">
	<input type='button' value='>' onclick='go(${ pageDto.endno+1 })'>
	<input type='button' value='>>' onclick='go(${ pageDto.realendno })'>
</c:if>
</body>
</html>