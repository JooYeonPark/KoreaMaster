package kr.or.koreaMaster.place.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;

import kr.or.koreaMaster.common.controller.Controller;
import kr.or.koreaMaster.common.controller.ModelAndView;
import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.dao.SigunguDao;
import kr.or.koreaMaster.place.dao.SigunguDaoImpl;
import kr.or.koreaMaster.place.domain.Sido;
import kr.or.koreaMaster.place.domain.Sigungu;

public class SigunguController implements Controller {

	DaoFactory factory = new MyBatisDaoFactory();
	SigunguDao dao = (SigunguDao)factory.getDao(SigunguDaoImpl.class);
	Logger logger = Logger.getLogger(SidoListController.class);
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		
		String sidoNo = request.getParameter("sidoNo");
		
		List<Sigungu> list = dao.readBySido(Integer.parseInt(sidoNo));
		PrintWriter pw = null;
		response.setContentType("text/html;charset=UTF-8"); 
		
		try {
			JSONObject obj = new JSONObject();
			
			for (Sigungu sigungu : list) {
				if(sigungu.getGuName() != null) {
					obj.put(sigungu.getNo(), sigungu.getGuName());
				}
				else if(sigungu.getSigunName() != null) {
					obj.put(sigungu.getNo(), sigungu.getSigunName());
				}
			}
			
			pw = response.getWriter();
			pw.println(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pw!=null) { pw.close(); }
		}
		
		return null;
	}

}
