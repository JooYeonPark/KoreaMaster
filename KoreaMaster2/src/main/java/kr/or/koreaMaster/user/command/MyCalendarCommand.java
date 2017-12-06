package kr.or.koreaMaster.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyCalendarCommand  implements TripNoteCommand {
	
	private String next;

	public MyCalendarCommand( String next ){
		this.next = next;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws TripNoteCommandException {
		return next;
	}

}
