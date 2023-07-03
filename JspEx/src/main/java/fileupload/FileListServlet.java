package fileupload;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/12FileUpload/FileList.do")
public class FileListServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FileDao dao = new FileDao();
		List<FileDto> filelist = dao.getFileList();
		req.setAttribute("filelist", filelist);
		req.getRequestDispatcher("FileList.jsp").forward(req, resp);
	}

	public FileListServlet() {
		// TODO Auto-generated constructor stub
	}

}
