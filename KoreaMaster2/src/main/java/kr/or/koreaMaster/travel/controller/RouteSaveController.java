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
import kr.or.koreaMaster.travel.domain.RouteInfo;
import kr.or.koreaMaster.travel.domain.SmallTrip;
import kr.or.koreaMaster.travel.domain.Trip;
import kr.or.koreaMaster.travel.service.RouteService;
import kr.or.koreaMaster.travel.service.RouteServiceImpl;
import kr.or.koreaMaster.user.model.TripNote;
import kr.or.koreaMaster.user.model.Users;
import kr.or.koreaMaster.user.session.TripNoteListRepository;

public class RouteSaveController implements Controller {

	Logger logger = Logger.getLogger(RouteSaveController.class);

	DaoFactory factory = new MyBatisDaoFactory();
	RouteService routeService = new RouteServiceImpl();
	TripDAO tripDAO = (TripDAO) factory.getDao(TripDAOImpl.class);
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		
		int tripNo = Integer.parseInt(request.getParameter("tripNo"));
		Trip trip = tripDAO.read(tripNo);
		List<RouteInfo> list = routeService.routeByTripNo(tripNo);
		
		
		mav.setView("redirect:/index.jsp");
		return mav;

	}

}
