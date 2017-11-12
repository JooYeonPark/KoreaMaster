package kr.or.koreaMaster;

import org.apache.log4j.Logger;
import org.junit.Test;

import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.travel.dao.RouteDAO;
import kr.or.koreaMaster.travel.dao.RouteDAOImpl;
import kr.or.koreaMaster.travel.dao.SmallTripDAO;
import kr.or.koreaMaster.travel.dao.SmallTripDAOImpl;
import kr.or.koreaMaster.travel.dao.TripDAO;
import kr.or.koreaMaster.travel.dao.TripDAOImpl;
import kr.or.koreaMaster.travel.domain.Route;
import kr.or.koreaMaster.travel.domain.SmallTrip;
import kr.or.koreaMaster.travel.domain.Trip;

public class TripTest {
	Logger logger = Logger.getLogger(RouteServiceTest.class);
	DaoFactory factory = new MyBatisDaoFactory();
	TripDAO tripDAO = (TripDAO) factory.getDao(TripDAOImpl.class);
	SmallTripDAO smallTripDAO = (SmallTripDAO) factory.getDao(SmallTripDAOImpl.class);
	RouteDAO routeDAO = (RouteDAO) factory.getDao(RouteDAOImpl.class);

	@Test
	public void test() {

		// trip 생성
		// Trip trip = new Trip("test주연띵","2017-11-12","2017-11-12");
		// tripDao.create(trip);
		// int tripNo = trip.getNo();
		// logger.debug("tripNo:"+tripNo);

		// small trip생성
		// SmallTrip small = new SmallTrip(1,tripNo,routeNo);
		// smallDao.create(small);

		// route 생성
		Route route = new Route(1, 0);
		routeDAO.create(route);
		int firstRouteNo = route.getNo();
		logger.debug("firstRouteNo:" + firstRouteNo);

		route = new Route(2, 0);
		routeDAO.create(route);
		int second = route.getNo();
		logger.debug("second:" + second);

		// trip 생성
		Trip trip = new Trip("test주연띵", "2017-11-12", "2017-11-12");
		tripDAO.create(trip);
		int tripNo = trip.getNo();
		logger.debug("tripNo:" + tripNo);

		// small trip생성
		SmallTrip small = new SmallTrip(1, tripNo, firstRouteNo);
		smallTripDAO.create(small);
	}

}
