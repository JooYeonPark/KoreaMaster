package kr.or.koreaMaster.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface TripNoteCommand {
	public String execute( HttpServletRequest request, HttpServletResponse response  ) throws TripNoteCommandException;
}
