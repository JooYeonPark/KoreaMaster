package kr.or.koreaMaster.spotTheme.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.koreaMaster.spotTheme.domain.SpotTheme;

	public class SpotThemeDAOImpl implements SpotThemeDAO {
	private static final String NAMESPACE = "kr.or.koreaMaster.spotTheme";
		
	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Integer> readThemeBySpot(int spotNo) {
		return sqlSession.selectList(NAMESPACE+".readThemeBySpot", spotNo);
	}

	@Override
	public void create(SpotTheme spotTheme) {
		sqlSession.insert(NAMESPACE+".create", spotTheme);
	}

}
