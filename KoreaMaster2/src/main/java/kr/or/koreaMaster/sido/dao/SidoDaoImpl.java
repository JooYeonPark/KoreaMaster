package kr.or.koreaMaster.sido.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.koreaMaster.sido.domain.Sido;
import kr.or.koreaMaster.spot.domain.Spot;

public class SidoDaoImpl implements SidoDao {
	
	private static final String NAMESPACE = "kr.or.koreaMaster.sido.mapper.SidoMapper";
	
	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void create(Sido sido) {
		sqlSession.insert(NAMESPACE+".create");
	}

	@Override
	public List<Sido> listAll() {
		return sqlSession.selectList(NAMESPACE+".listAll");
	}

	@Override
	public Sido read(int no) {
		return sqlSession.selectOne(NAMESPACE+".read", no);
	}

	@Override
	public void update(Sido sido) {
		sqlSession.update(NAMESPACE+".update", sido);
	}

	@Override
	public void delete(int no) {
		sqlSession.delete(NAMESPACE+".delete", no);
	}

	
}





