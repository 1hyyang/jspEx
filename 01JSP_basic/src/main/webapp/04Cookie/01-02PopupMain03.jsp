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
				// JavaScript를 활용한 쿠키 생성
				// JavaScript에서는 새로고침해야 생성된 쿠키를 확인할 수 있다. (개발자 도구)
				const date = new Date();
				date.setTime(date.getTime() + 24*60*60*1000); // 24시간
				document.cookie = "popupClose=Y;expires=" + date.toGMTString();
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