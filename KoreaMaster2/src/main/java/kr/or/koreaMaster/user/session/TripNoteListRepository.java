package kr.or.koreaMaster.user.session;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.or.koreaMaster.user.model.TripNote;

public class TripNoteListRepository {
	private String namespace = "mapper.TripNoteMapper";

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
	
	
	// 사용자 로그인
	public ArrayList<String> getTripNote(String id) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			return (ArrayList)sess.selectList(namespace + ".getTripNote", id);
		} finally {
			sess.close();
		}
	}
	
}
