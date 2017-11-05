package kr.or.koreaMaster.spotTheme.domain;

public class SpotThemeJoin {
	private int spotNo;
	private int themeNo;
	private String latitude;
	private String longitude;
	private int score;
	private boolean pass;
	private int hitcount; 
	
	/** 생성자 */
	public SpotThemeJoin() {}

	public SpotThemeJoin(int spotNo, int themeNo, String latitude, String longitude, int score, int hitcount) {
		super();
		this.spotNo = spotNo;
		this.themeNo = themeNo;
		this.latitude = latitude;
		this.longitude = longitude;
		this.score = score;
		this.pass = false;
		this.hitcount = hitcount;
	}



	/** Getter, Setter */
	public int getSpotNo() {
		return spotNo;
	}

	public void setSpotNo(int spotNo) {
		this.spotNo = spotNo;
	}

	public int getThemeNo() {
		return themeNo;
	}

	public void setThemeNo(int themeNo) {
		this.themeNo = themeNo;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public boolean getPass() {
		return pass;
	}

	public void setPass(boolean pass) {
		this.pass = pass;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	@Override
	public String toString() {
		return "SpotThemeJoin [spotNo=" + spotNo + ", themeNo=" + themeNo + ", latitude=" + latitude + ", longitude="
				+ longitude + ", score=" + score + ", pass=" + pass + ", hitcount=" + hitcount + "]";
	}
	
	
	
}
