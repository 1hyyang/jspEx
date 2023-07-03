<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action tag-forward</title>
</head>
<body>
<h2>액션 태그를 이용한 포워딩</h2>
<%
	request.setCharacterEncoding("UTF-8");
	pageContext.setAttribute("pAttr", "success");
	request.setAttribute("rAttr", "success");
%>
<!-- 
	새로운 페이지로 forward
	page 영역은 공유되지 않고 request 영역은 공유된다.
 -->
<!-- 
<jsp:forward page="02ForwardSub.jsp">
	<jsp:param name="pAttr" value="페이지영역"/>
</jsp:forward>
 -->
<jsp:forward page="02ForwardSub.jsp"></jsp:forward>
</body>
</html>