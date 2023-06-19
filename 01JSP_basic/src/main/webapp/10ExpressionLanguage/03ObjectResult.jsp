<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>영역을 통해 전달된 객체 읽기</h2>
<%
	/*
	표현 언어(EL)를 이용하면 형변환이 필요 없이 파라미터를 읽어올 수 있다.
	별도의 null 처리를 하지 않아도 오류가 발생하지 않는다.
	(현재 페이지로 리로드시 오류가 발생하지 않는다.)
	객체를 사용하기 위해서 임포트만 하면 된다.
	*/
%>

<ul>
	<li>personObj: <br>
		<!-- ${ requestScope.personObj.name } -->
		이름: ${ personObj.name }, 나이: ${ personObj.age }
	</li>
	<li>stringObj: ${ stringObj }</li>
	<li>integerObj: ${ integerObj }</li>
</ul>

<h2>매개 변수로 전달된 값 읽기</h2>
<ul>
	<li>param.firstNum: ${ param.firstNum }</li>
	<li>param.secondNum: ${ param.secondNum }</li>
	<li>param.firstNum+param.secondNum: ${ param.firstNum+param.secondNum }</li>
	<li>param['firstNum']: ${ param['firstNum'] }</li>
	<li>param["secondNum"]: ${ param["secondNum"] }</li>	
</ul>
</body>
</html>