package kr.or.koreaMaster.spot.domain;

public class Spot {
	
	private int no;
	private int cityNo;
	private String name;
	private String detail;
	private String addressDetail;
	private String operatingHour;
	private String closedDate;
	private String phone;
	private String fare;
	private String homepage;
	private String picture;
	private double latitude;
	private double longitude;
	private int useNum;
	
	/* 생성자 */
	public Spot() { 
		this(0, 0, null, null, null, null, null, null, null, null, null, 0, 0, 0);
	}
	

	public Spot(int cityNo, String name, String detail, String addressDetail, String operatingHour, String closedDate,
			String phone, String fare, String homepage, String picture, double latitude, double longitude) {
		this(0, cityNo, name, detail, addressDetail, operatingHour, closedDate, phone, fare, homepage, picture, latitude, longitude, 0);
	}

	public Spot(int no, int cityNo, String name, String detail, String addressDetail, String operatingHour, String closedDate,
			String phone, String fare, String homepage, String picture, double latitude, double longitude, int useNum) {
		this.no = no;
		this.cityNo = cityNo;
		this.name = name;
		this.detail = detail;
		this.addressDetail = addressDetail;
		this.operatingHour = operatingHour;
		this.closedDate = closedDate;
		this.phone = phone;
		this.fare = fare;
		this.homepage = homepage;
		this.picture = picture;
		this.latitude = latitude;
		this.longitude = longitude;
		this.useNum = useNum;
	}
	
	
	/*  Getter & Setter */
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCityNo() {
		return cityNo;
	}
	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getOperatingHour() {
		return operatingHour;
	}
	public void setOperatingHour(String operatingHour) {
		this.operatingHour = operatingHour;
	}
	public String getClosedDate() {
		return closedDate;
	}
	public void setClosedDate(String closedDate) {
		this.closedDate = closedDate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFare() {
		return fare;
	}
	public void setFare(String fare) {
		this.fare = fare;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public int getUseNum() {
		return useNum;
	}
	public void setUseNum(int useNum) {
		this.useNum = useNum;
	}


	@Override
	public String toString() {
		return "Spot [no=" + no + ", cityNo=" + cityNo + ", name=" + name + ", detail=" + detail + ", address="
				+ addressDetail + ", operatingHour=" + operatingHour + ", closedDate=" + closedDate + ", phone=" + phone
				+ ", fare=" + fare + ", homepage=" + homepage + ", picture=" + picture + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", useNum=" + useNum + "]";
	}
	
}
