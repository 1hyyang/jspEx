<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체의 영역</title>
</head>
<body>
<!-- 
	내장 객체의 영역
		웹에서는 페이지들이 모여 하나의 요청을 처리하며 
		요청들이 모여 하나의 세션을, 세션이 모여 하나의 어플리케이션을 이룬다.
		
		page 영역 : 동일한 페이지에서만 공유
		request 영역 : 하나의 요청에 의해 호출된 페이지 및 포워드 페이지
		session 영역 : 클라이언트가 처음 웹 브라우저로 접속한 후 웹 브라우저를 닫을 때까지
		application 영역 : 웹 어플리케이션(웹 서버)이 종료될 때까지
		
		[사용방법]
			setAttribute(String name, Object value)
				각 영역에 속성을 저장
				Object 타입으로 받고 있으므로 모든 타입이 저장 가능
			
			getAttribute(name)
				영역에 저장된 속성값을 얻어옴
				Object 타입으로 자동 형변환되어 저장되므로 원래 타입으로 형변환 후 사용 가능
 -->
</body>
</html>