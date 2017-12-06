package kr.or.koreaMaster.user.command;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.koreaMaster.user.model.Users;
import kr.or.koreaMaster.user.service.UserLoginService;



public class UserCommandLoginDB implements UserCommand {
	private String next;

	public UserCommandLoginDB( String next ){
		this.next = next;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response  ) throws UserCommandException {
		HttpSession session = request.getSession();
		
		String id = request.getParameter("usersId");
		String pw = request.getParameter("usersPassword");
		
		
		Users user = UserLoginService.getInstance().selectUser(id, pw);
		
		if(user == null) {
			request.setAttribute("user", null);
			request.setAttribute("login", "true");
			session.setAttribute("pre", null);
			return "users/UserLogin.jsp";
		}
		
		session.setAttribute("user", user);
		
		String url = (String)session.getAttribute("pre");
		String[] resultURL = url.split("/");
		int cnt = resultURL.length;
		String returnURL = "";
		
		if(resultURL[cnt-2].equals("localhost:80")) returnURL = "../" + resultURL[cnt-1];
		else returnURL = resultURL[cnt-2] + "/" + resultURL[cnt-1];
			System.out.println(returnURL);
			try {
			InetAddress ia = InetAddress.getLocalHost();
			
			System.out.println(ia);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		return returnURL;
	}

}
