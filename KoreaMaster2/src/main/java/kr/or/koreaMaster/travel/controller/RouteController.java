package kr.or.koreaMaster.travel.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.koreaMaster.travel.service.RouteService;
import kr.or.koreaMaster.travel.service.RouteServiceImpl;
import kr.or.koreaMaster.common.controller.Controller;
import kr.or.koreaMaster.common.controller.ModelAndView;
import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.dao.RestaurantDao;
import kr.or.koreaMaster.place.dao.RestaurantDaoImpl;

public class RouteController implements Controller {

    Logger logger = Logger.getLogger(RouteController.class);
	
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException {
        
    	logger.debug("routeController실행");
    	
        ModelAndView mav = new ModelAndView();
        
        Map<String, String> map = new HashMap<String,String>();
        
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String city = request.getParameter("city");
        String theme = request.getParameter("theme");// 구분자:,
//        String userId = request.getParameter("userId");
        String userId = "joo"; //더미데이터
        String departures = request.getParameter("departures");// 구분자:,
        String days = request.getParameter("days");
//        String id = request.getParameter("id");
        
        map.put("startDate", startDate);
        map.put("endDate", endDate);
        map.put("city", city);
        map.put("theme", theme);
        map.put("userId", userId);
        map.put("departures", departures);
        map.put("days", days);
//        map.put("id", id);
        
        
//        logger.debug("id"+id);
//        logger.debug("startDate : "+startDate);
//        logger.debug("endDate : "+endDate);
//        logger.debug("city : "+city);
//        logger.debug("theme : "+theme);
//        logger.debug("departures : "+departures);
//        logger.debug("days:"+days);
        
        response.setCharacterEncoding("utf-8");
        
        RouteService service = new RouteServiceImpl();
        Map<String,Object> route = service.getRoute(map);
        
        /*
         * route에 포함 되어있는 사항 
         * routeSpots : 장소도메인으로 이루어진 루트
         * routeNo : Csv 방식으로 이루어진 장소번호
         * cityNo : 도시번호
         * cityName : 도시이름
         * days : 여행날짜
         * startDate, endDate
        */
        route.put("startDate", startDate);
        route.put("endDate", endDate);
        mav.addObject("route", route);
        mav.setView("/jsp/travel/routeDetail.jsp");
        
        return mav;
        
    }

}
