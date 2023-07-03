package el;

public class MyELClass {

	public MyELClass() {
		// TODO Auto-generated constructor stub
	}

	// 주민번호를 입력 받아 성별을 반환하는 메소드
	public String getGender(String jumin) {
		String res = "";
		try {
			int startindex = jumin.indexOf("-")+1;
			int endindex = startindex+1;
			// 시작 인덱스 (포함), 끝 인덱스 (불포함)
			String gender = jumin.substring(startindex, endindex);
			if(gender.equals("1") || gender.equals("3")) {
				res = "남자";
			} else if(gender.equals("2") || gender.equals("4")) {
				res = "여자";
			} else {
				// 예외를 발생시킴
				throw new Exception();
			}
		} catch (Exception e) {
			res = "주민등록번호를 확인하세요.";
		}
		return res;
	}

	// 입력 받은 문자열이 숫자인지 판별하는 정적 메소드
	public static boolean isNumber(String str) {
//		try {
//			Integer.parseInt(value);
//			return true;
//		} catch (Exception e) {
//			return false;
//		}
		
		char[] charArray = str.toCharArray();
		for(int i=0; i<charArray.length; i++) {
			if(!(charArray[i]>='0' && charArray[i]<='9')) {
				System.out.println(charArray[i] + " -> 문자가 포함되어 있습니다.");
				return false;
			} else {
				System.out.println(charArray[i] + " -> 숫자입니다.");
			}
		}
		return true;
	}
	
	// 입력 받은 정수까지 구구단을 HTML 테이블로 출력하는 메소드
	public static String showGugudan(int dan) {
		// StringBuffer는 내부의 문자열 변경 가능 (연결, 삽입, 삭제 등)
		StringBuffer gugudan = new StringBuffer();
		gugudan.append("<table border='1'>");
		for(int m=2; m<=dan; m++) {
			gugudan.append("<tr>");
			for(int n=1; n<=9; n++) {
				gugudan.append("<td>");
				gugudan.append(m + "*" + n + "=" + m*n);
				gugudan.append("</td>");
			}
			gugudan.append("</tr>");
		}
		gugudan.append("</table>");
		return gugudan.toString();
	}
	
	public static void main(String[] args) {
		MyELClass myELClass = new MyELClass();
		System.out.println(myELClass.getGender("001225-0000000"));		
		System.out.println(MyELClass.isNumber("12a34b"));
		System.out.println(MyELClass.showGugudan(4));
	}
	
}
