package mvcboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;

/**
 * Servlet implementation class ViewController
 */
@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDao dao = new BoardDao();
		dao.updateVisitcount(request.getParameter("idx"));
		
		BoardDto board = dao.selectPost(request.getParameter("idx"));
		if(board==null){
			JSFunction.alertBack(response, "존재하지 않는 게시물입니다.");
			return;  // 아래의 코드를 더 이상 실행하지 않고 종료한다. 
					 // return문이 없으면 아래의 코드가 실행되고, 이때 board 객체가 null이므로 NullPointerException이 발생
		}

		request.setAttribute("board", board);

		request.getRequestDispatcher("../14MVCBoard/View.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
