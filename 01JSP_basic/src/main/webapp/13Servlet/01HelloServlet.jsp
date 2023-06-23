<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Servlet</title>
</head>
<body>
표현식: <%= request.getAttribute("message") %><br>
EL: ${ requestScope.message }<br>
<!-- 컨텍스트 루트 경로부터 경로를 지정하지 않아도 .(현재 디렉토리)를 이용하여 경로를 지정할 수 있다. -->
<a href="./XmlMapping.do">XmlMapping.do 바로가기</a><br>
<a href="${ pageContext.request.contextPath }/13Servlet/AnnotationMapping.do">AnnotationMapping.do 바로가기</a>
</body>
</html>