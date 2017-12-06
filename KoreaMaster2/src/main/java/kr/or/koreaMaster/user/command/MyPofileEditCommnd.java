package kr.or.koreaMaster.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.koreaMaster.user.model.Users;

public class MyPofileEditCommnd implements TripNoteCommand {
	
	private String next;

	public MyPofileEditCommnd( String next ){
		this.next = next;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response ) throws TripNoteCommandException {
		HttpSession session = request.getSession();
		
		Users user = (Users)session.getAttribute("user");
		String id = user.getUsersId();
		
		
		
		
		return next;
	}
}