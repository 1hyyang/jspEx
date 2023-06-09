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
</style>
<script>
	window.onload = function(){
		// 쿠키에 popupClose 값이 등록되어 있다면 팝업창 코드가 실행되지 않으므로 
		// closeBtn is not defined 에러가 발생
		// 이를 방지하기 위해 closeBtn이 정의되어 있는 경우에만 이벤트 처리가 실행되도록 한다.
		if(typeof closeBtn!="undefined"){
			// 닫기 버튼을 클릭했을 때 이벤트 처리
			closeBtn.addEventListener("click", function(){
				// 체크박스에 체크가 되었다면 popFrm 폼을 submit한다. -> 01-02PopupCookie.jsp 요청
				if(inactiveToday.checked){
					popFrm.submit();
				// 체크가 되지 않았다면 팝업창을 그냥 닫는다.
				} else{
					popup.style.display = "none";			
				}
			});			
		}
	}
</script>
</head>
<body>
<h1>쿠키를 이용한 팝업창 제어</h1>
<%
	String popupClose = CookieManager.readCookie(request, "popupClose");
	// 쿠키에 popupClose 값이 등록되어 있지 않으면 팝업창을 보여준다.
	// => 쿠키에 popupClose 값이 등록되어 있다면 팝업창 코드가 실행되지 않는다. (팝업창을 닫는다.)
	if(!popupClose.equals("Y")){			
%>
<div id="popup">
    <h2 align="center">공지사항 팝업입니다.</h2>
    <div align="right">
	    <form name="popFrm" action="01-02PopupCookie.jsp">
	        <input type="checkbox" id="inactiveToday" value="1" /> 
	        하루 동안 열지 않음
	        <input type="button" value="닫기" id="closeBtn" /> 
	    </form>
    </div>
</div>
<%
	}
%>
</body>
</html>