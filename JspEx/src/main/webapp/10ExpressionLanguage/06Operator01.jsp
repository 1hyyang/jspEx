<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL)-연산자 활용</title>
</head>
<body>
<%
	int num1 = 1;
	pageContext.setAttribute("num2", 2);
	pageContext.setAttribute("num3", "3");
	pageContext.setAttribute("num4", "4");
%>
<h2>변수 선언 및 할당</h2>
<ul>
	<li>스크립틀릿에서 선언한 변수: ${ num1 }</li>	<!-- 영역에 저장되지 않았으므로 출력되지 않음 -->
	<li>페이지 영역에서 선언한 변수: ${ num2 }</li>	
	
	<!-- 3.0부터 대입 연산자=를 이용하여 값을 대입할 수 있다. -->
	<!-- 값을 대입 후 출력 -->
	<li>변수 할당 및 즉시 출력: ${ num1 = 10 }</li>
	<!-- 값을 대입하고 출력하지 않음 -->
	<li>변수 할당 및 별도 출력: ${ num2 = 20;'' } => ${ num2 }</li>
</ul>

num1=${ num1 }, num2=${ num2 }, num3=${ num3 }

<h2>산술 연산자</h2>
num1+num2 = ${ num1+num2 }<br>
num1-num2 = ${ num1-num2 }<br>
num1*num2 = ${ num1*num2 }<br>
num1/num2 = ${ num1/num2 }<br>
num1%num2 = ${ num1%num2 }<br><br>

<!-- 표현 언어(EL)을 이용하면 산술 연산시 자동으로 숫자로 변환 -->
<!-- div : 나누기 (문자 형태의 연산자) -->
num3 div num4 = ${ num3 div num4 }<br> 
<!-- mod : 나머지 (문자 형태의 연산자) -->
num3 mod num4 = ${ num3 mod num4 }<br><br>

<!-- 더하기 연산자+는 덧셈만 가능 (문자열 연결 기능 없음) -->
num3+num4 = ${ num3+num4 }<br>
num1+"2345" = ${ num1+"2345" }<br>
num2+"이십" = \${ num2+"이십" } --에러 발생<br>

<h2>비교 연산자</h2>
<!-- 문자 형태의 연산자 -->
num4 > num3 : ${ num4 gt num3 }<br>
num1 < num3 : ${ num1 lt num3 }<br>
num2 >= num4 : ${ num2 ge num4 }<br>
<!-- 문자 형태의 연산자를 사용하여 코드를 더 직관적으로 작성할 수 있다. -->
num1 == num4 : ${ num1 eq num4 }<br>

<h2>논리 연산자</h2>
num3 <= num4 && num3 == num4 : ${ num3 le num4 and num3 eq num4 }<br>
num3 >= num4 || num3 != num4 : ${ num3 ge num4 or num3 ne num4 }<br>
</body>
</html>