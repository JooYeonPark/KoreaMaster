package kr.or.koreaMaster.theme.service;

import java.util.List;

import kr.or.koreaMaster.theme.model.UsersTheme;
import kr.or.koreaMaster.theme.session.MyTravelTypeRepository;

/**
 * 각 메소드 별 command로 부터 받은 data를 Repository로 전송
 */

public class MyTravelTypeService {
	private static MyTravelTypeService service;
	
	public static MyTravelTypeService getInstance() {
		if(service == null) service = new MyTravelTypeService();
		return service;
	}
	
	private MyTravelTypeService() {}
	
	MyTravelTypeRepository repo = new MyTravelTypeRepository();
	
	public void insertType(UsersTheme userstheme) {
		repo.insertType(userstheme);
	}
	
	public int findThemeId(String themeName) {
		int themeId = repo.findThemeId(themeName);
		return themeId;
	}
	
}