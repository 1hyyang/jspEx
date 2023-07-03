<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL)</title>
</head>
<body>
<%
	/*
	표현 언어 EL(Expression Language)
		변수의 값을 출력할 때 사용하는 스크립트 언어
		4가지 영역에 저장된 값을 출력한다.
		사용법이 간결하고 예외와 형변환에 관대하다.	
		서블릿에서 처리된 결과는 영역을 통해 전달되고 표현 언어로 접근하여 쉽게 출력할 수 있다.
	
		- JSP 내장 객체의 영역에 담긴 속성을 사용
		- 산술 연산, 논리 연산, 비교 연산이 가능
		- 자바 클래스에 정의된 메소드 호출 가능
	
		[기본사용법]
			영역에 저장된 변수의 값을 출력하기
				영역명.getAttribute("속성명")
				=> ${ 영역명Scope.속성명 } -> 형변환이 필요 없다.
				
				영역을 따로 지정하지 않으면 가장 좁은 영역에서부터 속성을 찾는다.
		
			요청시 받아 온 파라미터를 출력하기
				request.getParameter("속성명")
				=> ${ param.속성명 }
					${ param["속성명"] }
					${ param['속성명'] }
				
				한글, 특수 문자가 입력된 경우 대괄호[]를 이용해야 오류가 발생하지 않는다.
				ex) ${param["user-agent"]}
					${param["한글"]}
	*/
%> 

<%
	pageContext.setAttribute("scopeValue", "페이지 영역");
	request.setAttribute("scopeValue", "리퀘스트 영역");
	session.setAttribute("scopeValue", "세션 영역");
	application.setAttribute("scopeValue", "애플리케이션 영역");
%>
<h2>각 영역에 저장된 속성 읽기</h2>
<ul>
	<li>${ pageScope.scopeValue }</li>
	<li>${ requestScope.scopeValue }</li>
	<li>${ sessionScope.scopeValue }</li>
	<li>${ applicationScope.scopeValue }</li>
</ul>

<h2>영역 지정 없이 속성 읽기</h2>
<ul>
	<!-- 영역을 따로 지정하지 않으면 가장 좁은 영역에서부터 속성을 찾는다. -->
	<!-- 아래에 forward 방식이 적용되어 있으므로 request 영역에서부터 속성을 찾는다. -->
	<li>${ scopeValue }</li>
</ul>

<!-- 기존 출력은 무시되고 페이지를 이동한다. -->
<jsp:forward page="01ImplicitForwardResult.jsp"/>
</body>
</html>