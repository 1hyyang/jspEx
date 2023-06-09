package util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

	public CookieManager() {
		// TODO Auto-generated constructor stub
	}
	
	// 이름, 값, 유지 시간을 매개 변수로 받아서 쿠키를 생성 후 응답 객체에 담기
	public static void makeCookie(
			HttpServletResponse response, String cookieName, String cookieValue, int cookieTime) {
		Cookie cookie = new Cookie(cookieName, cookieValue);
		cookie.setPath("/");
		cookie.setMaxAge(cookieTime);
		response.addCookie(cookie);
	}
	
	// 쿠키 이름을 매개 변수로 받아서 쿠키 값을 반환
	public static String readCookie(HttpServletRequest request, String cookieName) {
		String cookieValue = "";
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
			for(Cookie cookie:cookies) {
				// 쿠키 배열로부터 받아 온 쿠키 요소의 이름을 하나씩 변수에 저장
				String cName = cookie.getName();
				// 찾고자 하는 쿠키 이름(파라미터로 받아 온 쿠키 이름)과 배열로부터 받아온 쿠키 요소의 이름을 비교하여 
				// 일치하면 쿠키 요소의 값을 반환
				if(cookieName.equals(cName)) {
					cookieValue = cookie.getValue();
					break;
				}
			}
		}
		return cookieValue;
	}
	
	// 쿠키 이름을 매개 변수로 받아서 쿠키 삭제
	public static void deleteCookie(HttpServletResponse response, String cookieName) {
		makeCookie(response, cookieName, "", 0);
	}
} 
