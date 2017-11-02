package kr.or.koreaMaster.user.service;

import kr.or.koreaMaster.user.model.Users;
import kr.or.koreaMaster.user.session.UserRepository;

public class UserLoginService {
	private static UserLoginService service;
	UserRepository userRepo = new UserRepository();
	
	private UserLoginService() { }
	
	public static UserLoginService getInstance() {
		if(service == null) service = new UserLoginService();
		return service;
	}
	
	public Users selectUser(String id, String pw) {
		return userRepo.selectUser(id, pw);
	}
		
}
