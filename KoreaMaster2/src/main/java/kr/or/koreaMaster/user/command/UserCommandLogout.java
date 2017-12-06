package kr.or.koreaMaster.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UserCommandLogout implements UserCommand {
	private String next;

	public UserCommandLogout( String next ){
		this.next = next;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response  ) throws UserCommandException {
		HttpSession session = request.getSession();
				
		session.removeAttribute("user");
		
		return next;
	}

}
