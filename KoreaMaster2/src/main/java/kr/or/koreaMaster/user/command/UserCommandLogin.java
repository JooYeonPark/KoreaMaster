package kr.or.koreaMaster.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.koreaMaster.user.model.Users;
import kr.or.koreaMaster.user.service.UserLoginService;



public class UserCommandLogin implements UserCommand {
	private String next;

	public UserCommandLogin( String next ){
		this.next = next;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response  ) throws UserCommandException {
		HttpSession session = request.getSession();
		
		String id = request.getParameter("usersId");
		String pw = request.getParameter("usersPassword");
		
		Users user = UserLoginService.getInstance().selectUser(id, pw);
		
		if(user == null) {
			request.setAttribute("user", null);
			request.setAttribute("login", "true");
			
			return "UserLogin.jsp";
		}
		
		session.setAttribute("user", user);
		
		return next;
	}

}
