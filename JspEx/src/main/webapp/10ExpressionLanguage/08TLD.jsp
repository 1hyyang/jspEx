<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TLD</title>
</head>
<body>
<!-- 
	TLD(Tag Library Descriptor)
		JSP에서 사용되는 커스텀 태그나 JSTL의 태그들에 대한 설정 파일
		WEB-INF 하위에 작성해야 인식 가능
		
		prefix : EL에서 사용할 접두어
		uri : TLD 파일의 경로
 -->
 
<%@taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld"%>
<h2>TLD 파일에 등록 후 정적 메소드 호출하기</h2>
<ul>
	<li>${ mytag:isNumber("100") }</li>
	<li>${ mytag:isNumber("백") }</li>
</ul>
</body>
</html>