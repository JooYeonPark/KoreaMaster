package kr.or.koreaMaster.place.domain;

public class Sido {
		
	private int no;
	private String name;
	
	// 생성자
	public Sido() {
		this(0, null);
	}
	
	public Sido(String name) {
		this(0, name);
	}

	public Sido(int no, String name) {
		this.no = no;
		this.name = name;
	}

	
	// Getter & Setter
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	
	@Override
	public String toString() {
		return "Sido [no=" + no + ", name=" + name + "]";
	}
	
	
}
