package kr.or.koreaMaster.place.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
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
import kr.or.koreaMaster.place.domain.Restaurant;
import kr.or.koreaMaster.place.domain.Sido;
import kr.or.koreaMaster.place.domain.Sigungu;
import kr.or.koreaMaster.place.domain.Spot;
import kr.or.koreaMaster.theme.session.MyTravelTypeRepository;

public class SpotListController implements Controller {
	
	DaoFactory factory = new MyBatisDaoFactory();
	SpotDao spotDao = (SpotDao)factory.getDao(SpotDaoImpl.class);
	MyTravelTypeRepository themeDao = new MyTravelTypeRepository();
	SigunguDao sigunguDao = (SigunguDao)factory.getDao(SigunguDaoImpl.class);
	
	Logger logger = Logger.getLogger(SpotListController.class);
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		PrintWriter pw = null;
		response.setContentType("text/html;charset=UTF-8");
		
		int page = Integer.parseInt(request.getParameter("page"));
		int themeNo = Integer.parseInt(request.getParameter("themeName"));
		int sortNum =Integer.parseInt( request.getParameter("sort"));
		
		String sort = null;
		if(sortNum == 1) {
			sort = "useNum";
		}else {
			sort = "name";
		}
		
		int sido = Integer.parseInt(request.getParameter("sido"));
		int sigungu = Integer.parseInt(request.getParameter("sigungu"));
		
		List<Integer> sigunguList = new ArrayList<>();
		List<Spot> list = null;
		
		if(sigungu == 0) {
			// 시도로 시군구 가져오기.
			if(sido != 0) {
				List<Sigungu> tmp = sigunguDao.readBySido(sido);
				for (Sigungu sigungu2 : tmp) {
					sigunguList.add(sigungu2.getNo());
				}
			}
			
		}else {
			sigunguList.add(sigungu);
		}
		
		
		list = spotDao.listPage(page, themeNo, sort, sigunguList);
		
		int maxPage = spotDao.maxPage(sigunguList);
		int startPage = (page/5)*5 +1;
		if(page%5 == 0) {
			startPage -= 5;
		}
		
		try {
			JSONObject json = new JSONObject();
			JSONObject obj;
			JSONArray spotArray = new JSONArray();
			for (Spot spot : list) {
				obj = new JSONObject();
				
				obj.put("no", spot.getNo());
				obj.put("cityNo", spot.getCityNo());
				obj.put("name", spot.getName());
				
				String detail = spot.getDetail();
				if(detail.length() >= 100) {
					detail = detail.substring(0, 100)+"...";
				}
				obj.put("detail", detail);
				
				obj.put("picture", spot.getPicture());
				obj.put("useNum", spot.getUseNum());
				
				spotArray.add(obj);
			}
			json.put("array", spotArray);
			json.put("startPage", startPage);
			json.put("maxPage", maxPage);
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
