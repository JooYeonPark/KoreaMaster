package kr.or.koreaMaster.travel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.koreaMaster.travel.domain.Trip;

public class TripDAOImpl implements TripDAO {
	
	private static final String NAMESPACE = "kr.or.kosta.koreaMaster.travel.trip";
	
	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;		
	}
	
	@Override
	public void create(Trip trip) {
		sqlSession.insert(NAMESPACE+".create",trip);
	}

	@Override
	public Trip read(int no) {
		return sqlSession.selectOne(NAMESPACE+".read",no);
	}

	@Override
	public List<Trip> listAll() {
		return sqlSession.selectList(NAMESPACE+".listAll");
	}

	@Override
	public void update(Trip trip) {
		sqlSession.update(NAMESPACE+".update",trip);
	}

	@Override
	public void delete(int no) {
		sqlSession.delete(NAMESPACE+".delete",no);
	}

}
