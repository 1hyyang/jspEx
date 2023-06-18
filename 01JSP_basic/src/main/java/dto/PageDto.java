package dto;

public class PageDto {
	
	int blockamount = 5; // 페이지 블록의 크기
	int startno; // 페이지 블록의 시작 번호
	int endno; // 페이지 블록의 끝 번호	
	int realendno; // 전체 게시물의 끝 페이지 번호
	boolean prev, next; // 이전, 다음 버튼 (true: 보여주기)		
	int total; // 전체 게시물 수	
	Criteria criteria; // pageno 페이지 번호, amount 페이지당 게시물 수
	
	public PageDto() {
		// TODO Auto-generated constructor stub
	}
	
	public PageDto(int total, Criteria criteria) {
		super();
		this.total = total;
		this.criteria = criteria;
		
		// 페이지 블록의 끝 번호
		endno = (int)((Math.ceil(criteria.pageno/(blockamount*1.0)))*blockamount);
		// 페이지 블록의 시작 번호
		startno = endno-(blockamount-1);		
		// 전체 게시물의 끝 페이지 번호
		realendno = (int)(Math.ceil((total*1.0)/criteria.getAmount()));
		
		// 페이지 블록의 끝 번호를 설정
		// 전체 게시물의 끝 페이지 번호보다 큰 경우 전체 게시물의 끝 페이지 번호로 설정
		endno = endno>realendno?realendno:endno;
		
		// 앞으로 이동/뒤로 이동 설정
		prev = startno>1?true:false;
		next = endno==realendno?false:true;
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

	public int getRealendno() {
		return realendno;
	}

	public void setRealendno(int realend) {
		this.realendno = realend;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCriteria() {
		return criteria;
	}

	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}

}
