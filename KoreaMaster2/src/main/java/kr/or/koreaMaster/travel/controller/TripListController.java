package kr.or.koreaMaster.travel.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.koreaMaster.common.controller.Controller;
import kr.or.koreaMaster.common.controller.ModelAndView;
import kr.or.koreaMaster.travel.service.RouteService;
import kr.or.koreaMaster.travel.service.RouteServiceImpl;

public class TripListController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		RouteService routeService = new RouteServiceImpl();
		routeService.
		return null;
	}

}
