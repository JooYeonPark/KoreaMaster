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

/**
 * 사용자의 정보들에따라 루트를 만들어 json 형식으로 반환한다
 * 
 * @author JooYeon
 *
 */
public class RouteController implements Controller {

    Logger logger = Logger.getLogger(RouteController.class);
	
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException {
        
    	
        ModelAndView mav = new ModelAndView();
        
        Map<String, String> map = new HashMap<String,String>();
        
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String city = request.getParameter("city");
        String theme = request.getParameter("theme");// 구분자:,
        String usersId = request.getParameter("usersId");
        String departures = request.getParameter("departures");// 구분자:,
        String days = request.getParameter("days");
        
        map.put("startDate", startDate);
        map.put("endDate", endDate);
        map.put("city", city);
        map.put("theme", theme);
        map.put("usersId", usersId);
        map.put("departures", departures);
        map.put("days", days);
        
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
