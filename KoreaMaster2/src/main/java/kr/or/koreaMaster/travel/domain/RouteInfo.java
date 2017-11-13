package kr.or.koreaMaster.travel.domain;

public class RouteInfo {
	private int tripNo;
	private int routeNo;
	private String sigunName;
	private String guName;
	private String theme;
	private String name;
	private String detail;
	private String addressDetail;
	private String operatingHour;
	private String closedDate;
	private String phone;
	private String fare;
	private String homepage;
	
	/** 생성자 */
	public RouteInfo() {}
	
	public RouteInfo(int tripNo, int routeNo, String sigunName, String guName, String theme, String name, String detail,
			String addressDetail, String operatingHour, String closedDate, String phone, String fare, String homepage) {
		super();
		this.tripNo = tripNo;
		this.routeNo = routeNo;
		this.sigunName = sigunName;
		this.guName = guName;
		this.theme = theme;
		this.name = name;
		this.detail = detail;
		this.addressDetail = addressDetail;
		this.operatingHour = operatingHour;
		this.closedDate = closedDate;
		this.phone = phone;
		this.fare = fare;
		this.homepage = homepage;
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

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
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

	@Override
	public String toString() {
		return "RouteInfo [tripNo=" + tripNo + ", routeNo=" + routeNo + ", sigunName=" + sigunName + ", guName="
				+ guName + ", theme=" + theme + ", name=" + name + ", detail=" + detail + ", addressDetail="
				+ addressDetail + ", operatingHour=" + operatingHour + ", closedDate=" + closedDate + ", phone=" + phone
				+ ", fare=" + fare + ", homepage=" + homepage + "]";
	}

	
}
