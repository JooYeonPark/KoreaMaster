package kr.or.koreaMaster.theme.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.koreaMaster.place.domain.DomainName;

public class FunctionDaoImpl implements FunctionDao {
	
	private static final String NAMESPACE = "";
	
	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
}





