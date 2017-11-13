package kr.or.koreaMaster.travel.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.koreaMaster.common.controller.Controller;
import kr.or.koreaMaster.common.controller.ModelAndView;
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

public class TripController implements Controller {
	DaoFactory factory = new MyBatisDaoFactory();
	TripDAO tripDAO = (TripDAO) factory.getDao(TripDAOImpl.class);
	SmallTripDAO smallTripDAO = (SmallTripDAO) factory.getDao(SmallTripDAOImpl.class);
	RouteDAO routeDAO = (RouteDAO) factory.getDao(RouteDAOImpl.class);
	Logger logger = Logger.getLogger(TripController.class);

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		logger.debug("TripController 진입");
		ModelAndView mav = new ModelAndView();

		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String tripName = request.getParameter("tripName");
		String strTripNo = request.getParameter("routeSpots");

		// route 생성
		Route route = new Route();
		String[] tripNoArr = strTripNo.split(",");
		int no = 0;
		for (int i = tripNoArr.length; i >= 1; i--) {
			route = new Route(Integer.parseInt(tripNoArr[i - 1]), no);
			routeDAO.create(route);
			no = route.getNo();
		}

		// trip 생성
		Trip trip = new Trip(tripName, startDate, endDate);
		tripDAO.create(trip);
		int tripNo = trip.getNo();
		logger.debug("tripNo:" + tripNo);

		// small trip생성
		SmallTrip small = new SmallTrip(1, tripNo, no);
		smallTripDAO.create(small);

		mav.setView("redirect:/index.jsp");
		return mav;
	}

}
