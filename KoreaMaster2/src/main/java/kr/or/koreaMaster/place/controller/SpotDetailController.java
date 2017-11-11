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
import kr.or.koreaMaster.place.dao.SidoDao;
import kr.or.koreaMaster.place.dao.SidoDaoImpl;
import kr.or.koreaMaster.place.dao.SigunguDao;
import kr.or.koreaMaster.place.dao.SigunguDaoImpl;
import kr.or.koreaMaster.place.dao.SpotDao;
import kr.or.koreaMaster.place.dao.SpotDaoImpl;
import kr.or.koreaMaster.place.domain.Sido;
import kr.or.koreaMaster.place.domain.Sigungu;
import kr.or.koreaMaster.place.domain.Spot;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAO;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAOImpl;
import kr.or.koreaMaster.theme.session.MyTravelTypeRepository;

public class SpotDetailController implements Controller {

	DaoFactory factory = new MyBatisDaoFactory();
	SpotDao spotDao = (SpotDao) factory.getDao(SpotDaoImpl.class);
	SigunguDao sigunguDao = (SigunguDao)factory.getDao(SigunguDaoImpl.class);
	SidoDao sidoDao = (SidoDao)factory.getDao(SidoDaoImpl.class);
	SpotThemeDAO spotThemeDAO = (SpotThemeDAO)factory.getDao(SpotThemeDAOImpl.class);

	Logger logger = Logger.getLogger(SpotDetailController.class);

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		PrintWriter pw = null;
		response.setContentType("text/html;charset=UTF-8");
		
		int no = Integer.parseInt(request.getParameter("spotNo"));
		Spot spot = spotDao.read(no);
		
		Sigungu sigungu = sigunguDao.read(spot.getCityNo());
		String sigunguName = null;
		if(sigungu.getSigunName() != null) {
			sigunguName = sigungu.getSigunName();
		}else {
			sigunguName = sigungu.getGuName();
		}
		
		Sido sido = sidoDao.read(sigungu.getSidoNum());
		String sidoName = sido.getName();
		
		List<Integer> themeList = spotThemeDAO.readThemeBySpot(spot.getNo());
		
		try {
			JSONObject obj = new JSONObject();
			
			obj.put("no", spot.getNo());
			obj.put("cityNo", spot.getCityNo());
			obj.put("sigungu", sigunguName);
			obj.put("sido", sidoName);
			obj.put("name", spot.getName());
			obj.put("detail", spot.getDetail());
			obj.put("addressDetail", spot.getAddressDetail());
			obj.put("operatingHour", spot.getOperatingHour());
			obj.put("closedDate", spot.getClosedDate());
			obj.put("phone", spot.getPhone());
			obj.put("theme", themeList);
			obj.put("fare", spot.getFare());
			obj.put("homepage", spot.getHomepage());
			obj.put("picture", spot.getPicture());
			obj.put("useNum", spot.getUseNum());
			
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
