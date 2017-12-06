package kr.or.koreaMaster.travel.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.junit.Test;

import kr.or.koreaMaster.common.controller.Controller;
import kr.or.koreaMaster.common.controller.ModelAndView;
import kr.or.koreaMaster.travel.domain.RouteInfo;
import kr.or.koreaMaster.travel.service.RouteService;
import kr.or.koreaMaster.travel.service.RouteServiceImpl;

/**
 * 
 * 루트리스트에서 루트상세보기 화면으로 넘어갈 때 필요한 데이터들 넘겨줌
 * 
 */

public class DetailController implements Controller{
	RouteService service;
	Logger logger = Logger.getLogger(DetailController.class);
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		
		String sTripNo = request.getParameter("tripNo");
		int tripNo = Integer.parseInt(sTripNo);
		
		service = new RouteServiceImpl();
		List<RouteInfo> list = service.routeByTripNo(tripNo);
		
		
		//임의의 도시 이름 가져옴 - 어차피 도시는 다 동일하기때문
		String cityName;
		if(list.get(0).getSigunName()!=null) {
			cityName = list.get(0).getSigunName();
		}
		else{
			cityName = list.get(0).getGuName();
		}

		mav.addObject("cityName", cityName);
		mav.addObject("tripName", list.get(0).getTripName());
		mav.addObject("tripNo", list.get(0).getTripNo());
		mav.addObject("list", list);
		mav.setView("/jsp/travel/listdetail.jsp");
		return mav;
	}
	
}
