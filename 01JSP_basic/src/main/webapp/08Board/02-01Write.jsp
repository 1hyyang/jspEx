<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style>
	* {box-sizing: border-box;}
</style>
</head>
<body>
<jsp:include page="02-01IsLogin.jsp"/>
<jsp:include page="00Link.jsp"/>
<h2>글쓰기</h2>
<form name="writeform" method="post" action="02-01WriteProcess.jsp"
	onsubmit="return validateForm(this);">
	<table border="1" style="width: 90%;">	
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" style="width: 100%;"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" style="width: 100%; height: 200px;"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="submit" value="작성완료">
				<input type="reset" value="다시입력">	
				<input type="button" onclick="location.href='02-00Board.jsp'" value="목록으로" >			
			</td>
		</tr>	
	</table>
</form>
</body>
</html>