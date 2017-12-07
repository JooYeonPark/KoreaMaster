package kr.or.koreaMaster.user.control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

import kr.or.koreaMaster.common.controller.Controller;
import kr.or.koreaMaster.common.controller.ModelAndView;
import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.user.model.Users;
import kr.or.koreaMaster.user.session.UserRepository;


/**
 * 회원가입 Contoller
 * @author 김수진
 */

public class joinIDcheckController implements Controller {
	DaoFactory factory = new MyBatisDaoFactory();
	UserRepository userRepository = new UserRepository();
	Logger logger = Logger.getLogger(joinIDcheckController.class);

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		String userId = request.getParameter("usersId");
		
		Users users = null;
		users = userRepository.idCheck(userId);
		
		String check = "N";
		if(users == null) {
			check = "Y";
		}
		
		PrintWriter pw = null;
		response.setContentType("text/html;charset=UTF-8"); 
		try {
			pw = response.getWriter();
			pw.write(check);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

}
