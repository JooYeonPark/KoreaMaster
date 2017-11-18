package kr.or.koreaMaster.travel.service;

import java.util.List;
import java.util.Map;

import kr.or.koreaMaster.travel.domain.RouteInfo;

public interface RouteService {
	/** 루트 반환 */
	public Map<String,Object> getRoute(Map<String,String> map) ;
	
	/** TripList 를 위한 모든 RouteInfo 반환 */
	public List<RouteInfo> routeInfoListAll();

	/** TripNo과 일치하는 RouteInfo 반환 */
	public List<RouteInfo> routeByTripNo(int no);
}
