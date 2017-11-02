package kr.or.koreaMaster.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.koreaMaster.user.model.Users;
import kr.or.koreaMaster.user.service.UserJoinService;



public class UserCommandJoin implements UserCommand {
	private String next;

	public UserCommandJoin( String next ){
		this.next = next;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response  ) throws UserCommandException {
		// user에 이전 화면에서 넘겨오는 값 받기
		Users user = new Users();
		user.setUsersName(request.getParameter("usersName"));
		user.setUsersId(request.getParameter("usersId"));
		user.setUsersPassword(request.getParameter("usersPassword"));
		user.setUsersEmail(request.getParameter("usersEmail"));
		
		String tel = "";
		for(int i = 1 ; i < 4 ; i++) {
			tel += request.getParameter("tel"+i);
		}
		user.setUsersTelephone(tel);
		
		user.setUsersPostcode(request.getParameter("usersPostcode"));
		user.setUsersAddress(request.getParameter("usersAddress"));
		user.setUsersAddressDetail(request.getParameter("usersAddressDetail"));
		
		// 디비 연결
		int result = UserJoinService.getInstance().insertUser(user);
		
		return next;
	}

}
