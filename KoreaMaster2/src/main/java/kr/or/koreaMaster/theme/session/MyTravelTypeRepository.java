package kr.or.koreaMaster.theme.session;

import java.io.*;
import java.util.*;

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
	public Integer findThemeId(String themeName) {
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
	public Integer getNoById(int usersId) {
		SqlSession sess = getSqlSessionFactory().openSession();		// sql 연결 객체
		try {
			int themeNo = sess.selectOne(namespace + ".getNoById", usersId);
			if(themeNo > 0) {			// 결과 값이 존재할 경우 커밋, 그렇지 않으면 롤백
				sess.commit();
			} else {
				sess.rollback();
			}
			return themeNo;
		} finally {
			sess.close();
		}
	}
}