<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.ConnectionUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Connection</title>
</head>
<body>
<h2>외부 설정 파일로부터 DB 접속 정보를 읽어오기</h2>
<%
	Connection conn = ConnectionUtil.getConnection(application);
	PreparedStatement pstmt = conn.prepareStatement("SELECT SYSDATE FROM DUAL");
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
		out.print(rs.getString(1));
	}
	rs.close();
	pstmt.close();
	conn.close();
%>
</body>
</html>