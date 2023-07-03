package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class XmlMapping extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "XmlMapping.do 호출");
		
		// PrintWriter out = res.getWriter();
		// out.print("XmlMapping.do 호출");
		
		// request 영역이 공유되지 않는다.
		// resp.sendRedirect("01HelloServlet.jsp");	
		
		// request 영역이 공유된다.
		req.getRequestDispatcher("01HelloServlet.jsp").forward(req, resp);		
	}
	
	public XmlMapping() {
		// TODO Auto-generated constructor stub
	}

}
