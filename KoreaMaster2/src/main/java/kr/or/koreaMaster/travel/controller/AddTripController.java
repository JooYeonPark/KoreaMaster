package kr.or.koreaMaster.travel.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.koreaMaster.common.controller.Controller;
import kr.or.koreaMaster.common.controller.ModelAndView;
import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.travel.dao.TripDAO;
import kr.or.koreaMaster.travel.dao.TripDAOImpl;
import kr.or.koreaMaster.travel.domain.Trip;
import kr.or.koreaMaster.user.model.TripNote;
import kr.or.koreaMaster.user.model.Users;
import kr.or.koreaMaster.user.session.TripNoteListRepository;

public class AddTripController implements Controller{
	
	private DaoFactory factory = new MyBatisDaoFactory();
	TripDAO dao;
	Logger logger = Logger.getLogger(AddTripController.class);
	TripNoteListRepository noteRepo;
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		
		ModelAndView mav = new ModelAndView();
		
		String sTripNo = request.getParameter("tripNo");
		int tripNo = Integer.parseInt(sTripNo);
		String detail = request.getParameter("detail");
		String noteName = request.getParameter("noteName");
		
		Users user = (Users)request.getSession().getAttribute("user");
		logger.debug("id:"+user.getUsersId());
		
		dao = (TripDAO)factory.getDao(TripDAOImpl.class);
		Trip trip = dao.read(tripNo);
		
		TripNote note = new TripNote();
		note.setTripNoteName(noteName);
		note.setTripNoteDetail(trip.getName());
		note.setUsersId(user.getUsersId());
		note.setTripNo(String.valueOf(tripNo));
		note.setTripNoteStartDate(trip.getStartDate());
		note.setTripNoteEndDate(trip.getEndDate());
		
		logger.debug("note:"+note);
		
		noteRepo = new TripNoteListRepository();
		int result = noteRepo.create(note);
		
		if(result == 1) { logger.debug("note create 성공" );}
			
		mav.setView("redirect:/");
		
		
		return mav;
	}
	
}
