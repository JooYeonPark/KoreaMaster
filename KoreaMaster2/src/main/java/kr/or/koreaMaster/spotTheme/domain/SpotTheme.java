package kr.or.koreaMaster.spotTheme.domain;

public class SpotTheme {
	private int themeNo;
	private int spotNo;
	private int score;
	
	/** 생성자 */
	public SpotTheme() {
		this(0,0,0);
	}
	public SpotTheme(int themeNo, int spotNo) {
		this(themeNo, spotNo, 0);
	}
	public SpotTheme(int themeNo, int spotNo, int score) {
		super();
		this.themeNo = themeNo;
		this.spotNo = spotNo;
		this.score = score;
	}
	
	
	/** Getter, Setter */
	public int getThemeNo() {
		return themeNo;
	}
	public void setThemeNo(int themeNo) {
		this.themeNo = themeNo;
	}
	public int getSpotNo() {
		return spotNo;
	}
	public void setSpotNo(int spotNo) {
		this.spotNo = spotNo;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "SpotTheme [themeNo=" + themeNo + ", spotNo=" + spotNo + ", score=" + score + "]";
	}
	
	
}
