package kr.or.koreaMaster.travel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.koreaMaster.travel.domain.Route;
import kr.or.koreaMaster.travel.domain.Trip;

/**
 * @author JooYeon
 *
 */
public class RouteDAOImpl implements RouteDAO {

	private static final String NAMESPACE = "kr.or.kosta.koreaMaster.travel.route";
	
	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void create(Route route) {
		sqlSession.insert(NAMESPACE+".create", route);
	}

	@Override
	public Route read(int no) {
		return sqlSession.selectOne(NAMESPACE+".read",no);
		}

	@Override
	public List<Route> listAll() {
		return sqlSession.selectList(NAMESPACE+".listAll");
	}

	@Override
	public void update(Route route) {
		sqlSession.update(NAMESPACE+".update",route);
	}

	@Override
	public void delete(int no) {
		sqlSession.delete(NAMESPACE+".deleteUpdate",no);
		sqlSession.delete(NAMESPACE+".delete",no);
	}

}
