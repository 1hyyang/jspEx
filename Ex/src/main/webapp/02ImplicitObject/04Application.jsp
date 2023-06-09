<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체-application</title>
</head>
<body>
<!-- 
	application 내장 객체
		웹 애플리케이션당 하나만 생성되며 모든 JSP 페이지에서 접근할 수 있는 객체
		ServletContext 타입으로 웹 애플리케이션 전반에 이용하는 정보를 저장하거나 
		서버의 정보, 서버의 물리적 경로(이클립스에서 지정한 임의의 경로) 등을 얻어오는 데 사용한다.
		
	web.xml
		배포 서술자
		웹 애플리케이션에 대한 여러 가지 설정을 저장하는 파일
		Project > Java EE Tools > Generate Deployment Descriptor Stub
 -->
 
<%
	// xml에 설정한 파라미터 읽어오기
	String init = application.getInitParameter("INIT_PARAM");
	// 서버의 물리적 경로 읽어오기
	String path = application.getRealPath("/02ImplicitObject");
%>
<h2>application</h2>
초기화 매개 변수: <%= init %><br>
내장 객체의 물리적 주소: <%= path %>

<h3>선언부에서 application 내장 객체 사용하기</h3>
<%!
	public String useImplicitObject(){		
		return this.getServletContext().getRealPath("/02ImplicitObject");
	}
	public String useImplicitObject(ServletContext app){
		return app.getRealPath("/02ImplicitObject");
	}
%>
<ul>
	<li>this 사용: <%= useImplicitObject() %></li>
	<li>내장 객체를 인수로 전달: <%= useImplicitObject(application) %></li>
</ul>
</body>
</html>