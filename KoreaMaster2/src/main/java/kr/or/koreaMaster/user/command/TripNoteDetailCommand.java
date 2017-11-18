package kr.or.koreaMaster.user.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.koreaMaster.user.model.NoteList;
import kr.or.koreaMaster.user.model.TripNoteDetail;
import kr.or.koreaMaster.user.service.TripNoteListService;

public class TripNoteDetailCommand implements TripNoteCommand{
	
	private String next;

	public TripNoteDetailCommand( String next ){
		this.next = next;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response  ) throws TripNoteCommandException {
		HttpSession session = request.getSession();
		
		String id = request.getParameter("usersId");
		String noteNo = request.getParameter("tripNo");
		
		
		ArrayList<TripNoteDetail> noteDetail = TripNoteListService.getInstance().noteDetail(id, Integer.parseInt(noteNo));
		
		
		request.setAttribute("noteDetail", noteDetail);
		
		return next;
	}
}