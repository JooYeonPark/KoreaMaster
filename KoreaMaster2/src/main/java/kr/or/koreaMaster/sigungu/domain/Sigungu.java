package kr.or.koreaMaster.sigungu.domain;

public class Sigungu {
		
	private int no;
	private String sigunName;
	private String guName;
	private int sidoNum;
	
	
	public Sigungu() {
		this(0, null, null, 0);
	}
	
	public Sigungu(String sigunName, String guName, int sidoNum) {
		this(0, sigunName, guName, sidoNum);
	}

	public Sigungu(int no, String sigunName, String guName, int sidoNum) {
		this.no = no;
		this.sigunName = sigunName;
		this.guName = guName;
		this.sidoNum = sidoNum;
	}

	
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSigunName() {
		return sigunName;
	}

	public void setSigunName(String sigunName) {
		this.sigunName = sigunName;
	}

	public String getGuName() {
		return guName;
	}

	public void setGuName(String guName) {
		this.guName = guName;
	}

	public int getSidoNum() {
		return sidoNum;
	}

	public void setSidoNum(int sidoNum) {
		this.sidoNum = sidoNum;
	}

	@Override
	public String toString() {
		return "Sigungu [no=" + no + ", sigunName=" + sigunName + ", guName=" + guName + ", sidoNum=" + sidoNum + "]";
	}
	
	
	
}
