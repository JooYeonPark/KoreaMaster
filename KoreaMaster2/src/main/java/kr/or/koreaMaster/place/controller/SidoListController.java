package kr.or.koreaMaster.place.controller;

import java.io.PrintWriter;
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
import kr.or.koreaMaster.place.dao.SidoDao;
import kr.or.koreaMaster.place.dao.SidoDaoImpl;
import kr.or.koreaMaster.place.domain.Sido;

public class SidoListController implements Controller {
	
	DaoFactory factory = new MyBatisDaoFactory();
	SidoDao dao = (SidoDao)factory.getDao(SidoDaoImpl.class);
	Logger logger = Logger.getLogger(SidoListController.class);
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		
		List<Sido> list = dao.listAll();
		PrintWriter pw = null;
		response.setContentType("text/html;charset=UTF-8"); 
		
		try {
			JSONObject obj = new JSONObject();
			
			for (Sido sido : list) {
				obj.put(sido.getNo(), sido.getName());
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
