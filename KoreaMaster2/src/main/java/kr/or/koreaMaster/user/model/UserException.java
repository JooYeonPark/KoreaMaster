package kr.or.koreaMaster.user.model;

public class UserException extends Exception {
	  public UserException(){
	  		super();
	  	}
	  	
	  public UserException(String error){
	  		super( error );
	  	}
	 		
	}