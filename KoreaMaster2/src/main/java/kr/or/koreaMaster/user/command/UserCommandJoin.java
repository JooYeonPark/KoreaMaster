package kr.or.koreaMaster.user.command;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kr.or.koreaMaster.user.model.Users;
import kr.or.koreaMaster.user.service.UserJoinService;



public class UserCommandJoin implements UserCommand {
	private String next;

	public UserCommandJoin( String next ){
		this.next = next;
	}
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		Users user = new Users();
		try {
//		Part filePart = request.getPart("usersPicture");  //파일명
//		String fileName = getFileName(filePart);  //파일명
		
//		String realPath = FileSaveHelper.save("C:\\Users\\kosta\\git\\KoreaMaster\\KoreaMaster2\\src\\main\\webapp\\upload",
//				filePart.getInputStream());   //upload 파일 명
		
//		user.setUsersPicture(realPath);
//		System.out.println(user.getUsersPicture());
		}catch(Exception e) {}
		
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
		
		UserJoinService service = UserJoinService.getInstance();
		service.insertUser(user);	
	    
		return next;
	}
	
	private String getFileName(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	private String readParameterValue(Part part) throws IOException {
		InputStreamReader reader = new InputStreamReader(part.getInputStream(),"euc-kr");
		char[] data = new char[512];
		int len = -1;
		StringBuilder builder = new StringBuilder();
		while ((len = reader.read(data)) != -1) {
			builder.append(data, 0, len);
		}
		return builder.toString();
	}
	

}
