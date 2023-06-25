package mvcboard;

public class Criteria {
	
	private String searchfield = "";
	private String searchword = "";
	
	int pageno = 1; // 요청한 페이지 번호
	int amount = 10; // 페이지당 보이는 게시물 수	
	int startnum = 1; // 요청한 페이지의 시작 ROWNUM
	int endnum = 10; // 요청한 페이지의 끝 ROWNUM
	
	public Criteria() {
		// TODO Auto-generated constructor stub
	}
	
	public Criteria(String pagenoStr) {
		// pagenoStr이 null이면 pageno에 초기값을 설정하고 null이 아닌 경우에만 다음 조건문을 실행
		if(pagenoStr!=null) {
			pageno = Integer.parseInt(pagenoStr);
			if(pageno>0) {
				this.pageno = pageno;
				endnum = pageno*amount;
				startnum = (pageno*amount)-(amount-1);
			} else {
				pageno = 1;
			}		
		}
	}

	public Criteria(String searchfield, String searchword, String pagenoStr) {
		if(searchword!=null) {
			this.searchfield = searchfield;
			this.searchword = searchword;
		}
		
		// !"".equals(pagenoStr) 조건을 작성하는 까닭
		// 처음 목록을 조회할 때 pagenoStr에 빈 문자열""이 들어온다.
		// 이때 pagenoStr!=null이므로 if문 안의 Integer.parseInt(pagenoStr)를 시도하는데
		// 빈 문자열을 정수 값으로 파싱하려고 하면 오류가 발생하므로 이 오류를 방지하기 위함이다.
		if(pagenoStr!=null && !"".equals(pagenoStr)) {
			pageno = Integer.parseInt(pagenoStr);
			if(pageno>0) {
				this.pageno = pageno;
				endnum = pageno*amount;
				startnum = (pageno*amount)-(amount-1);
			} else {
				pageno = 1;
			}
		} 		
	}
	
	public String getSearchfield() {
		return searchfield;
	}
	
	public void setSearchfield(String searchfield) {
		this.searchfield = searchfield;
	}
	
	public String getSearchword() {
		return searchword;
	}
	
	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}
	
	public int getPageno() {
		return pageno;
	}
	
	public void setPageno(int pageno) {
		this.pageno = pageno;
	}
	
	public int getAmount() {
		return amount;
	}
	
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public int getStartnum() {
		return startnum;
	}
	
	public void setStartnum(int startnum) {
		this.startnum = startnum;
	}
	
	public int getEndnum() {
		return endnum;
	}
	
	public void setEndnum(int endnum) {
		this.endnum = endnum;
	}

}