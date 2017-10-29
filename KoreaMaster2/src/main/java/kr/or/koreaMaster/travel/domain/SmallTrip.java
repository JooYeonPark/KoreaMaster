package kr.or.koreaMaster.travel.domain;

public class SmallTrip {
	private int dayNo;
	private int tripNo;
	private int routeNo;
	
	/** 생성자 */
	public SmallTrip() {
		this(0,0,0);
	}
	public SmallTrip(int dayNo, int tripNo, int routeNo) {
		this.dayNo = dayNo;
		this.tripNo = tripNo;
		this.routeNo = routeNo;
	}
	
	/** Getter, Setter */
	
	public int getDayNo() {
		return dayNo;
	}
	public void setDayNo(int dayNo) {
		this.dayNo = dayNo;
	}
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
	@Override
	public String toString() {
		return "SmallTrip [dayNo=" + dayNo + ", tripNo=" + tripNo + ", routeNo=" + routeNo + "]";
	}
	
	
}
