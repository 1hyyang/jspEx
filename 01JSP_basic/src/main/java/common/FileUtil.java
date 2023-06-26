package common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	
	public FileUtil() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 파일 업로드
	 * multipart/form-data 요청
	 * @return
	 */
	public static MultipartRequest uploadFile(HttpServletRequest request, String saveDirectory, int maxPostSize) {
		try {
			return new MultipartRequest(request, saveDirectory, maxPostSize, "UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 파일 다운로드
	 * @param request
	 * @param response
	 * @param saveDirectory
	 */
	public static void downloadFile(HttpServletRequest request, HttpServletResponse response
			, String saveDirectory, String ofile, String sfile) {
		// 1. 다운로드할 파일을 찾아 입력 스트림을 생성
		try{
			File file = new File(saveDirectory, sfile);		
			// 파일 입력 스트림 생성
			InputStream inputStream = new FileInputStream(file);
			// 한글 파일명 깨짐 방지
			// User-Agent로 웹 브라우저 종류 알아내기
			String client = request.getHeader("User-Agent");
			// 인터넷 익스플로러가 아니라면
			if(client.indexOf("WOW64")==-1){
				ofile = new String(ofile.getBytes("UTF-8"), "ISO-8859-1");
			} else{
				// 인터넷 익스플로러라면
				ofile = new String(ofile.getBytes("KSC5601"), "ISO-8859-1");
			}
			
			// 2. 파일 다운로드용 응답 헤더 설정
			// 응답 헤더를 초기화
			response.reset();
			// 파일 다운로드 창을 띄우기 위한 콘텐츠 타입을 지정
			// octet-stream은 8비트 단위의 바이너리 데이터를 의미
			response.setContentType("application/octet-stream");
			// 원본 파일 이름으로 다운로드 받을 수 있도록 설정
			response.setHeader("Content-Disposition", "attachment; filename=\"" + ofile + "\"");
			response.setHeader("Content-Length", "" + file.length()); 
			
			// 3. response 내장 객체로부터 새로운 출력 스트림을 생성
			OutputStream outputStream = response.getOutputStream();
			// 출력 스트림에 파일 내용 출력
			byte[] byteArr = new byte[(int)file.length()];
			int readBuffer = 0;
			while((readBuffer = inputStream.read(byteArr))>0){
				outputStream.write(byteArr, 0, readBuffer);
			}
			
			// 입출력 스트림 닫기
			inputStream.close();
			outputStream.close();
		} catch (FileNotFoundException e){
			JSFunction.alertBack(response, "파일을 찾을 수 없습니다.");	
		} catch (Exception e){
			JSFunction.alertBack(response, "파일 다운로드 중 오류가 발생하였습니다.");
		}
	}
	
	/**
	 * 파일 삭제
	 */
	public static void deleteFile(String directory, String filename) {
		File file = new File(directory + File.separator + filename);
		// 파일이 존재하면 제거
		if(file.exists()) {
			file.delete();
		}
	}
}
