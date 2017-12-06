package kr.or.koreaMaster.user.model;

import java.util.HashMap;

public class Users {
	private String usersId;				// 회원아이디
	private String usersName;			// 이름
	private String usersPassword;		// 비밀번호
	private String usersTelephone;		// 전화번호
	private String usersEmail;			// 이메일
	private String usersPostcode;		// 우편번호
	private String usersAddress;		// 주소
	private String usersAddressDetail;	// 상세주소
	private String usersRegdate;		// 회원가입일
	private String usersAdminFlag;		// 관리자식별자
	private String usersPicture;		// 사진
	
	
	public String getUsersId() {
		return usersId;
	}
	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}
	public String getUsersName() {
		return usersName;
	}
	public void setUsersName(String usersName) {
		this.usersName = usersName;
	}
	public String getUsersPassword() {
		return usersPassword;
	}
	public void setUsersPassword(String usersPassword) {
		this.usersPassword = usersPassword;
	}
	public String getUsersTelephone() {
		return usersTelephone;
	}
	public void setUsersTelephone(String usersTelephone) {
		this.usersTelephone = usersTelephone;
	}
	public String getUsersEmail() {
		return usersEmail;
	}
	public void setUsersEmail(String usersEmail) {
		this.usersEmail = usersEmail;
	}
	public String getUsersPostcode() {
		return usersPostcode;
	}
	public void setUsersPostcode(String usersPostcode) {
		this.usersPostcode = usersPostcode;
	}
	public String getUsersAddress() {
		return usersAddress;
	}
	public void setUsersAddress(String usersAddress) {
		this.usersAddress = usersAddress;
	}
	public String getUsersAddressDetail() {
		return usersAddressDetail;
	}
	public void setUsersAddressDetail(String usersAddressDetail) {
		this.usersAddressDetail = usersAddressDetail;
	}
	public String getUsersRegdate() {
		return usersRegdate;
	}
	public void setUsersRegdate(String usersRegdate) {
		this.usersRegdate = usersRegdate;
	}
	public String getUsersAdminFlag() {
		return usersAdminFlag;
	}
	public void setUsersAdminFlag(String usersAdminFlag) {
		this.usersAdminFlag = usersAdminFlag;
	}
	public String getUsersPicture() {
		return usersPicture;
	}
	public void setUsersPicture(String usersPicture) {
		this.usersPicture = usersPicture;
	}
	
	public void setDataMap(HashMap<String, String> dataMap) {
		setUsersName(dataMap.get("usersName"));
		setUsersId(dataMap.get("usersId"));
		setUsersPassword(dataMap.get("usersPassword"));
		setUsersEmail(dataMap.get("usersEmail"));
		setUsersTelephone(dataMap.get("tel1")+"-"+dataMap.get("tel2")+"-"+dataMap.get("tel3"));
		setUsersPostcode(dataMap.get("usersPostcode"));
		setUsersAddress(dataMap.get("usersAddress"));
		setUsersAddressDetail(dataMap.get("usersAddressDetail"));
	}
	
	@Override
	public String toString() {
		return "Users [usersId=" + usersId + ", usersName=" + usersName + ", usersPassword=" + usersPassword
				+ ", usersTelephone=" + usersTelephone + ", usersEmail=" + usersEmail + ", usersPostcode="
				+ usersPostcode + ", usersAddress=" + usersAddress + ", usersAddressDetail=" + usersAddressDetail
				+ ", usersRegdate=" + usersRegdate + ", usersAdminFlag=" + usersAdminFlag + ", usersPicture="
				+ usersPicture + "]";
	}
	
}
