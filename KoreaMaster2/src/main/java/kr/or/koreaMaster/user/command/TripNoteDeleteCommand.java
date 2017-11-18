package kr.or.koreaMaster.user.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.koreaMaster.user.model.NoteList;
import kr.or.koreaMaster.user.service.TripNoteListService;

public class TripNoteDeleteCommand implements TripNoteCommand{
	
	private String next;

	public TripNoteDeleteCommand( String next ){
		this.next = next;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response  ) throws TripNoteCommandException {
		HttpSession session = request.getSession();
		
		String id = request.getParameter("usersId");
		String noteNo = request.getParameter("tripNo");
		TripNoteListService.getInstance().delTripNote(id, Integer.parseInt(noteNo));
		
		
		ArrayList<NoteList> tripName = TripNoteListService.getInstance().getTripNote(id);
		request.setAttribute("tripName", tripName);
		
		return next;
	}
}