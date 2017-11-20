package kr.or.koreaMaster.user.model;

public class TripNote {
	private int tripNoteNo;
	private String tripNoteDetail;		// 노트 설명
	private String tripNoteName;		// 노트 제목
	private String usersId;				// 회원아이디
	private String tripNo;				// 여행번호
	private String tripNoteStartDate;	// 여행시작일
	private String tripNoteEndDate;		// 여행끝난일
	
	public TripNote() { }
	
	public TripNote(String tripNoteDetail, String tripNoteName, String usersId, String tripNo, String tripNoteStartDate,
			String tripNoteEndDate) {
		this(0, tripNoteDetail, tripNoteName, usersId, tripNo, tripNoteStartDate, tripNoteEndDate);
	}
	
	public TripNote(int tripNoteNo, String tripNoteDetail, String tripNoteName, String usersId, String tripNo, String tripNoteStartDate,
			String tripNoteEndDate) {
		super();
		this.tripNoteNo = tripNoteNo;
		this.tripNoteDetail = tripNoteDetail;
		this.usersId = usersId;
		this.tripNo = tripNo;
		this.tripNoteStartDate = tripNoteStartDate;
		this.tripNoteEndDate = tripNoteEndDate;
	}
	
	public String getTripNoteDetail() {
		return tripNoteDetail;
	}
	public void setTripNoteDetail(String tripNoteDetail) {
		this.tripNoteDetail = tripNoteDetail;
	}
	public String getUsersId() {
		return usersId;
	}
	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}
	public String getTripNo() {
		return tripNo;
	}
	public void setTripNo(String tripNo) {
		this.tripNo = tripNo;
	}
	public String getTripNoteStartDate() {
		return tripNoteStartDate;
	}
	public void setTripNoteStartDate(String tripNoteStartDate) {
		this.tripNoteStartDate = tripNoteStartDate;
	}
	public String getTripNoteEndDate() {
		return tripNoteEndDate;
	}
	public void setTripNoteEndDate(String tripNoteEndDate) {
		this.tripNoteEndDate = tripNoteEndDate;
	}

	public int getTripNoteNo() {
		return tripNoteNo;
	}

	public void setTripNoteNo(int tripNoteNo) {
		this.tripNoteNo = tripNoteNo;
	}

	public String getTripNoteName() {
		return tripNoteName;
	}

	public void setTripNoteName(String tripNoteName) {
		this.tripNoteName = tripNoteName;
	}

	@Override
	public String toString() {
		return "TripNote [tripNoteNo=" + tripNoteNo + ", tripNoteDetail=" + tripNoteDetail + ", tripNoteName="
				+ tripNoteName + ", usersId=" + usersId + ", tripNo=" + tripNo + ", tripNoteStartDate="
				+ tripNoteStartDate + ", tripNoteEndDate=" + tripNoteEndDate + "]";
	}
	
}
