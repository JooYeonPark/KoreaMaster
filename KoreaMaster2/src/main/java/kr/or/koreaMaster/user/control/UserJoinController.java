package kr.or.koreaMaster.user.control;

import java.io.File;
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

public class UserJoinController implements Controller {
	DaoFactory factory = new MyBatisDaoFactory();
	UserRepository userRepository = new UserRepository();
	Logger logger = Logger.getLogger(UserJoinController.class);

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		Users users = new Users();
		
		//보관 클래스
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//업로드 클래스 선언
		ServletFileUpload upload = new ServletFileUpload(factory);
		List<FileItem> list = null;
		try {
			list = upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		Iterator<FileItem> iter = list.iterator();
		
		HashMap<String, String> dataMap = new HashMap<String, String>();
		while (iter.hasNext()) {
			FileItem item = iter.next();

			if (item.isFormField()) { //text
	      
				String name = item.getFieldName();
				String value = null;
				try {
					value = item.getString("utf-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				dataMap.put(name, value);
			} else { 
				if (item.getFieldName().equals("usersPicture")) {
					if (item.getName() == "" || item.getName() == null) continue;
					
					UUID uid = UUID.randomUUID();
					
					String fileName = uid+"_"+item.getName();

					upload.setFileSizeMax(1024 * 1024 * 10);
					long size = item.getSize();

					/*ServletContext context = request.getSession().getServletContext();
					String path = context.getRealPath("/images/users/");*/
					
					// 경로 자기 경로로 바꿔주세요~
					String path = "C:/Users/kosta/git/KoreaMaster/KoreaMaster2/src/main/webapp/images/users";
				    
					File file = new File(path, fileName);
					try {
						item.write(file);
					} catch (Exception e) {
						e.printStackTrace();
					}
					users.setUsersPicture(fileName);
				}
			}

		}
		users.setDataMap(dataMap);
		userRepository.insertUser(users);
		
		mav.setView("redirect:/user?cmd=login-page");
		return mav;
	}

}
