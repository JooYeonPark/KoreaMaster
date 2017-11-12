package kr.or.koreaMaster.travel.domain;

public class Route {
	private int no;
	private int spotNo;
	private int nextRouteNo;
	private String startTime;
	private String endTime;

	
	/** 생성자 */	
	public Route() {
		this(0,0,0,null,null);
	}
	
	public Route(int spotNo, int nextRouteNo) {
		this(0,spotNo, nextRouteNo, null, null);
	}
	
	public Route(int no, int spotNo, int nextRouteNo) {
		this(no, spotNo, nextRouteNo, null, null);
	}
	
	
	public Route(int spotNo, int nextRouteNo, String startTime, String endTime) {
		this(0,spotNo, nextRouteNo, startTime, endTime);
	}
	
	public Route(int no, int spotNo, int nextRouteNo, String startTime, String endTime) {
		super();
		this.no = no;
		this.spotNo = spotNo;
		this.nextRouteNo = nextRouteNo;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	
	
	/** Getter, Setter */
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSpotNo() {
		return spotNo;
	}

	public void setSpotNo(int spotNo) {
		this.spotNo = spotNo;
	}

	public int getnextRouteNo() {
		return nextRouteNo;
	}

	public void setnextRouteNo(int nextRouteNo) {
		this.nextRouteNo = nextRouteNo;
	}

	public String getstartTime() {
		return startTime;
	}

	public void setstartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getendTime() {
		return endTime;
	}

	public void setendTime(String endTime) {
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return "Route [no=" + no + ", spotNo=" + spotNo + ", nextRouteNo=" + nextRouteNo + ", startTime=" + startTime
				+ ", endTime=" + endTime + "]";
	}
	
}
