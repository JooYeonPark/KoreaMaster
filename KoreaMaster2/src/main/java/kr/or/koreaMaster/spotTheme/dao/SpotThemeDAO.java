package kr.or.koreaMaster.spotTheme.dao;

import java.util.List;

public interface SpotThemeDAO {
	/** spotNo에 따른 themeNo 조회 */
	public List<Integer> readThemeBySpot(int spotNo);
}
