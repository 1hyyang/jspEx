<%@page import="common.ConnectionPool"%>
<%@page import="common.ConnectionUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Connection test</title>
</head>
<body>
<h2>외부 설정 파일로부터 DB 접속 정보를 읽어오기</h2>
<h3>ConnectionUtil을 이용한 커넥션 생성</h3>
<%
	long startTime, endTime;
	startTime = System.currentTimeMillis();
	for(int i=0; i<100; i++){
		Connection conn1 = ConnectionUtil.getConnection(application);
		System.out.println("conn1: " + conn1);
		conn1.close();
	}
	endTime = System.currentTimeMillis();
	out.print("100개 생성하는 데 걸린 시간: " + (endTime - startTime) + "ms");
%>

<h3>ConnectionPool을 이용한 커넥션 생성</h3>
<%
	startTime = System.currentTimeMillis();
	for(int i=0; i<100; i++){
		Connection conn2 = ConnectionPool.getConnection();
		System.out.println("conn2: " + conn2);
		conn2.close();
	}
	endTime = System.currentTimeMillis();
	out.print("100개 생성하는 데 걸린 시간: " + (endTime - startTime) + "ms");
%>
</body>
</html>