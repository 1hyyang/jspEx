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
		// 리스트 조회
		String searchfield = req.getParameter("searchfield");
		String searchword = req.getParameter("searchword");
		String pageno = req.getParameter("pageno"); // List에서 처음 받아올 때에는 빈 문자열
		Criteria criteria = new Criteria(searchfield, searchword, pageno); // Criteria 객체를 생성할 때 
		
		BoardDao dao = new BoardDao();
		List<BoardDto> boardlist = dao.getListPage(criteria);
		
		int totalcount = dao.getTotalcount(criteria);
		PageDto pageDto = new PageDto(totalcount, criteria);		
		
		// request 영역에 저장
		req.setAttribute("searchfield", criteria.getSearchfield());		
		req.setAttribute("searchword", criteria.getSearchword());		
		req.setAttribute("pageno", criteria.getPageno());
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
