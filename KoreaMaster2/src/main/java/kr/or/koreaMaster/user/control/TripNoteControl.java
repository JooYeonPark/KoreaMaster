package kr.or.koreaMaster.user.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.koreaMaster.user.command.MyCalendarCommand;
import kr.or.koreaMaster.user.command.TripNoteCommand;
import kr.or.koreaMaster.user.command.TripNoteCommandException;
import kr.or.koreaMaster.user.command.TripNoteCommandNull;
import kr.or.koreaMaster.user.command.TripNoteDeleteCommand;
import kr.or.koreaMaster.user.command.TripNoteDetailCommand;
import kr.or.koreaMaster.user.command.TripNoteList;



public class TripNoteControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HashMap commandMap;
	private String jspDir = "/jsp/users/";
	private String error = "error.jsp";
	
	public TripNoteControl() {
        super();
        initCommand();
    }
	
	private void initCommand(){
		commandMap = new HashMap();

		// 메인
		commandMap.put("my-page", new TripNoteCommandNull("MyPage.jsp") );
		commandMap.put("my-tripNote", new TripNoteList("MyTripNote.jsp") );
		commandMap.put("my-delete", new TripNoteDeleteCommand("MyTripNote.jsp"));
		commandMap.put("my-detail", new TripNoteDetailCommand("MyTripNoteDetail.jsp"));
		commandMap.put("my-calendar", new MyCalendarCommand("MyCalendar.jsp")); 
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String nextPage = "";
		String cmdKey	= request.getParameter("cmd");
		if( cmdKey == null ){
			cmdKey = "my-page";
		}
		
		TripNoteCommand cmd = null;

		try{
			
			if( commandMap.containsKey( cmdKey ) ){
				cmd = (TripNoteCommand)commandMap.get( cmdKey );
			}else{
				throw new TripNoteCommandException("지정할 명령어가 존재하지 않음");
			}

			nextPage = cmd.execute(request, response);
			
		}catch( TripNoteCommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher( jspDir + nextPage );
		reqDp.forward( request, response );
		
	}

}
