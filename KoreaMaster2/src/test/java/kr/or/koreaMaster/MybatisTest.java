package kr.or.koreaMaster;

import java.io.IOException;
import java.io.Reader;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;


public class MybatisTest {

	String resource = "mybatis-config.xml";
	Logger logger = Logger.getLogger(MybatisTest.class);
	
	SqlSession sqlSession; 


	@Before
	public void setUp() {
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		sqlSession = sqlSessionFactory.openSession(true); // auto commit 
		logger.debug("sqlSession 생성 완료");
	}
	
	@Test
	public void test() {
		logger.debug("생성완료");
	}

}
