package kr.or.koreaMaster.travel.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.dao.SpotDao;
import kr.or.koreaMaster.place.dao.SpotDaoImpl;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAO;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAOImpl;
import kr.or.koreaMaster.spotTheme.domain.SpotTheme;
import kr.or.koreaMaster.travel.util.RouteProcess;
import kr.or.koreaMaster.travel.util.SpotsProcess;

public class RouteServiceImpl2 implements RouteService {
	private DaoFactory factory;
	
	/** 생성자 */
	public RouteServiceImpl2() {
		factory = new MyBatisDaoFactory();
	}
	
	@Override
	/** 루트 구해주는 메소드 */
	public void getRoute(Map<String,String> map) {
		SpotsProcess spotsClass = new SpotsProcess();
		RouteProcess routeClass = new RouteProcess();
		SpotDao spotDAO = (SpotDao)factory.getDao(SpotDaoImpl.class);
		SpotThemeDAO spotThemeDAO = (SpotThemeDAO)factory.getDao(SpotThemeDAOImpl.class);
		
		//도시의 장소들을 저장할 변수
		List<Integer> spots = null;
		//장소의 테마번호를 임시로 저장할 변수
		List<Integer> themes = null;
		//장소번호+테마번호 테이블인 spotThem의 list
		List<SpotTheme> spotThemeList = new ArrayList<SpotTheme>();
		//spotTheme의 임시 저장 변수
		SpotTheme tmpSpotTheme = null;
		
		
		//#1. 사용자가 여행하고자 하는 도시의 모든 장소를 불러온다
		int cityNo = Integer.parseInt(map.get("city"));
		spots =  spotDAO.getSpotByCity(cityNo);
		
		// #2. 장소의 테마를 불러온 뒤  테마번호와 장소번호를 spotThemeList에 저장
		for (Integer spotNo : spots) {
			themes = spotThemeDAO.readThemeBySpot(spotNo);
			for (Integer themeNo : themes) {
				tmpSpotTheme = new SpotTheme(themeNo, spotNo);
				spotThemeList.add(tmpSpotTheme);
			}
		}
		
		//#3. 사용자의 테마 불러와 저장
		//!!!!현희가 완성하면 넣기!!!!!
		// 더미데이터	{6,11,12,7}
		List<Integer> perThemes = new ArrayList<Integer>();
		perThemes.add(6);
		perThemes.add(11);
		perThemes.add(12);
		perThemes.add(7);
		
		//#4. 사용자가 선택한 도시에서 사용자의 테마에 맞는 장소들을 추려낸다
		Map<Integer, Integer> perSpots = spotsClass.getSpots(spotThemeList, perThemes);
		
		//#5. 장소간의 거리, 여행일자를 고려하여 루트를 찾아낸다
		int date = (Integer.parseInt(map.get("endDate"))-Integer.parseInt(map.get("startDate"))) + 1;
		
		//#6. 출발장소 split
		List<String> departures = new ArrayList<String>();
		//#7. 
		routeClass.findRoute(date, departures);
	}

}
