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
import kr.or.koreaMaster.place.dao.SpotDao;
import kr.or.koreaMaster.place.dao.SpotDaoImpl;
import kr.or.koreaMaster.place.domain.Sido;
import kr.or.koreaMaster.place.domain.Spot;
import kr.or.koreaMaster.theme.session.MyTravelTypeRepository;

public class SpotListController implements Controller {
	
	DaoFactory factory = new MyBatisDaoFactory();
	SpotDao sidoDao = (SpotDao)factory.getDao(SpotDaoImpl.class);
	MyTravelTypeRepository themeDao = new MyTravelTypeRepository();
	
	Logger logger = Logger.getLogger(SpotListController.class);
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		PrintWriter pw = null;
		response.setContentType("text/html;charset=UTF-8");
		
		String sido = request.getParameter("sido");
		int page = Integer.parseInt(request.getParameter("page"));
		String themeName = request.getParameter("themeName");
		String sort = request.getParameter("sort");
		
		
		int themeNo = 0;
		if(!(themeName.equals("all"))) {
			themeNo = themeDao.findThemeId(themeName);
		}
		
		List<Spot> list = null;
		if(sido == null) {
			list = sidoDao.listPage(page, themeNo, sort);
		}else {
			System.out.println(sido);
		}
		
		
		
		try {
			JSONObject obj;
			JSONArray spotArray = new JSONArray();
			for (Spot spot : list) {
				obj = new JSONObject();
				
				obj.put("no", spot.getNo());
				obj.put("cityNo", spot.getCityNo());
				obj.put("name", spot.getName());
				
				String detail = spot.getDetail();
				if(detail.length() >= 100) {
					detail = detail.substring(0, 110)+"...";
				}
				obj.put("detail", detail);
				
				obj.put("picture", spot.getPicture());
				obj.put("useNum", spot.getUseNum());
				
				spotArray.add(obj);
			}
			
			String str = spotArray.toJSONString();
			
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
