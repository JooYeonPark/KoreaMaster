package kr.or.koreaMaster.place.domain;

public class Restaurant {
	private int no;
	private int cityNo;
	private String name;
	private String detail;
	private String adressDetail;
	private String operatingHour;
	private String ClosedDate;
	private String phone;
	private String fare;
	private String picture;
	private double latitude;
	private double longitude;
	private int useNum;
	
	
	public Restaurant() {
		this(0, 0, null, null, null, null, null, null, null, null, 0, 0, 0);
	}
	
	public Restaurant(int cityNo, String name, String detail, String adressDetail, String operatingHour,
			String closedDate, String phone, String fare, String picture, double latitude, double longitude,
			int useNum) {
		this(0, cityNo, name, detail, adressDetail, operatingHour, closedDate, phone, fare, picture, latitude, longitude, useNum);
	}

	public Restaurant(int no, int cityNo, String name, String detail, String adressDetail, String operatingHour,
			String closedDate, String phone, String fare, String picture, double latitude, double longitude,
			int useNum) {
		this.no = no;
		this.cityNo = cityNo;
		this.name = name;
		this.detail = detail;
		this.adressDetail = adressDetail;
		this.operatingHour = operatingHour;
		ClosedDate = closedDate;
		this.phone = phone;
		this.fare = fare;
		this.picture = picture;
		this.latitude = latitude;
		this.longitude = longitude;
		this.useNum = useNum;
	}



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
	public String getAdressDetail() {
		return adressDetail;
	}
	public void setAdressDetail(String adressDetail) {
		this.adressDetail = adressDetail;
	}
	public String getOperatingHour() {
		return operatingHour;
	}
	public void setOperatingHour(String operatingHour) {
		this.operatingHour = operatingHour;
	}
	public String getClosedDate() {
		return ClosedDate;
	}
	public void setClosedDate(String closedDate) {
		ClosedDate = closedDate;
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
		return "Restaurant [no=" + no + ", cityNo=" + cityNo + ", name=" + name + ", detail=" + detail
				+ ", adressDetail=" + adressDetail + ", operatingHour=" + operatingHour + ", ClosedDate=" + ClosedDate
				+ ", phone=" + phone + ", fare=" + fare + ", picture=" + picture + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", useNum=" + useNum + "]";
	}
	
	
}
