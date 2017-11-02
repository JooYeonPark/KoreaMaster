package kr.or.koreaMaster.user.service;

import kr.or.koreaMaster.user.model.Users;
import kr.or.koreaMaster.user.session.UserRepository;

public class UserService {
	private static UserService service;
	UserRepository userRepo = new UserRepository();
	
	private UserService() { }
	
	public static UserService getInstance() {
		if(service == null) service = new UserService();
		return service;
	}
	
	public int insertUser(Users user) {
		return userRepo.insertUser(user);
	}
		
}
