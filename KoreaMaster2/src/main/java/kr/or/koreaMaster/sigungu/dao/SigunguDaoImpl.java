package kr.or.koreaMaster.sigungu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.koreaMaster.sigungu.domain.Sigungu;

public class SigunguDaoImpl implements SigunguDao {
	
	private static final String NAMESPACE = "kr.or.koreaMaster.sigungu.mapper.SigunguMapper";
	
	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void create(Sigungu sigungu) {
		sqlSession.insert(NAMESPACE+".create", sigungu);
	}

	@Override
	public List<Sigungu> listAll() {
		return sqlSession.selectList(NAMESPACE+".listAll");
	}

	@Override
	public Sigungu read(int no) {
		return sqlSession.selectOne(NAMESPACE+".read", no);
	}

	@Override
	public void update(Sigungu sigungu) {
		sqlSession.update(NAMESPACE+".update", sigungu);
	}

	@Override
	public void delete(int no) {
		sqlSession.delete(NAMESPACE+".delete", no);
	}

	
}





