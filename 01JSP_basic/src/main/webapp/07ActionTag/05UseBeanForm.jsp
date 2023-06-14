<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action tag-use bean</title>
</head>
<body>
<h2>액션 태그로 폼의 값을 한번에 받기</h2>
<form method="get" action="05UseBeanAction.jsp">
	이름: <input type="text" name="name"><br>
	나이: <input type="text" name="age"><br>
	<input type="submit" value="전송">
</form>
</body>
</html>