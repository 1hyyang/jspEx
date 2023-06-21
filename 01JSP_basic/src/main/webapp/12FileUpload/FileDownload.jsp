<%@page import="java.io.FileNotFoundException"%>
<%@page import="common.JSFunction"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 다운로드</title>
</head>
<body>
<%
	String saveDirectory = "C:/upload";
	String ofile = request.getParameter("ofile");
	String sfile = request.getParameter("sfile");	
	try{
		File file = new File(saveDirectory, sfile);
		System.out.println(file);
		
		// 파일 입력 스트림 생성
		InputStream inputStream = new FileInputStream(file);
		// 한글 파일명 깨짐 방지
		String client = request.getHeader("User-Agent");
		// ie체크
		if(client.indexOf("WOW64")==-1){
			ofile = new String(ofile.getBytes("UTF-8"), "ISO-8859-1");
		} else{
			ofile = new String(ofile.getBytes("KSC5601"), "ISO-8859-1");
		}
		// 파일 다운로드용 응답 헤더 설정
		response.reset();
		// 파일 다운로드 창을 띄우기 위한 콘텐츠 타입을 지정
		// octet-stream은 8비트 단위의 바이너리 데이터를 의미
		response.setContentType("application/octet-stream");
		// 원본 파일 이름으로 다운로드 받을 수 있도록 설정하는 부분
		response.setHeader("Content-Disposition", "attachment; filename=\"" + ofile + "\"");
		response.setHeader("Content-Length", "" + file.length()); 
		
		// 출력 스트림을 초기화
		// 기존 out 객체를 비우고 새로 사용할 준비를 한다.
		out.clear();
		out = pageContext.pushBody();
		
		// response 내장 객체로부터 새로운 출력 스트림을 생성
		OutputStream outputStream = response.getOutputStream();
		// 출력 스트림에 파일 내용 출력
		byte[] byteArr = new byte[(int)file.length()];
		int readBuffer = 0;
		while((readBuffer=inputStream.read(byteArr))>0){
			outputStream.write(byteArr, 0, readBuffer);
		}
		
		// 입출력 스트림 닫기
		inputStream.close();
		outputStream.close();
	} catch (FileNotFoundException e){
		JSFunction.alertBack("파일을 찾을 수 없습니다.", out);	
	} catch (Exception e){
		JSFunction.alertBack("파일 다운로드 중 오류가 발생했습니다.", out);
	}
	
%>
</body>
</html>