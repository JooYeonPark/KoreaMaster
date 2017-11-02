package kr.or.koreaMaster.user.service;

import kr.or.koreaMaster.user.model.Users;
import kr.or.koreaMaster.user.session.UserRepository;

public class UserJoinService {
	private static UserJoinService service;
	UserRepository userRepo = new UserRepository();
	
	private UserJoinService() { }
	
	public static UserJoinService getInstance() {
		if(service == null) service = new UserJoinService();
		return service;
	}
	
	public int insertUser(Users user) {
		return userRepo.insertUser(user);
	}
		
}
