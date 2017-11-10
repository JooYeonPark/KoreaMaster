package kr.or.koreaMaster.user.command;
import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import kr.or.koreaMaster.user.model.Users;
import kr.or.koreaMaster.user.service.UserJoinService;


public class UserCommandJoin implements UserCommand {
	private String next;

	public UserCommandJoin( String next ){
		this.next = next;
	}
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		Users user = new Users();
		
//		/* 올릴 fileName */
		String fileName = null;
		
		try {
			/* MIME TYPE 확인 (FileUpload시 MIME TYPE은 항상 Multipart/form-data)*/
			boolean isMulti = ServletFileUpload.isMultipartContent(request);
			
			
			
			if(isMulti) {
				/* tempDir -> 임시 파일이 저장될 디렉토리 */
				/* saveDir -> 올릴 파일이 서버에 저장될 디렉토리 */
				File tempDir = new File("C:\\Users\\kosta\\Desktop\\KoreaMaster2");
				String saveDir = "C:\\Users\\kosta\\git\\KoreaMaster.git\\KoreaMaster2\\src\\main\\webapp\\profiles";
				
				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setSizeThreshold(3 * 1024 * 1024); // 3메가
				factory.setRepository(tempDir);
				
				ServletFileUpload uploader = new ServletFileUpload(factory);
				uploader.setSizeMax(5 * 1024 * 1024);
				
				
				/* reqeust에서 file을 파싱하는 작업 */
				List<FileItem> items = uploader.parseRequest(request);
				
				for (FileItem fileItem : items) {
					
					/* 폼 태그 안에 file 외의 다른 데이터들은 버림 */
					if(fileItem.isFormField()) {
						continue;
					}
					
					/* fileItem의 여러 메소드로 file의 속성을 알 수 있음 */
//					fileName = fileItem.getName();
					fileName = fileItem.getName();
					System.out.println("[fileName] : " + fileName);
					if( fileName.equals("") ) {
						fileName = "null.png";
					}
					user.setUsersPicture(fileName);
					
					/* 서버에 저장할 파일을 새로 생성 */
					File uploadFile = new File(saveDir, fileName);
					
					/* 서버에 저장할 파일에 데이터를 넣는 작업 후 임시파일 삭제 */
					fileItem.write(uploadFile);
					fileItem.delete();
				}
			}
//			
//			/* 경로는 webapp 밑에 profiles로 해놨는데 나중에 바꾸면 될거야
//			 * DB에 저장할 때는 파일명만 저장하면 되고 
//			 * 파일명은 fileName 이라고 저장해놨으니까 DB에 넣을 때 참고하면 될거야 
//			 * 
//			 * 파일명이 중복될 경우를 생각해서 UUID를 사용하면 될거야 
//			 * http://goodwilldd.blogspot.kr/2012/05/tip-unique.html
//			 * 이 사이트 참고해서 UUID 사용하는것도 한번 고려해봐
//			 * 
//			 * 궁금한거 있으면 언제든 물어보렴 ㅃㅃ 
//			 */
//			
// 			
		} catch(Exception e) {}
		
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
		
//		System.out.println(user.getUsersAddress());
//		System.out.println(user.getUsersAddressDetail());
//		System.out.println(user.getUsersEmail());
//		System.out.println(user.getUsersId());
//		System.out.println(user.getUsersName());
//		System.out.println(user.getUsersPassword());
//		System.out.println(user.getUsersPicture());
//		System.out.println(user.getUsersPostcode());
//		System.out.println(user.getUsersTelephone());
		
//		UserJoinService service = UserJoinService.getInstance();
//		service.insertUser(user);	
	    
		return next;
	}
	
/*	private String getFileName(Part part) throws UnsupportedEncodingException {
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
	*/

	public static String doMakeUniqueFileName(String serverPath, String fileName) {
		 String extension = fileName.substring(fileName.lastIndexOf("."));
		 String uniqueFileName = null;
		 boolean flag = true;
		 while (flag) {
		  uniqueFileName = getUniqueFileName();
		  flag = doCheckFileExists(serverPath+uniqueFileName+extension);
		 }
		 return serverPath+uniqueFileName+extension;
		}

		private static boolean doCheckFileExists(String fullPath) {
		 return new File(fullPath).exists();
		}

		private static String getUniqueFileName() {
		 return  UUID.randomUUID().toString();
		}
	
}
