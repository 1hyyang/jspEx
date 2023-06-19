<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 폼값 처리</title>
</head>
<body>
<h2>EL 폼값 받기</h2>
<%
	/*
	요청시 받아온 파라미터를 출력
	
	request.getParameter("속성명")
	${ param.속성명 }
	
	requet.getParameterValues("속성명")
	${ paramValues.속성명[배열번호] }	
	체크박스는 선택된 내용만 넘어온다.
	
	null에 대한 오류 처리 없이 사용할 수 있다.
	*/
%>
 
<ul>
	<li>이름: ${ param.name }</li>
	<li>성별: ${ param.gender }</li>
	<li>학력: ${ param.grade }</li>
	<li>관심사항: ${ paramValues.inter[0] }
				${ paramValues.inter[1] }
				${ paramValues.inter[2] }
				${ paramValues.inter[3] }</li>
</ul>
</body>
</html>