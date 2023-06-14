<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.ConnectionUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
</head>
<body>
<h2>회원조회</h2>
<table border="1">
<%
	Connection conn = ConnectionUtil.getConnection();
	String sql = "SELECT ID, NAME, REGIDATE FROM MEMBER";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<tr> <th>아이디</th> <th>이름</th> <th>등록일</th> </tr>
<% 
	while(rs.next()){
		String loginid = rs.getString(1);
		String name = rs.getString(2);
		String regidate = rs.getString(3);
		out.print(String.format("<tr> <td>%s</td> <td>%s</td> <td>%s</td> </tr>", loginid, name, regidate));
	}
%>
</table>
</body>
</html>