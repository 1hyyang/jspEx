package mvcboard;

import java.io.IOException;
import java.util.List;
import mvcboard.BoardDto;
import mvcboard.BoardDao;
import mvcboard.Criteria;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String searchfield = req.getParameter("searchfield");
		String searchword = req.getParameter("searchword");
		String pageno = req.getParameter("pageno");
		
		// 검색 조건(없으면 빈 문자열"")에 알맞은 목록 조회
		Criteria criteria = new Criteria(searchfield, searchword, pageno);		
		BoardDao dao = new BoardDao();
		List<BoardDto> boardlist = dao.getListPage(criteria);		
		int totalcount = dao.getTotalcount(criteria);
		PageDto pageDto = new PageDto(totalcount, criteria);		
		
		// request 영역에 저장
		req.setAttribute("searchfield", searchfield);		
		req.setAttribute("searchword", searchword);		
		req.setAttribute("boardlist", boardlist);
		req.setAttribute("totalcount", totalcount);
		req.setAttribute("pageDto", pageDto);
		
		// 페이지 전환
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
	}
	
	public ListController() {
		// TODO Auto-generated constructor stub
	}

}
