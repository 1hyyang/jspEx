package mvcboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 리스트 조회
		String searchfield = req.getParameter("searchfield");
		String searchword = req.getParameter("searchword");
		String pageno = req.getParameter("pageno");	
		Criteria criteria = new Criteria(searchfield, searchword, pageno);
		
		BoardDao dao = new BoardDao();
		List<BoardDto> boardlist = dao.getListPage(criteria);
		
		int totalcount = dao.getTotalcount(criteria);
		
		// request 영역에 저장
		req.setAttribute("boardlist", boardlist);
		// 페이지 전환
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
	}
	
	public ListController() {
		// TODO Auto-generated constructor stub
	}

}
