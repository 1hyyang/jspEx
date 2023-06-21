<%@page import="common.JSFunction"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="fileupload.FileDao"%>
<%@page import="fileupload.FileDto"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
<%
	// 저장할 디렉토리의 실제 경로
	String saveDirectory = "C:/upload";
	// 파일의 최대 크기
	int maxPostSize = 1024*1000;
	// 인코딩 방식
	String encoding = "UTF-8";
	try{
		// MultipartRequest 객체 생성
		// 생성자의 매개 변수로 저장 경로, 파일의 최대 크기, 인코딩 방식을 지정
		// 객체가 정상적으로 생성되면 파일이 업로드된다.
		MultipartRequest mRequest 
			= new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
		
		// MultipartRequest 객체를 통해 폼 요소의 값을 받아 와서 변수에 저장
		String name = mRequest.getParameter("name");
		String title = mRequest.getParameter("title");
		// 체크박스는 배열로 받은 후 문자열로 연결해서 저장 
		String[] categoryArr = mRequest.getParameterValues("category");
		StringBuffer cate = new StringBuffer();
		if(categoryArr==null){
			cate.append("선택없음");
		} else{
			for(String category:categoryArr){
				cate.append(category + " ");
			}			
		}	
		String originalfile = mRequest.getFilesystemName("attachedfile");		
		// 동일한 파일명이 업로드되는 경우 기존 파일이 소실될 위험이 있으므로 파일명을 변경하여 DB에 저장
		// 기존 파일명 뒤에 현재 시간을 붙인 새로운 파일명 생성
		// 첨부파일의 확장자 - .부터 끝까지
		String extension = originalfile.substring(originalfile.lastIndexOf("."));
		// 확장자를 제외한 파일의 이름
		String originalfileName = originalfile.substring(0, originalfile.lastIndexOf("."));
		// 현재 시간
		// H : 0~23시, m : 00~59분, s : 00~59초, S : 0~999밀리세컨드
		String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
		// 새로운 파일명 생성
		String savedfile = originalfileName + "_" + now + extension;
		// 새로운 파일명으로 파일 저장
		// File(파일경로)
		File oldfile = new File(saveDirectory + File.separator + originalfile);
		File newfile = new File(saveDirectory + File.separator + savedfile);
		oldfile.renameTo(newfile);
		// DTO 생성
		FileDto file = new FileDto(0, name, title, cate.toString(), originalfile, savedfile, "");
		// DAO를 통해 DB에 등록
		FileDao dao = new FileDao();
		if(dao.insertFile(file)>0){	
			JSFunction.alertLocation("파일이 등록되었습니다.", "FileList.jsp", out);
		} else{
			JSFunction.alertBack("파일 등록 중 오류가 발생하였습니다.", out);
		}
	} catch (Exception e){
		e.printStackTrace();
		out.print(e);
		request.setAttribute("eMessage", "파일 등록 중 오류 발생");
	}	
%>
</body>
</html>