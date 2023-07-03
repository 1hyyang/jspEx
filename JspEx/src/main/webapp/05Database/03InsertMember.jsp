<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<body>
<h2>회원등록</h2>
<%
	Member member = new Member("id입력", "pw입력", "name입력", "");
	MemberDao dao = new MemberDao();
	int res = dao.insert(member);
	if(res>0){
		out.print(res + "건 등록되었습니다.");
	} else{
		out.print("등록 실패");
	}
%>
</body>
</html>