package kr.or.koreaMaster.travel.service;

import java.util.List;
import java.util.Map;

import kr.or.koreaMaster.spotTheme.domain.SpotThemeJoin;

public interface RouteService {
	//루트 반환
	public Map<String,Object> getRoute(Map<String,String> map) ;
	
}
