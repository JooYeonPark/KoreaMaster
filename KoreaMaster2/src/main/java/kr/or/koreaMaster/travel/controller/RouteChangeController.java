package kr.or.koreaMaster.travel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.koreaMaster.travel.dao.RouteDAO;
import kr.or.koreaMaster.travel.dao.RouteDAOImpl;
import kr.or.koreaMaster.travel.dao.SmallTripDAO;
import kr.or.koreaMaster.travel.dao.SmallTripDAOImpl;
import kr.or.koreaMaster.travel.dao.TripDAO;
import kr.or.koreaMaster.travel.dao.TripDAOImpl;
import kr.or.koreaMaster.travel.domain.RouteInfo;
import kr.or.koreaMaster.travel.domain.Trip;
import kr.or.koreaMaster.travel.service.RouteService;
import kr.or.koreaMaster.travel.service.RouteServiceImpl;
import kr.or.koreaMaster.common.controller.Controller;
import kr.or.koreaMaster.common.controller.ModelAndView;
import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.dao.RestaurantDao;
import kr.or.koreaMaster.place.dao.RestaurantDaoImpl;

public class RouteChangeController implements Controller {

    Logger logger = Logger.getLogger(RouteChangeController.class);
    
    RouteService routeService = new RouteServiceImpl();
    DaoFactory factory = new MyBatisDaoFactory();
	TripDAO tripDAO = (TripDAO) factory.getDao(TripDAOImpl.class);
	
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException {
        ModelAndView mav = new ModelAndView();
        
        Map<String, Object> map = new HashMap<String,Object>();
        
        /*int tripnoteNo = Integer.parseInt(request.getParameter("tripnoteNo"));*/
        int tripNo = Integer.parseInt(request.getParameter("tripNo"));
        Trip trip = tripDAO.read(tripNo);
        List<RouteInfo> list = routeService.routeByTripNo(tripNo);
        
        map.put("list", list);
        map.put("days", list.get(0).getDayNo());
        map.put("trip", trip);
        map.put("tripNo", tripNo);
        
        response.setCharacterEncoding("utf-8");
        
        mav.setView("/jsp/users/tripmodify.jsp");
        mav.setModel(map);
        
        return mav;
        
    }

}
