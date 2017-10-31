package kr.or.koreaMaster.travel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.koreaMaster.travel.domain.RouteTheme;

public class RouteThemeDAOImpl implements RouteThemeDAO {

	private static final String NAMESPACE = "kr.or.kosta.koreaMaster.travel.routeTheme";
	
	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void create(RouteTheme routeTheme) {
		sqlSession.insert(NAMESPACE+".create", routeTheme);
	}

	@Override
	public void delete(RouteTheme routeTheme) {
		sqlSession.delete(NAMESPACE+".delete", routeTheme);
	}
	
	@Override
	public List<RouteTheme> listAll(){
		return sqlSession.selectList(NAMESPACE+".listAll");
	}

}
