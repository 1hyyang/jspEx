package mvcboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import common.FileUtil;
import common.JSFunction;

public class WriteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
				= new MultipartRequest(req, saveDirectory, maxPostSize, encoding);
			
			// MultipartRequest 객체를 통해 폼 요소의 값을 받아 와서 변수에 저장
			String name = mRequest.getParameter("name");
			String title = mRequest.getParameter("title");
			String content = mRequest.getParameter("content");
			String ofile = "";
			String sfile = "";			
			String pass = mRequest.getParameter("pass");
			// getFilesystemName("name속성값")는 파일의 이름을 가져 오는 메소드
			// getParameter("name속성값")가 value 값을 가져 오는 것과 다르다.
			// 만약 첨부된 파일이 없다면 폼의 ofile의 value는 빈 문자열""로 설정되지만 
			// mRequest.getFilesystemName("ofile")는 null이 된다.
			if(mRequest.getFilesystemName("ofile")!=null) {
				ofile = mRequest.getFilesystemName("ofile");		
				// 동일한 파일명이 업로드되는 경우 기존 파일이 소실될 위험이 있으므로 파일명을 변경하여 DB에 저장
				// 기존 파일명 뒤에 현재 시간을 붙인 새로운 파일명 생성
				// 첨부파일의 확장자 - .부터 끝까지
				String extension = ofile.substring(ofile.lastIndexOf("."));
				// 확장자를 제외한 파일의 이름
				String originalfileName = ofile.substring(0, ofile.lastIndexOf("."));
				// 현재 시간
				// H : 0~23시, m : 00~59분, s : 00~59초, S : 0~999밀리세컨드
				String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
				// 새로운 파일명 생성
				sfile = originalfileName + "_" + now + extension;
				// 새로운 파일명으로 파일 저장
				// File(파일경로)
				File oldfile = new File(saveDirectory + File.separator + ofile);
				File newfile = new File(saveDirectory + File.separator + sfile);
				oldfile.renameTo(newfile);
			}
			BoardDto board = new BoardDto(0, name, title, content, "", ofile, sfile, 0, pass, 0);
			
			BoardDao dao = new BoardDao();
			if(dao.insertPost(board)>0) {
				JSFunction.alertLocation(resp, "게시물이 등록되었습니다.", "../mvcboard/view.do?idx=" + dao.insertPostIdx(name, pass));
			} else {
				JSFunction.alertBack(resp, "게시물 등록 중 오류가 발생하였습니다.");
			}
		} catch (Exception e){
			e.printStackTrace();
			req.setAttribute("eMessage", "파일 등록 중 오류 발생");
		}
	}
	
	public WriteController() {
		// TODO Auto-generated constructor stub
	}

}
