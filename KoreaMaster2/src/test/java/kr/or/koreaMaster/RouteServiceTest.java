package kr.or.koreaMaster;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;

import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.domain.Spot;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAO;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAOImpl;
import kr.or.koreaMaster.spotTheme.domain.SpotThemeJoin;
import kr.or.koreaMaster.travel.service.RouteService;
import kr.or.koreaMaster.travel.service.RouteServiceImpl;
import kr.or.koreaMaster.travel.util.RouteProcess;
import kr.or.koreaMaster.travel.util.SpotsProcess;

public class RouteServiceTest {
	Logger logger = Logger.getLogger(RouteServiceTest.class);
	DaoFactory factory = new MyBatisDaoFactory();
	RouteService service = new RouteServiceImpl();
	SpotThemeDAO spotThemeDAO = (SpotThemeDAO)factory.getDao(SpotThemeDAOImpl.class);
	SpotsProcess spotsClass = new SpotsProcess();
	RouteProcess routeClass = new RouteProcess();
	
	@Test
	public void test() {
		List<Spot> departures = new ArrayList<Spot>();
		Spot spot = new Spot();
		spot.setNo(66);
		spot.setLatitude(34.758084);
		spot.setLongitude(127.717084);
		departures.add(spot);
		departures.add(spot);
		
		//#1. spotThemeJoin 불러와 저장
		List<SpotThemeJoin> spotThemeJoinList = spotThemeDAO.getSpotThemeJoin(2);
		
		//#2. 사용자의 테마 불러와 저장
		//!!!!현희가 완성하면 넣기!!!!!
		// 더미데이터	{6,11,12,7}
		List<Integer> perThemes = new ArrayList<Integer>();
		perThemes.add(6);
		perThemes.add(11);
		perThemes.add(12);
		perThemes.add(7);
		
		//#4. 사용자가 선택한 도시에서 사용자의 테마에 맞는 장소들을 추려낸다
		spotThemeJoinList = spotsClass.getSpots(spotThemeJoinList, perThemes);
		
		
		List<Integer> routeNo =routeClass.findRoute(2, departures, spotThemeJoinList);
		logger.debug(routeNo);
	}
}
