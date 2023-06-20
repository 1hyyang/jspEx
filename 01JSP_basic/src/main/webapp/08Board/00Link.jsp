<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<table border="1" style="width: 90%"> 
    <tr>
        <td align="center">  
        <c:if test="${ empty sessionScope.userid }" var="loggedout">
        	<a href="${ pageContext.request.contextPath }/08Board/01LoginForm.jsp">로그인</a>
        </c:if>
        <c:if test="${ not loggedout }">
        	<a href="${ pageContext.request.contextPath }/08Board/01Logout.jsp">로그아웃</a>
        </c:if>    	
            &nbsp;&nbsp;&nbsp; 
            <a href="${ pageContext.request.contextPath }/08Board/02-00List.jsp">게시판</a>
            &nbsp;&nbsp;&nbsp; 
            <a href="${ pageContext.request.contextPath }/08BoardNew/List.jsp">게시판new</a>
        </td>
    </tr>
</table>