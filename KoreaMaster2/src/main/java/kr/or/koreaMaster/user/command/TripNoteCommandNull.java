package kr.or.koreaMaster.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TripNoteCommandNull implements TripNoteCommand {
	private String next;

	public TripNoteCommandNull( String next ){
		this.next = next;
	}

	public String execute( HttpServletRequest request, HttpServletResponse response   ) throws TripNoteCommandException {
		return next;
	}

}
