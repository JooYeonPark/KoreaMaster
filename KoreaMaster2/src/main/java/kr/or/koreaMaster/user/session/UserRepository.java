package kr.or.koreaMaster.user.session;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.or.koreaMaster.user.model.Users;


public class UserRepository {
	private String namespace = "mapper.UserMapper";

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

	// 사용자 회원가입
	public int insertUser(Users user) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			int result = sess.insert(namespace + ".insertUser", user);

			if(result > 0) {
				sess.commit();
			} else {
				sess.rollback();
			}
			return result;
		} finally {
			sess.close();
		}
	}
	
	// 사용자 로그인
	public Users selectUser(String id, String pw) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			HashMap map = new HashMap();
			map.put("usersId", id);
			map.put("usersPassword", pw);
			
			return sess.selectOne(namespace + ".selectUser", map);
		} finally {
			sess.close();
		}
	}

}
