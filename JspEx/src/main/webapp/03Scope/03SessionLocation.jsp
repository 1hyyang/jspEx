<%@page import="java.util.ArrayList"%>
<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체의 영역-session</title>
</head>
<body>
<%	
	if(session.getAttribute("person")!=null){
		Person p = (Person)session.getAttribute("person");
		out.print(p.getName() + ", ");
		out.print(p.getAge() + "<br>");
	} else{
		// 브라우저를 닫았다가 새로 열면 쿠키에 저장된 세션 id 값이 변경되므로 세션이 유지되지 않는다.	
		out.print("session에 저장된 person 객체가 없습니다.<br>");
	}

	if(session.getAttribute("list")!=null){
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("list");	
		for(String str:list){
			out.print(str + "<br>");
		}
	} else{
		out.print("session에 저장된 list 객체가 없습니다.<br>");
	}
%>
</body>
</html>