package kr.or.koreaMaster.theme.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.koreaMaster.theme.model.UsersTheme;
import kr.or.koreaMaster.theme.service.MyTravelTypeService;
import kr.or.koreaMaster.user.model.Users;

/**
 *  jsp 전 화면에서 사용자 별 우선순위 얻어와서  model에 저장, service로 전송
 */

public class CommandMyTravelTypeDone implements MyTravelTypeCommand {
	private String next; 
	
	public CommandMyTravelTypeDone(String _next) {
		next = _next;
	}
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MyTravelTypeService service = MyTravelTypeService.getInstance();
		UsersTheme userstheme = new UsersTheme();
		int score = 100;			// 우선순위 기준 값.  **** 최대 값 : 100, 최소 값 : 70 ****
		
		String type[] = {request.getParameter("1"), request.getParameter("2"), request.getParameter("3"), request.getParameter("4")};
		Users user = (Users)session.getAttribute("user");
		String id = user.getUsersId();
		
		for (int i = 0; i < type.length; i++) {
			int themeNo = service.findThemeId(type[i]);
			
			userstheme.setThemeNo(themeNo);
			userstheme.setUsersId(id);
			userstheme.setScore(score);
			
			service.insertType(userstheme);
			score = score - 10;
		}
		
		return next;				// 다음 넘어갈 페이지 주소 return
	}
}