package kr.or.koreaMaster.travel.dao;

import org.apache.ibatis.session.SqlSession;

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





