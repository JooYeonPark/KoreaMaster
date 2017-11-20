package kr.or.koreaMaster;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;

import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.dao.SpotDao;
import kr.or.koreaMaster.place.dao.SpotDaoImpl;
import kr.or.koreaMaster.travel.dao.RouteDAO;
import kr.or.koreaMaster.travel.dao.RouteDAOImpl;
import kr.or.koreaMaster.travel.dao.SmallTripDAO;
import kr.or.koreaMaster.travel.dao.SmallTripDAOImpl;
import kr.or.koreaMaster.travel.dao.TripDAO;
import kr.or.koreaMaster.travel.dao.TripDAOImpl;
import kr.or.koreaMaster.travel.domain.Route;
import kr.or.koreaMaster.travel.domain.RouteInfo;
import kr.or.koreaMaster.travel.domain.SmallTrip;
import kr.or.koreaMaster.travel.domain.Trip;
import kr.or.koreaMaster.travel.service.RouteService;
import kr.or.koreaMaster.travel.service.RouteServiceImpl;

public class TripTest {
	Logger logger = Logger.getLogger(RouteServiceTest.class);
	DaoFactory factory = new MyBatisDaoFactory();
	TripDAO tripDAO = (TripDAO) factory.getDao(TripDAOImpl.class);
	SmallTripDAO smallTripDAO = (SmallTripDAO) factory.getDao(SmallTripDAOImpl.class);
	RouteDAO routeDAO = (RouteDAO) factory.getDao(RouteDAOImpl.class);
	SpotDao spotDAO = (SpotDao) factory.getDao(SpotDaoImpl.class);

//	@Test
	public void test() {

		// trip 생성
//		 Trip trip = new Trip("test주연띵","2017-11-12","2017-11-12");
//		 tripDAO.create(trip);
//		 int tripNo = trip.getNo();
//		 logger.debug("tripNo:"+tripNo);
//
//		// small trip생성
//		 SmallTrip small = new SmallTrip(1,tripNo,routeNo);
//		 smallDAO.create(small);

		// route 생성
		Route route = new Route(4, 0);
		routeDAO.create(route);
		int No = route.getNo();
		
		route = new Route(3, No);
		routeDAO.create(route);
		No = route.getNo();
		
		route = new Route(2, No);
		routeDAO.create(route);
		No = route.getNo();
		
		route = new Route(1, No);
		routeDAO.create(route);
		int firstRouteNo = route.getNo();
		logger.debug("firstRouteNo:" + firstRouteNo);

		// trip 생성
		Trip trip = new Trip("여수첫번째 여행기", "2017-11-15", "2017-11-15");
		tripDAO.create(trip);
		int tripNo = trip.getNo();
		logger.debug("tripNo:" + tripNo);

		// small trip생성
		SmallTrip small = new SmallTrip(1, tripNo, firstRouteNo);
		smallTripDAO.create(small);
	}
	
//	@Test
	public void listTest() {
		List<RouteInfo> list = tripDAO.getTrip();
		List<RouteInfo> result = new ArrayList<RouteInfo>();
		for (RouteInfo routeInfo : list) {
			RouteInfo rsInfo = new RouteInfo();
			rsInfo.setTripNo(routeInfo.getTripNo());
			rsInfo.setDayNo(routeInfo.getDayNo());
			
			Route route = routeDAO.read(routeInfo.getRouteNo());
			rsInfo.setSpotNo(route.getSpotNo());
			
			int next_no = route.getnextRouteNo();
			rsInfo.setNextRouteNo(next_no);

			result.add(rsInfo);
			
			while(next_no != 0) {
				route = routeDAO.read(next_no);
				if(route != null) {
				
					rsInfo = new RouteInfo();
					rsInfo.setTripNo(routeInfo.getTripNo());
					rsInfo.setDayNo(routeInfo.getDayNo());
					rsInfo.setRouteNo(route.getNo());
					rsInfo.setSpotNo(route.getSpotNo());
					rsInfo.setNextRouteNo(route.getnextRouteNo());
	
					next_no = route.getnextRouteNo();
					
					result.add(rsInfo);
				}
			}//end while
		}
		
		
		
		//routeNo에 따른 spot 정보들 저장
		for (RouteInfo routeInfo : result) {
			RouteInfo rsInfo = tripDAO.getSpot(routeInfo.getSpotNo());
			if(rsInfo.getSigunName() != null) { routeInfo.setSigunName(rsInfo.getSigunName()); }
			else if(rsInfo.getGuName()!=null) { routeInfo.setGuName(rsInfo.getGuName());}
			
			routeInfo.setThemeNo(rsInfo.getThemeNo());
			routeInfo.setName(rsInfo.getName());
			routeInfo.setDetail(rsInfo.getDetail());
			routeInfo.setAddressDetail(rsInfo.getAddressDetail());
			routeInfo.setOperatingHour(rsInfo.getOperatingHour());
			routeInfo.setClosedDate(rsInfo.getClosedDate());
			routeInfo.setPhone(rsInfo.getPhone());
			routeInfo.setFare(rsInfo.getFare());
			routeInfo.setHomepage(rsInfo.getHomepage());
			
		}
		
		for (RouteInfo routeInfo : result) {
			logger.debug(routeInfo);
		}
		
	}
//	@Test
	public void testnext() {
		Route route = routeDAO.getByNext(35);
		logger.debug(route);
	}
	
	@Test
	public void testRouteByTripNo() {
		RouteService service = new RouteServiceImpl();
		List<RouteInfo> reuslt = service.routeByTripNo(24);
		for (RouteInfo routeInfo : reuslt) {
			logger.debug(routeInfo);
		}
		
	}

}
