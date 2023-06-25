package mvcboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;

/**
 * Servlet implementation class PassController
 */
@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// mode : 수정(edit), 삭제(delete)
				request.setAttribute("mode", request.getParameter("mode"));
				request.setAttribute("idx", request.getParameter("idx"));
				
				request.getRequestDispatcher("/14MVCBoard/Pass.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		String mode = request.getParameter("mode");
		String pass = request.getParameter("pass");
		
		BoardDao dao = new BoardDao();
		// 게시글의 비밀번호가 일치하는지 확인
		if(dao.confirmPassword(pass, idx)) {
			if(mode.equals("edit")) {
				response.sendRedirect("../mvcboard/edit.do?idx=" + idx);
			} else if(mode.equals("delete")) {
				if(dao.deletePost(idx)>0) {
					JSFunction.alertLocation(response, "../mvcboard/list.do", "삭제되었습니다.");
				} else {
					JSFunction.alertBack(response, "게시물 삭제 중 오류가 발생하였습니다.");					
				}
			}
		} else {
			JSFunction.alertBack(response, "비밀번호가 일치하지 않습니다.");
		}
	}

}