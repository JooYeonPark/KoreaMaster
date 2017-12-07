package kr.or.koreaMaster.place.controller;

import java.io.PrintWriter;
import java.util.List;

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
import kr.or.koreaMaster.place.dao.RestaurantDao;
import kr.or.koreaMaster.place.dao.RestaurantDaoImpl;
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
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAO;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAOImpl;
import kr.or.koreaMaster.theme.session.MyTravelTypeRepository;

public class RestaurantDetailController implements Controller {

	DaoFactory factory = new MyBatisDaoFactory();
	RestaurantDao restaurantDao = (RestaurantDao)factory.getDao(RestaurantDaoImpl.class);
	SigunguDao sigunguDao = (SigunguDao)factory.getDao(SigunguDaoImpl.class);
	SidoDao sidoDao = (SidoDao)factory.getDao(SidoDaoImpl.class);

	Logger logger = Logger.getLogger(RestaurantDetailController.class);

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		PrintWriter pw = null;
		response.setContentType("text/html;charset=UTF-8");
		
		int no = Integer.parseInt(request.getParameter("restaurantNo"));
		Restaurant restaurant = restaurantDao.read(no);
		
		Sigungu sigungu = sigunguDao.read(restaurant.getCityNo());
		String sigunguName = null;
		if(sigungu.getSigunName() != null) {
			sigunguName = sigungu.getSigunName();
		}else {
			sigunguName = sigungu.getGuName();
		}
		
		Sido sido = sidoDao.read(sigungu.getSidoNum());
		String sidoName = sido.getName();
		
		List<Restaurant> relatedSpot = restaurantDao.readBycityNo(restaurant.getCityNo(), restaurant.getNo());
		
		try {
			JSONObject obj = new JSONObject();
			
			obj.put("no", restaurant.getNo());
			obj.put("cityNo", restaurant.getCityNo());
			obj.put("sigungu", sigunguName);
			obj.put("sido", sidoName);
			obj.put("name", restaurant.getName());
			obj.put("detail", restaurant.getDetail());
			obj.put("addressDetail", restaurant.getAdressDetail());
			obj.put("operatingHour", restaurant.getOperatingHour());
			obj.put("closedDate", restaurant.getClosedDate());
			obj.put("phone", restaurant.getPhone());
			obj.put("fare", restaurant.getFare());
			obj.put("picture", restaurant.getPicture());
			obj.put("useNum", restaurant.getUseNum());
			
			JSONArray array = new JSONArray();
			JSONObject tmpOb = null;
			Restaurant tmps = null;
			for (int i = 0; i < relatedSpot.size(); i++) {
				tmps = relatedSpot.get(i);
				tmpOb = new JSONObject();
				tmpOb.put("no", tmps.getNo());
				tmpOb.put("cityNo", tmps.getCityNo());
				tmpOb.put("name", tmps.getName());
				
				String detail = tmps.getDetail();
				if(detail.length() >= 100) {
					detail = detail.substring(0, 100)+"...";
				}
				tmpOb.put("detail", detail);
				
				tmpOb.put("picture", tmps.getPicture());
				tmpOb.put("useNum", tmps.getUseNum());
				array.add(tmpOb);
			}
			obj.put("relatedSpot", array);
			
			String str = obj.toJSONString();
			
			pw = response.getWriter();
			pw.println(str);
			
		}catch(

	Exception e)
	{
			e.printStackTrace();
		}finally
	{
		if (pw != null) {
			pw.close();
		}
	}

	return null;
}}
