package kr.or.koreaMaster.user.service;

import org.apache.log4j.Logger;

import kr.or.koreaMaster.user.model.Users;
import kr.or.koreaMaster.user.session.UserRepository;

public class UserLoginService {
	private static UserLoginService service;
	UserRepository userRepo = new UserRepository();
	Logger logger = Logger.getLogger(UserLoginService.class);
	
	private UserLoginService() { }
	
	public static UserLoginService getInstance() {
		if(service == null) service = new UserLoginService();
		return service;
	}
	
	public Users selectUser(String id, String pw) {
		logger.debug(userRepo.selectUser(id, pw).toString());
		return userRepo.selectUser(id, pw);
	}
		
}
