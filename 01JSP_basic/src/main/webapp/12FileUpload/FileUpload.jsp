<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
<script>
	<!-- 유효성 검사(validation check) --> 
	function validateform(form){
		if(form.name.value==''){
			alert("작성자를 입력하세요.");
			form.name.focus();
			return false;
		}
		if(form.title.value==''){
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if(document.querySelectorAll("[name=category]:checked").length==0){
			alert("카테고리를 선택하세요.");
			return false;
		}
		if(form.attachedfile.value==''){
			alert("첨부파일은 필수 입력 사항입니다.");
			return false;
		}
	}
</script>
</head>
<body>
<h2>파일 업로드</h2>
<!-- 
	파일 업로드
		1. 라이브러리(cos.jar) 추가
		2. form 태그의 속성 설정
			method	: post
			enctype	: multipart/form-data
 -->
<!-- 			
			enctype : form값을 서버로 전송할 때의 인코딩 방식을 지정
				- application/x-www-form-urlencoded (기본값)
					모든 문자를 서버로 전송하기 전에 인코딩한다.
				- multipart/form-data
					form 태그를 통해 파일을 서버로 전송할 때 사용
					모든 문자를 인코딩하지 않는다.
 -->

<form action="FileUploadProcess.jsp" method="post" enctype="multipart/form-data"
		onsubmit="return validateform(this);">	<!-- false가 반환되면 이벤트를 실행하지 않는다. -->
	<p>작성자: <input type="text" name="name" value="test"></p>
	<p>제목: <input type="text" name="title" value="제목"></p>
	<p>카테고리: 
		<input type="checkbox" name="category" value="사진" checked>사진
		<input type="checkbox" name="category" value="워드">워드
		<input type="checkbox" name="category" value="음원">음원</p>	
	<p>첨부파일: <input type="file" name="attachedfile" multiple></p>
	<p><input type="submit" value="전송"></p>
</form>
</html>