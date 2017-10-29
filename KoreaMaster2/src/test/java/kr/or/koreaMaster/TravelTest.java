package kr.or.koreaMaster;


import java.util.List;

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
import kr.or.koreaMaster.travel.domain.SmallTrip;
import kr.or.koreaMaster.travel.domain.Trip;


public class TravelTest {

	Logger logger = Logger.getLogger(TravelTest.class);
	DaoFactory factory = new MyBatisDaoFactory();

//	@Test
	public void test() {
		TripDAO dao = (TripDAO)factory.getDao(TripDAOImpl.class);
		
		//?��?��
//		Trip trip = new Trip("?��?�� 3번째","2017-10-30", "2017-10-31", "Y");
//		dao.create(trip);
//		logger.debug("?��?��?���?");
		
		//조회
//		logger.debug(dao.read(1));
		
		//?��체조?��
		List<Trip> tripList = dao.listAll();
		logger.debug(tripList);
		
//		//?��?��
//		Trip trip = new Trip(6, "?��?�� ?��?��?�� ?��?��","2017-10-30", "2017-10-31", "Y");
//		dao.update(trip);
//		logger.debug("?��?��?���?");
		
	}
	
//	@Test
	public void route() {
		RouteDAO dao = (RouteDAO)factory.getDao(RouteDAOImpl.class);
		
		//?��?��
//		Route route = new Route(2,3,"20171029100000","20171029111000");
//		dao.create(route);
		
		//조회
//		logger.debug(dao.read(2));
		
		//?��체조?��
//		List<Route> route = dao.listAll();
//		logger.debug(route);
		
		//?��?��
//		Route route = new Route(2,1,2,"20171029100000","20171029111000");
//		dao.update(route);
		
		//?��?��
	//	dao.delete(5);
	}
	
	@Test
	public void SmallTrip() {
		SmallTripDAO dao = (SmallTripDAO)factory.getDao(SmallTripDAOImpl.class);
	
		//?��?��
//		SmallTrip smallTrip = new SmallTrip(1,6,10);
//		dao.create(smallTrip);
		
		//조회
//		SmallTrip smallTrip = new SmallTrip();
//		smallTrip.setTripNo(6);
//		smallTrip.setDayNo(1);
//		logger.debug(dao.read(smallTrip));
		
		//?��체조?��
//		logger.debug(dao.listAll());
		
		//?��?��
		SmallTrip smallTrip = new SmallTrip(1,6,12);
		dao.update(smallTrip);
		
	}

}
