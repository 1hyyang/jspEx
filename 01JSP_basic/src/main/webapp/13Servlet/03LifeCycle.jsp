<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서블릿 수명 주기</title>
<script>
	function requestAction(form, type){
		if(type==1){
			form.method = "get";
		} else if(type==2){
			form.method = "post";
		}
		form.submit();
	}
</script>
</head>
<body>
<h2>서블릿 수명 주기(Life Cycle) 메소드</h2>
<form action="./LifeCycle.do">
	<input type="button" value="get 방식 요청" onclick="requestAction(this.form, 1)">
	<input type="button" value="post 방식 요청" onclick="requestAction(this.form, 2)">
</form>
</body>
</html>