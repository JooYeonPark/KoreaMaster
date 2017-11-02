package kr.or.koreaMaster.spotTheme.domain;

public class SpotThemeJoin {
	private int spotNo;
	private int themeNo;
	private String latitude;
	private String longitude;
	
	/** 생성자 */
	public SpotThemeJoin() {}
	
	public SpotThemeJoin(int spotNo, int themeNo, String latitude, String longitude) {
		super();
		this.spotNo = spotNo;
		this.themeNo = themeNo;
		this.latitude = latitude;
		this.longitude = longitude;
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

	@Override
	public String toString() {
		return "SpotThemeJoin [spotNo=" + spotNo + ", themeNo=" + themeNo + ", latitude=" + latitude + ", longitude="
				+ longitude + "]";
	}
	
	
}
