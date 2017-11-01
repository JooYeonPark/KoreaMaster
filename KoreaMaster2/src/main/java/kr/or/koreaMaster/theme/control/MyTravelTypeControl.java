package kr.or.koreaMaster.theme.control;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.koreaMaster.theme.command.CommandException;
import kr.or.koreaMaster.theme.command.CommandMyTravelTypeDone;
import kr.or.koreaMaster.theme.command.MyTravelTypeCommand;

public class MyTravelTypeControl extends HttpServlet{
	private HashMap commandMap;
	private String	jspDir = "/";
	private String  error = "error.jsp";
	
	public MyTravelTypeControl() {
		super();
		initCommand();
	}
	
	
	private void initCommand() {
		commandMap = new HashMap();
		
		commandMap.put("myTravelTypeDone", new CommandMyTravelTypeDone("MyTravelTypeDone.jsp"));		// DB 처리, 다음 넘어갈 페이지 주소 Command로 넘겨주기
	}
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String nextPage = "";
		String cmdKey	= request.getParameter("cmd");
		if( cmdKey == null ){
			cmdKey = "myTravelType";
		}

		MyTravelTypeCommand cmd = null;

		try{
			if( commandMap.containsKey( cmdKey ) ){
				cmd = (MyTravelTypeCommand)commandMap.get( cmdKey);
			}else{
				throw new CommandException("지정할 명령어가 존재하지 않음");
			}

			nextPage = cmd.execute( request, response  );
		}catch( CommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher( jspDir + nextPage );
		reqDp.forward( request, response );
	}
}