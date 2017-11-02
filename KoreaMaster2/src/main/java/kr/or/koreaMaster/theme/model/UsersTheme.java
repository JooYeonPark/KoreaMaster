package kr.or.koreaMaster.theme.model;

/**
 * 	UsersTheme 모델(domain) 변수 선언, 생성자, getter, setter 
 */

public class UsersTheme {
	private	String	usersId;
	private int		themeNo;
	private int		score;
	
	public UsersTheme() {}
	
	public void setScore(int score) {
		this.score = score;
	}
	public int getScore() {
		return score;
	}
	public String getUsersId() {
		return usersId;
	}
	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}
	public int getThemeNo() {
		return themeNo;
	}
	public void setThemeNo(int themeNo) {
		this.themeNo = themeNo;
	}
}
