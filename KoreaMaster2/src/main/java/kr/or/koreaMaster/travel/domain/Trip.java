package kr.or.koreaMaster.travel.domain;

public class Trip {
	private int no;
	private String name;
	private String startDate;
	private String endDate;
	private String personalFlag;
	
	/** 생성자 */
	public Trip() {
		this(0,null,null,null,null);
	}
	public Trip(String name, String startDate, String endDate) {
		this(0, name, startDate, endDate,"Y");
	}
	public Trip(int no, String name, String startDate, String endDate, String personalFlag) {
		this.no = no;
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
		this.personalFlag = personalFlag;
	}
	
	/** Getter, Setter */
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getpersonalFlag() {
		return personalFlag;
	}
	public void setpersonalFlag(String personalFlag) {
		this.personalFlag = personalFlag;
	}
	
	@Override
	public String toString() {
		return "Trip [no=" + no + ", name=" + name + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", personalFlag=" + personalFlag + "]";
	}
	
	
}
