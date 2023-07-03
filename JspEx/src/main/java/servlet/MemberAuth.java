package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.Member;

public class MemberAuth extends HttpServlet {
	
	MemberDao dao;
	
	@Override
	public void init() throws ServletException {
		dao = new MemberDao();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String adminid = this.getInitParameter("adminid");
		
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
		Member member = dao.login(userid, userpw);
		
		if(member!=null) {
			req.setAttribute("authMessage", member.getName() + "님 환영합니다.");
			
			if(member.getId().equals(adminid)) {
				req.setAttribute("authMessage", "관리자 계정입니다.");
			}
		} else {
			req.setAttribute("authMessage", "일치하는 아이디/비밀번호가 없습니다.");
		}
		req.getRequestDispatcher("04MemberAuth.jsp").forward(req, resp);
	}
	
	public MemberAuth() {
		// TODO Auto-generated constructor stub
	}

}
