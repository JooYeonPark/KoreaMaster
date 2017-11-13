package kr.or.koreaMaster.theme.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyTravelTypeCommandNull implements MyTravelTypeCommand{
	private String next;
	
	public MyTravelTypeCommandNull(String next) {
		this.next = next;
	}
	
	public String execute( HttpServletRequest request, HttpServletResponse response   ) {
		return next;
	}
}