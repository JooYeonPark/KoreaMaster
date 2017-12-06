package kr.or.koreaMaster.user.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.koreaMaster.user.command.UserCommand;
import kr.or.koreaMaster.user.command.UserCommandException;
import kr.or.koreaMaster.user.command.UserCommandJoin;
import kr.or.koreaMaster.user.command.UserCommandLogin;
import kr.or.koreaMaster.user.command.UserCommandLogout;
import kr.or.koreaMaster.user.command.UserCommandNull;



public class UserControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HashMap commandMap;
	private String jspDir = "/jsp/users/";
	private String error = "error.jsp";
	
	public UserControl() {
        super();
        initCommand();
    }
	
	private void initCommand(){
		commandMap = new HashMap();

		commandMap.put("main-page",	new UserCommandNull("../../index.jsp") );
		// 회원가입
		commandMap.put("join-page", new UserCommandNull("UserJoin.jsp") );
		commandMap.put("join-db", new UserCommandJoin("UserLogin.jsp"));
		// 로그인
		commandMap.put("login-page", new UserCommandNull("UserLogin.jsp") );
		commandMap.put("login-db", new UserCommandLogin("../../index.jsp") );
		
		//로그아웃
		commandMap.put("logout-page", new UserCommandLogout("../../index.jsp"));
		
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
			cmdKey = "main-page";
		}
		
		UserCommand cmd = null;

		try{
			
			if( commandMap.containsKey( cmdKey ) ){
				cmd = (UserCommand)commandMap.get( cmdKey);
			}else{
				throw new UserCommandException("지정할 명령어가 존재하지 않음");
			}

			nextPage = cmd.execute( request, response  );
			
		}catch( UserCommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher( jspDir + nextPage );
		reqDp.forward( request, response );
		
	}

}
