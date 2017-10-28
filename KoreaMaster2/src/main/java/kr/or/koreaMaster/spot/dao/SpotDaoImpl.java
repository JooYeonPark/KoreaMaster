package kr.or.koreaMaster.spot.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.koreaMaster.spot.domain.Spot;

public class SpotDaoImpl implements SpotDao {
	
	private static final String NAMESPACE = "kr.or.koreaMaster.spot.mapper.SpotMapper";
	
	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void create(Spot spot) {
		sqlSession.insert(NAMESPACE+".create", spot);
	}

	@Override
	public List<Spot> listAll() {
		return sqlSession.selectList(NAMESPACE+".listAll");
	}

	@Override
	public Spot read(int no) {
		return sqlSession.selectOne(NAMESPACE+".read", no);
	}
	
	
}





