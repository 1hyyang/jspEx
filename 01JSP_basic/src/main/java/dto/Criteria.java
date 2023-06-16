package dto;

public class Criteria {
	
	private String searchfield;
	private String searchword;
	
	int pageno = 1; // 요청한 페이지 번호 - 1로 초기화
	int amount = 10; // 페이지당 보이는 게시물 수 - 10으로 초기화	
	
	int startno = 1; // 페이지 블록 시작 번호 - 1로 초기화
	int endno = 10;	// 페이지 블록 끝 번호 - 10으로 초기화
	
	public Criteria(int pageno) {
		if(pageno>0) {
			this.pageno = pageno;
			endno = pageno*amount;
			startno = (pageno*amount)-(amount-1);
		}
	}
	
	public Criteria(String searchfield, String searchword, String pagenoStr) {
		if(searchword!=null) {
			this.searchfield = searchfield;
			this.searchword = searchword;
		}
		
		if(pagenoStr!=null) {
			pageno = Integer.parseInt(pagenoStr);
			if(pageno>0) {
				this.pageno = pageno;
				endno = pageno*amount;
				startno = (pageno*amount)-(amount-1);
			} else {
				pageno = 1;
			}
		} 		
	}
	
	public Criteria(int pageno, int amount) {
		this.pageno = pageno;
		this.amount = amount;
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
	
	public int getStartno() {
		return startno;
	}
	
	public void setStartno(int startno) {
		this.startno = startno;
	}
	
	public int getEndno() {
		return endno;
	}
	
	public void setEndno(int endno) {
		this.endno = endno;
	}

}
