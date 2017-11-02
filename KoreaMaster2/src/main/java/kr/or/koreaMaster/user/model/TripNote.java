package kr.or.koreaMaster.user.model;

public class TripNote {
	private String tripNoteDetail;		// 노트 설명
	private String usersId;				// 회원아이디
	private String tripNo;				// 여행번호
	private String tripNoteStartDate;	// 여행시작일
	private String tripNoteEndDate;		// 여행끝난일
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
	
	
}
