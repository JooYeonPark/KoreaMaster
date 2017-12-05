package kr.or.koreaMaster.travel.domain;

public class RouteInfo {
	private int tripNo;
	private int routeNo;
	private int nextRouteNo;
	private int dayNo;
	private int spotNo;
	private int cityNo;
	private String sigunName;
	private String guName;
	private int themeNo;
	private String themeName;
	private String spotName;
	private String tripName;
	private String detail;
	private String addressDetail;
	private String operatingHour;
	private String closedDate;
	private String phone;
	private String fare;
	private String homepage;
	private double latitude;
	private double longitude;
	
	/** 생성자 */
	public RouteInfo() {}
	public RouteInfo(int tripNo, int routeNo, int nextRouteNo, int dayNo, int spotNo, int cityNo, String sigunName,
			String guName, int themeNo, String themeName, String spotName, String tripName, String detail,
			String addressDetail, String operatingHour, String closedDate, String phone, String fare, String homepage,
			double latitude, double longitude) {
		super();
		this.tripNo = tripNo;
		this.routeNo = routeNo;
		this.nextRouteNo = nextRouteNo;
		this.dayNo = dayNo;
		this.spotNo = spotNo;
		this.cityNo = cityNo;
		this.sigunName = sigunName;
		this.guName = guName;
		this.themeNo = themeNo;
		this.themeName = themeName;
		this.spotName = spotName;
		this.tripName = tripName;
		this.detail = detail;
		this.addressDetail = addressDetail;
		this.operatingHour = operatingHour;
		this.closedDate = closedDate;
		this.phone = phone;
		this.fare = fare;
		this.homepage = homepage;
		this.latitude = latitude;
		this.longitude = longitude;
	}


	/** Getter, Setter */
	
	public int getTripNo() {
		return tripNo;
	}

	public void setTripNo(int tripNo) {
		this.tripNo = tripNo;
	}

	public int getRouteNo() {
		return routeNo;
	}

	public void setRouteNo(int routeNo) {
		this.routeNo = routeNo;
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

	
	public int getThemeNo() {
		return themeNo;
	}





	public void setThemeNo(int themeNo) {
		this.themeNo = themeNo;
	}





	public String getThemeName() {
		return themeName;
	}





	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}





	public String getName() {
		return spotName;
	}

	public void setName(String name) {
		this.spotName = name;
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

	public int getDayNo() {
		return dayNo;
	}

	public void setDayNo(int dayNo) {
		this.dayNo = dayNo;
	}

	
	public int getSpotNo() {
		return spotNo;
	}

	public void setSpotNo(int spotNo) {
		this.spotNo = spotNo;
	}


	public int getNextRouteNo() {
		return nextRouteNo;
	}


	public void setNextRouteNo(int nextRouteNo) {
		this.nextRouteNo = nextRouteNo;
	}

	public int getCityNo() {
		return cityNo;
	}

	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}

	public String getSpotName() {
		return spotName;
	}


	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}


	public String getTripName() {
		return tripName;
	}


	public void setTripName(String tripName) {
		this.tripName = tripName;
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
	@Override
	public String toString() {
		return "RouteInfo [tripNo=" + tripNo + ", routeNo=" + routeNo + ", nextRouteNo=" + nextRouteNo + ", dayNo="
				+ dayNo + ", spotNo=" + spotNo + ", cityNo=" + cityNo + ", sigunName=" + sigunName + ", guName="
				+ guName + ", themeNo=" + themeNo + ", themeName=" + themeName + ", spotName=" + spotName
				+ ", tripName=" + tripName + ", detail=" + detail + ", addressDetail=" + addressDetail
				+ ", operatingHour=" + operatingHour + ", closedDate=" + closedDate + ", phone=" + phone + ", fare="
				+ fare + ", homepage=" + homepage + ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}
	
}
