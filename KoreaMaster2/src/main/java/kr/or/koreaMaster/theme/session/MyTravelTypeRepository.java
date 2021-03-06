package kr.or.koreaMaster.theme.session;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.or.koreaMaster.theme.model.UsersTheme;

/**
 *	넘겨받은 값들을 mapper에 전달
 */

public class MyTravelTypeRepository {
	private String namespace = "mappers.ThemeMapper";
	
	SqlSessionFactory getSqlSessionFactory() {
		InputStream in = null;
		
		try {
			in = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (IOException e) {
			System.out.println("mybatis 설정 실패 : " + e.getMessage());
		}
		
		SqlSessionFactory sessFac = new SqlSessionFactoryBuilder().build(in);
		return sessFac;
	}
	
	
	/**
	 *  사용자 별 여행 타입 DB에 저장
	 */
	public void insertType(UsersTheme userstheme) {
		SqlSession sess =  getSqlSessionFactory().openSession();	// sql 연결 객체
		try {
			int result = sess.insert(namespace + ".insertType", userstheme);
			if(result > 0) {			// 결과 값이 존재할 경우 커밋, 그렇지 않으면 롤백
				sess.commit();
			} else {
				sess.rollback();
			}
		} finally {
			sess.close();
		}
	}
	
	
	/**
	 *  themeName 을 가지고 themeId 찾기
	 */
	public int findThemeId(String themeName) {
		SqlSession sess = getSqlSessionFactory().openSession();		// sql 연결 객체
		try {
			int themeId = sess.selectOne(namespace + ".getNoByName", themeName);
			if(themeId > 0) {			// 결과 값이 존재할 경우 커밋, 그렇지 않으면 롤백
				sess.commit();
			} else {
				sess.rollback();
			}
			return themeId;
		} finally {
			sess.close();
		}
	}
	
	
	/**
	 *  users_id를 가지고 themeNo 찾기
	 */
	public  List<Integer> getNoById(String usersId) {
		SqlSession sess = getSqlSessionFactory().openSession();		// sql 연결 객체
		try {
			List<Integer> themeNo = sess.selectList(namespace + ".getNoById", usersId);
			if(themeNo.size() > 0) {			// 결과 값이 존재할 경우 커밋, 그렇지 않으면 롤백
				sess.commit();
			} else {
				sess.rollback();
			}
			return themeNo;
		} finally {
			sess.close();
		}
	}
	
	/** Route_theme insert */
	public void createRouteTheme(int themeNo, int tripNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("themeNo", themeNo);
		map.put("tripNo", tripNo);
		
		SqlSession sess =  getSqlSessionFactory().openSession();	// sql 연결 객체
		try {
			int result = sess.insert(namespace + ".createRouteTheme", map);
			if(result > 0) {			// 결과 값이 존재할 경우 커밋, 그렇지 않으면 롤백
				sess.commit();
			} else {
				sess.rollback();
			}
		} finally {
			sess.close();
		}
	}
}