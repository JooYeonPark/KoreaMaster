package kr.or.koreaMaster.place.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.koreaMaster.place.domain.Sido;
import kr.or.koreaMaster.place.domain.Spot;

public class SidoDaoImpl implements SidoDao {
	
	private static final String NAMESPACE = "kr.or.koreaMaster.place.mapper.SidoMapper";
	
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

	@Override
	public Sido readByName(String name) {
		return sqlSession.selectOne(NAMESPACE+".readByName", name);
	}
	
}





