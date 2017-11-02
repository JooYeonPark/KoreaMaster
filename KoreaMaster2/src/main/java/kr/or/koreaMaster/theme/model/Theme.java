package kr.or.koreaMaster.theme.model;

/**
 * 	Theme 모델(domain) 변수 선언, 생성자, getter, setter 
 */

public class Theme {
	private int		themeNo;
	private String	themeName;
	private String	themeDetail;
	
	public Theme() {}
	
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
	public String getThemeDetail() {
		return themeDetail;
	}
	public void setThemeDetail(String themeDetail) {
		this.themeDetail = themeDetail;
	}
}
