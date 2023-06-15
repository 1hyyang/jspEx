package dto;

public class Criteria {
	
	private String searchfield;
	private String searchword;
	
	int pageNo = 1; // 요청한 페이지 번호 - 1로 초기화
	int amount = 10; // 페이지당 보이는 게시물 수 - 10으로 초기화
	
	int startNo = 1; // ROWNUM의 시작 번호 - 1로 초기화
	int endNo = 10;	 // ROWNUM의 끝 번호 - 10으로 초기화
	
	public Criteria(int pageNo) {
		if(pageNo>0) {
			this.pageNo = pageNo;
			endNo = pageNo*amount;
			startNo = (pageNo*amount)-(amount-1);
		}
	}

	public Criteria(String searchfield, String searchword, int pageNo) {
		this.searchfield = searchfield;
		this.searchword = searchword;
		if(pageNo>0) {
			this.pageNo = pageNo;
			endNo = pageNo*amount;
			startNo = (pageNo*amount)-(amount-1);
		}
	}
	
	public Criteria(int pageNo, int amount) {
		super();
		this.pageNo = pageNo;
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
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

}
