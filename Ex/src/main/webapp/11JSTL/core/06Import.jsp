<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>import</title>
</head>
<body>
<!-- 
	import : 외부 파일을 현재 위치에 삽입
		url		: 외부 파일 경로
		scope 	: 영역
		var		: 변수명
				  변수명을 사용하면 선언과 삽입을 분리할 수 있다.
	
	외부 파일에 매개 변수 넣기
		- url의 쿼리스트링으로 전달하기
		- c:param 태그를 이용하기		
 -->
 
<h2>다른 문서 삽입하기</h2>
<c:import url="/gogreen/gogreenHeader.jsp" var="importUrl">
	<c:param name="header" value="헤더영역"/>
</c:import>
${ importUrl }

<h2>iframe을 이용한 외부 자원 삽입하기</h2>
<iframe src="../inc/GoldPage.jsp" style="width: 100%; height: 100px;"></iframe>

<h2>out 태그 사용하기</h2>
<c:set var="itag">
	i 태그는 <i>기울임</i>을 표현합니다.
</c:set>

<h3>out 태그를 사용하지 않고 출력</h3>
${ itag }

<h3>out 태그-기본 사용</h3>
<c:out value="${ itag }"/>

<h3>out 태그-escapeXml 속성</h3>
<!-- HTML 태그를 해석하여 마크업이 적용된 상태로 출력 -->
<c:out value="${ itag }" escapeXml="false"/>

<h3>out 태그-default 속성</h3>
<c:out value="${ param.name }" default="이름없음"/>
<c:out value="" default="빈 문자열도 값입니다."/>

<%--
<h2>redirect</h2>
<c:set var="requestVar" value="리퀘스트 영역" scope="request"/>
<!-- redirect 방식이므로 리퀘스트 영역이 공유되지 않는다. -->
<c:redirect url="/11JSTL/inc/OtherPage.jsp">
	<c:param name="param1" value="출판사"/>
	<c:param name="param2" value="골든래빗"/>
</c:redirect>
 --%>

<h2>url 태그를 이용하여 링크 걸기</h2>
<!-- 
	c:url
		지정한 경로와 매개 변수를 이용해서 컨텍스트 루트를 포함한 URL을 생성한다.
		a 태그의 href 속성이나 form 태그의 action 속성에 이용할 수 있다.
		
		value 	: 경로
		var		: 변수명
 -->

<a href="/11JSTL/inc/OtherPage.jsp">페이지 바로가기</a> <!-- 에러 발생 -->
<!-- href 속성을 통해 경로를 설정할 때에는 웹 애플리케이션의 루트를 기준으로 삼아야 한다. --> 
<a href="${ pageContext.request.contextPath }/11JSTL/inc/OtherPage.jsp">페이지 바로가기</a>
<!-- 또는 url 태그를 생성하여 이용한다. -->
<c:url value="/11JSTL/inc/OtherPage.jsp" var="url"/>
<a href="${ url }">url 태그를 이용한 바로가기</a>
<form action="${ url }">
	<button>전송</button>
</form>

<h2>예외 처리</h2>
<!-- 
	c:catch 태그
		예외가 발생하면 지정한 변수에 에러 메시지가 저장되어 전달
 -->
<%
	int num1 = 100;
%>
<c:catch var="eMessage">
<%
	int res = num1/0;
%>
</c:catch>
예외 내용: ${ eMessage }

<h3>EL에서의 예외</h3>
<c:set var="num2" value="200"/>
<c:catch var="eMessage">
	${"백"+num2 }
</c:catch>
예외 내용: ${ eMessage }
</body>
</html>