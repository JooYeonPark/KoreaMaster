package kr.or.koreaMaster.user.service;

import java.util.ArrayList;

import kr.or.koreaMaster.user.model.NoteList;
import kr.or.koreaMaster.user.model.TripNote;
import kr.or.koreaMaster.user.model.TripNoteDetail;
import kr.or.koreaMaster.user.session.TripNoteListRepository;

public class TripNoteListService {
	private static TripNoteListService service;
	TripNoteListRepository noteRepo = new TripNoteListRepository();
	
	private TripNoteListService() { }
	
	public static TripNoteListService getInstance() {
		if(service == null) service =new TripNoteListService();
		return service;
	}
	
	public ArrayList<NoteList> getTripNote(String id) {
		return noteRepo.getTripNote(id);
	}
	
	public int delTripNote(String id, int noteNo) {
		return noteRepo.delTripNote(id, noteNo);
	}
	
	public ArrayList<TripNoteDetail> noteDetail(String id, int noteNo) {
		return noteRepo.noteDetail(id, noteNo);
	}
}