package kr.or.koreaMaster.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserCommandLoginPage implements UserCommand {
	private String next;

	public UserCommandLoginPage( String next ){
		this.next = next;
	}

	public String execute( HttpServletRequest request, HttpServletResponse response   ) throws UserCommandException{
		
		HttpSession session = request.getSession();
		
		String referer = request.getHeader("referer");
		session.setAttribute("pre", referer);
		
		return next;
	}

}
