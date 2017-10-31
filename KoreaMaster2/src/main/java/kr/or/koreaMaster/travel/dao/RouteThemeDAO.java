package kr.or.koreaMaster.travel.dao;

import java.util.List;

import kr.or.koreaMaster.travel.domain.RouteTheme;

public interface RouteThemeDAO {
	/** 생성 */
	public void create(RouteTheme routeTheme);
	/** 전체 조회 */
	public List<RouteTheme> listAll();
	/** 삭제 */
	public void delete(RouteTheme routeTheme);
}
