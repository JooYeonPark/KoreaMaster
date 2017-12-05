package kr.or.koreaMaster.travel.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.koreaMaster.common.controller.Controller;
import kr.or.koreaMaster.common.controller.ModelAndView;
import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.theme.session.MyTravelTypeRepository;
import kr.or.koreaMaster.travel.dao.RouteDAO;
import kr.or.koreaMaster.travel.dao.RouteDAOImpl;
import kr.or.koreaMaster.travel.dao.SmallTripDAO;
import kr.or.koreaMaster.travel.dao.SmallTripDAOImpl;
import kr.or.koreaMaster.travel.dao.TripDAO;
import kr.or.koreaMaster.travel.dao.TripDAOImpl;
import kr.or.koreaMaster.travel.domain.Route;
import kr.or.koreaMaster.travel.domain.SmallTrip;
import kr.or.koreaMaster.travel.domain.Trip;
import kr.or.koreaMaster.user.model.TripNote;
import kr.or.koreaMaster.user.model.Users;
import kr.or.koreaMaster.user.session.TripNoteListRepository;


/**
 * trip, small_trip, route, trip_note에 데이터들을 저장한다
 * 
 * @author JooYeon
 *
 */

public class TripController implements Controller {
	DaoFactory factory = new MyBatisDaoFactory();
	TripDAO tripDAO = (TripDAO) factory.getDao(TripDAOImpl.class);
	SmallTripDAO smallTripDAO = (SmallTripDAO) factory.getDao(SmallTripDAOImpl.class);
	RouteDAO routeDAO = (RouteDAO) factory.getDao(RouteDAOImpl.class);
	Logger logger = Logger.getLogger(TripController.class);

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();

		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String noteName = request.getParameter("noteName");
		String strTripNo = request.getParameter("routeSpots");
		String detail = request.getParameter("detail");

//		Users user = (Users)request.getSession().getAttribute("user");
//		String usersId = user.getUsersId();
		String usersId = "joo";
		
		// route insert
		Route route = new Route();
		String[] tripNoArr = strTripNo.split(",");
		int no = 0;
		for (int i = tripNoArr.length; i >= 1; i--) {
			route = new Route(Integer.parseInt(tripNoArr[i - 1]), no);
			routeDAO.create(route);
			no = route.getNo();
		}

		// trip insert
		Trip trip = new Trip(noteName, startDate, endDate);
		tripDAO.create(trip);
		int tripNo = trip.getNo();
//		logger.debug("tripNo:" + tripNo);

		// small_trip insert
		SmallTrip small = new SmallTrip(1, tripNo, no);
		smallTripDAO.create(small);
		
		//route_theme insert
		MyTravelTypeRepository rep = new MyTravelTypeRepository();
		List<Integer> Themes = rep.getNoById(usersId);
		for (Integer theme : Themes) {
			rep.createRouteTheme(theme, tripNo);
		}
		
		//trip_note insert
		TripNoteListRepository listRep = new TripNoteListRepository();
		TripNote tripNote = new TripNote(detail, noteName, usersId, String.valueOf(tripNo), startDate, endDate);
		listRep.create(tripNote);
		

		mav.setView("redirect:/index.jsp");
		return mav;
	}

}
