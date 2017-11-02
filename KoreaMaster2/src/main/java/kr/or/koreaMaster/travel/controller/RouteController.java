package kr.or.koreaMaster.travel.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.koreaMaster.travel.service.RouteService;
import kr.or.koreaMaster.travel.service.RouteServiceImpl;
import kr.or.koreanMaster.common.controller.Controller;
import kr.or.koreanMaster.common.controller.ModelAndView;

public class RouteController implements Controller {

	Logger logger = Logger.getLogger(RouteController.class);
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException {
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, String> map = new HashMap<String,String>();
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String city = request.getParameter("city");
		// ,로 구분하여 string 형태로 넘겨줌
		String theme = request.getParameter("theme");
		String userId = request.getParameter("userId");
		//출발장소
		
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("city", city);
		map.put("theme", theme);
		map.put("userId", userId);
		
		
		RouteService service = new RouteServiceImpl();
		service.getRoute(map);
		
		
		return null;
	}

}
