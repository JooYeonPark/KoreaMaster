package kr.or.koreaMaster.travel.dao;

import java.util.List;

import javax.naming.event.NamespaceChangeListener;

import org.apache.ibatis.session.SqlSession;

import kr.or.koreaMaster.travel.domain.SmallTrip;

public class SmallTripDAOImpl implements SmallTripDAO {

	private static final String NAMESPACE = "kr.or.kosta.koreaMaster.travel.smallTrip";
	
	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public void create(SmallTrip smallTrip) {
		sqlSession.insert(NAMESPACE+".create",smallTrip);
	}

	@Override
	public SmallTrip read(SmallTrip smallTrip) {
		return sqlSession.selectOne(NAMESPACE+".read", smallTrip);
	}

	@Override
	public List<SmallTrip> listAll() {
		return sqlSession.selectList(NAMESPACE+".listAll");
	}

	@Override
	public void update(SmallTrip smallTrip) {
		sqlSession.update(NAMESPACE+".update",smallTrip);
	}

	@Override
	public void delete(SmallTrip smallTrip) {
		sqlSession.delete(NAMESPACE+".delete",smallTrip);
	}

}
