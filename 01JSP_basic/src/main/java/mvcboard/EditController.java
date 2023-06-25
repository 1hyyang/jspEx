package mvcboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import common.JSFunction;

/**
 * Servlet implementation class EditController
 */
@WebServlet("/mvcboard/edit.do")
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageno = request.getParameter("pageno");
		
		BoardDao dao = new BoardDao();
		BoardDto board = dao.selectPost(request.getParameter("idx"));
		
		request.setAttribute("board", board);
		
		request.getRequestDispatcher("../14MVCBoard/Edit.jsp?pageno=" + pageno).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			int idx = Integer.parseInt(mRequest.getParameter("idx"));
			String name = mRequest.getParameter("name");
			String title = mRequest.getParameter("title");
			String content = mRequest.getParameter("content");
			String ofile = "";
			String sfile = "";			
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
			BoardDto board = new BoardDto(idx, name, title, content, "", ofile, sfile, 0, "", 0);
			
			BoardDao dao = new BoardDao();
			if(dao.updatePost(board)>0) {
				JSFunction.alertLocation(response, "게시물이 등록되었습니다.", "../mvcboard/view.do?idx=" + board.getIdx());
			} else {
				JSFunction.alertBack(response, "게시물 등록 중 오류가 발생하였습니다.");
			}
		} catch (Exception e){
			e.printStackTrace();
			request.setAttribute("eMessage", "파일 등록 중 오류 발생");
		}
	}

}
