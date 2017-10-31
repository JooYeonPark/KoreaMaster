package kr.or.koreaMaster.spotTheme.dao;

import java.util.List;

import kr.or.koreaMaster.spotTheme.domain.SpotTheme;

public interface SpotThemeDAO {
	/** spotNo에 따른 themeNo 조회 */
	public List<Integer> readThemeBySpot(int spotNo);
	
	/** 장소 테마 추가 */
	public void create(SpotTheme spotTheme);
}
