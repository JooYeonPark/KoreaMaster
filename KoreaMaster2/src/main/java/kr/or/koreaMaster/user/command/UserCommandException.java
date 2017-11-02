package kr.or.koreaMaster.user.command;

public class UserCommandException extends Exception{
	  public UserCommandException(){
	  		super();
	  	}
	  	
	  public UserCommandException(String error){
	  		super( error );
	  	}

}
