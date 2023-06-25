package common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

public class JSFunction {

	public JSFunction() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 알림창을 띄운 후 지정한 URL로 이동합니다.
	 * @param msg
	 * @param url
	 * @param out
	 */
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			// 삽입할 자바스크립트 코드
			String script = ""
							+ "<script>"
							+ "		alert('" + msg + "');"
							+ "		location.href='" + url + "';"
							+ "</script>";
					
			// 화면에 출력
			// 자바스크립트 코드를 out 내장 객체로 출력
			out.print(script);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// out 객체는 JSP 내장 객체이기 때문에 Servlet에서 바로 쓸 수 없으므로 위의 메소드 사용 불가	
	public static void alertLocation(HttpServletResponse resp, String msg, String url) {
		resp.setContentType("text/html;charset=UTF-8");
		try {
			String script = ""
							+ "<script>"
							+ "		alert('" + msg + "');"
							+ "		location.href='" + url + "';"
							+ "</script>";
			PrintWriter writer = resp.getWriter();
			writer.print(script);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 알림창을 띄운 후 이전 페이지로 이동합니다.
	 * @param msg
	 * @param out
	 */
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = ""
							+ "<script>"
							+ "		alert('" + msg + "');"
							+ "		history.go(-1);"
							+ "</script>";
			out.print(script);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void alertBack(HttpServletResponse resp, String msg) {
		resp.setContentType("text/html;charset=UTF-8");
		try {
			String script = "<script>"
							+ "		alert('" + msg + "');"
							+ "		history.back()"
							+ "</script>";
			PrintWriter writer = resp.getWriter();
			writer.print(script);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
