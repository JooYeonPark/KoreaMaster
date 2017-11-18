package kr.or.koreaMaster.user.model;

public class TripNoteDetail {
	private int routeNo;
	private String startTime;
	private String endTime;
	private int spotNo;
	private String spotName;
	private String spotDetail;
	private String spotPicture;
	
	
	public int getRouteNo() {
		return routeNo;
	}
	public void setRouteNo(int routeNo) {
		this.routeNo = routeNo;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public int getSpotNo() {
		return spotNo;
	}
	public void setSpotNo(int spotNo) {
		this.spotNo = spotNo;
	}
	public String getSpotName() {
		return spotName;
	}
	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}
	public String getSpotDetail() {
		return spotDetail;
	}
	public void setSpotDetail(String spotDetail) {
		this.spotDetail = spotDetail;
	}
	public String getSpotPicture() {
		return spotPicture;
	}
	public void setSpotPicture(String spotPicture) {
		this.spotPicture = spotPicture;
	}
	
}