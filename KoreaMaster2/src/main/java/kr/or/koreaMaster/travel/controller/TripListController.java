package kr.or.koreaMaster.travel.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.or.koreaMaster.common.controller.Controller;
import kr.or.koreaMaster.common.controller.ModelAndView;
import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.controller.SpotPageController;
import kr.or.koreaMaster.place.dao.SigunguDao;
import kr.or.koreaMaster.place.dao.SigunguDaoImpl;
import kr.or.koreaMaster.place.dao.SpotDao;
import kr.or.koreaMaster.place.dao.SpotDaoImpl;
import kr.or.koreaMaster.place.domain.Sigungu;
import kr.or.koreaMaster.place.domain.Spot;
import kr.or.koreaMaster.theme.session.MyTravelTypeRepository;
import kr.or.koreaMaster.travel.dao.TripDAO;
import kr.or.koreaMaster.travel.dao.TripDAOImpl;
import kr.or.koreaMaster.travel.domain.RouteInfo;
import kr.or.koreaMaster.travel.service.RouteService;
import kr.or.koreaMaster.travel.service.RouteServiceImpl;

/**
 * 루트 리트스 출력을 위해 필요한 정보들 db로부터 불러와 json 형식으로 넘겨준다
 * 
 * @author JooYeon
 *
 */

public class TripListController implements Controller {

	DaoFactory factory = new MyBatisDaoFactory();
	SpotDao spotDao = (SpotDao) factory.getDao(SpotDaoImpl.class);
	MyTravelTypeRepository themeDao = new MyTravelTypeRepository();
	SigunguDao sigunguDao = (SigunguDao) factory.getDao(SigunguDaoImpl.class);
	TripDAO tripDao = (TripDAO) factory.getDao(TripDAOImpl.class);

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {

		PrintWriter pw = null;
		response.setContentType("text/html;charset=UTF-8");

		int page = Integer.parseInt(request.getParameter("page"));
		int themeNo = Integer.parseInt(request.getParameter("themeName"));
		int sido = Integer.parseInt(request.getParameter("sido"));
		int sigungu = Integer.parseInt(request.getParameter("sigungu"));

		List<Integer> sigunguList = new ArrayList<>();
		List<RouteInfo> list = null;

		if (sigungu == 0) {
			// 시도로 시군구 가져오기.
			if (sido != 0) {
				List<Sigungu> tmp = sigunguDao.readBySido(sido);
				for (Sigungu sigungu2 : tmp) {
					sigunguList.add(sigungu2.getNo());
				}
			}
		} else {
			sigunguList.add(sigungu);
		}

		list = tripDao.listPage(page, themeNo, sigunguList);

		int maxPage = tripDao.maxPage(sigunguList);
		int startPage = (page / 5) * 5 + 1;
		if (page % 5 == 0) {
			startPage -= 5;
		}

		try {
			JSONObject json = new JSONObject();
			JSONObject obj;
			JSONArray array = new JSONArray();
			
			for (RouteInfo routeInfo : list) {
				obj = new JSONObject();
				obj.put("tripNo", routeInfo.getTripNo());
				obj.put("tripName", routeInfo.getTripName());
				obj.put("cityNo", routeInfo.getCityNo());
				obj.put("themeName", routeInfo.getThemeName());
				
				
				if(routeInfo.getGuName() != null) {
					obj.put("cityName", routeInfo.getGuName());
				}
				else if(routeInfo.getSigunName() != null) {
					obj.put("cityName", routeInfo.getSigunName());
				}
				
				array.add(obj);
			}
			
			json.put("array", array);
			json.put("startPage", startPage);
			json.put("maxPage", maxPage);
			
			String str = json.toJSONString();

			pw = response.getWriter();
			pw.println(str);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pw != null) {
				pw.close();
			}
		}

		return null;
	}

}
