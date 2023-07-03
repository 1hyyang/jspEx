<%@page import="util.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창 제어</title>
<style>
	div#popup {
	    position: absolute; top:100px; left:50px; color:yellow;  
	    width:270px; height:100px; background-color:gray;
	}
	div#popup>div {
	    position: relative; background-color:#ffffff; top:0px;
	    border:1px solid gray; padding:10px; color:black;
	}
	.off {
		display: none;
	}
</style>
<script>
	window.onload = function(){
		closeBtn.addEventListener("click", function(){
			popup.style.display = "none";
			var chkVal = document.querySelector("input[id=inactiveToday]:checked");
			if(chkVal!==null && chkVal.value==1){
				// 쿠키 생성 요청
				console.log("쿠키 생성 요청")
				// 지정된 URL에 http 요청을 보내고 응답을 받아온다.
				fetch("02PopupCookie.jsp")
				// 요청 결과가 성공이면
		        // 응답 객체 data를 받아 와서 data.json()을 호출한다.
		        // data.json() : json 형식의 문자열을 자바스크립트 객체로 파싱
				.then(data => data.json())
				// 파싱된 데이터를 jsObj 변수에 전달 받는다.
				.then(jsObj => {
					console.log("02PopupCookie.jsp 호출");
				})
			}
		});
	}
</script>
</head>
<body>
<%
	String popupClose = CookieManager.readCookie(request, "popupClose");
	// 쿠키에 popupClose가 등록되어 있으면 class 속성을 이용하여 팝업창을 보이지 않게 한다.
	String off = popupClose.equals("")?"":"off";
%>
<h1>쿠키를 이용한 팝업창 제어</h1>
<div id="popup" class="<%= off %>">
    <h2 align="center">공지사항 팝업입니다.</h2>
    <div align="right">
	    <form name="popFrm">
	        <input type="checkbox" id="inactiveToday" value="1" /> 
	        하루 동안 열지 않음
	        <input type="button" value="닫기" id="closeBtn" /> 
	    </form>
    </div>
</div>
</body>
</html>