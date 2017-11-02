package kr.or.koreaMaster.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserCommandNull implements UserCommand {
	private String next;

	public UserCommandNull( String next ){
		this.next = next;
	}

	public String execute( HttpServletRequest request, HttpServletResponse response   ) throws UserCommandException{
		return next;
	}

}
