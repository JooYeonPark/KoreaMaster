package kr.or.koreaMaster.place.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kr.or.koreaMaster.common.controller.Controller;
import kr.or.koreaMaster.common.controller.ModelAndView;
import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.dao.SidoDao;
import kr.or.koreaMaster.place.dao.SidoDaoImpl;
import kr.or.koreaMaster.place.dao.SigunguDao;
import kr.or.koreaMaster.place.dao.SigunguDaoImpl;
import kr.or.koreaMaster.place.dao.SpotDao;
import kr.or.koreaMaster.place.dao.SpotDaoImpl;
import kr.or.koreaMaster.place.domain.Restaurant;
import kr.or.koreaMaster.place.domain.Sido;
import kr.or.koreaMaster.place.domain.Sigungu;
import kr.or.koreaMaster.place.domain.Spot;
import kr.or.koreaMaster.theme.session.MyTravelTypeRepository;
import kr.or.koreaMaster.travel.domain.RouteInfo;
import kr.or.koreaMaster.travel.service.RouteService;
import kr.or.koreaMaster.travel.service.RouteServiceImpl;

public class SpotListController implements Controller {
	
	DaoFactory factory = new MyBatisDaoFactory();
	SpotDao spotDao = (SpotDao)factory.getDao(SpotDaoImpl.class);
	MyTravelTypeRepository themeDao = new MyTravelTypeRepository();
	SigunguDao sigunguDao = (SigunguDao)factory.getDao(SigunguDaoImpl.class);
	RouteService routeService = new RouteServiceImpl();
	Logger logger = Logger.getLogger(SpotListController.class);
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		PrintWriter pw = null;
		response.setContentType("text/html;charset=UTF-8");
		
		int tripNo = Integer.parseInt(request.getParameter("tripNo"));
		List<RouteInfo> routeList = routeService.routeByTripNo(tripNo);
		
		int cityNo = Integer.parseInt(request.getParameter("cityNo"));
		
		List<Spot> list = null;
		
		list = spotDao.readBycityNo(cityNo, 0, routeList);
		
		try {
			JSONObject json = new JSONObject();
			JSONObject obj;
			JSONArray spotArray = new JSONArray();
			for (Spot spot : list) {
				obj = new JSONObject();
				
				if(!(spot.getDetail().equals("/*/*/"))) {
					
					obj.put("no", spot.getNo());
					obj.put("cityNo", spot.getCityNo());
					obj.put("name", spot.getName());
					obj.put("addressDetail", spot.getAddressDetail());
					obj.put("operatingHour", spot.getOperatingHour());
					obj.put("phone", spot.getPhone());
					obj.put("fare", spot.getFare());
					obj.put("homepage", spot.getHomepage());
					obj.put("picture", spot.getPicture());
					
					String detail = spot.getDetail();
					if(detail.length() >= 50) {
						detail = detail.substring(0, 50)+"...";
					}
					obj.put("detail", detail);
					
					spotArray.add(obj);
				}
			}
			json.put("array", spotArray);
			String str = json.toJSONString();
			
			pw = response.getWriter();
			pw.println(str);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pw!=null) { pw.close(); }
		}
		
		return null;
	}
}
