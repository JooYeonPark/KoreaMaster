package kr.or.koreaMaster.travel.domain;

public class RouteTheme {
	private int themeNo;
	private int tripNo;
	
	/** 생성자 */
	public RouteTheme() {
		this(0,0);
	}
	
	public RouteTheme(int themeNo, int tripNo) {
		this.themeNo = themeNo;
		this.tripNo = tripNo;
	}
	public int getThemeNo() {
		return themeNo;
	}
	
	/** Getter, Setter */
	public void setThemeNo(int themeNo) {
		this.themeNo = themeNo;
	}
	public int getTripNo() {
		return tripNo;
	}
	public void setTripNo(int tripNo) {
		this.tripNo = tripNo;
	}

	@Override
	public String toString() {
		return "RouteTheme [themeNo=" + themeNo + ", tripNo=" + tripNo + "]";
	}
	
	
}
