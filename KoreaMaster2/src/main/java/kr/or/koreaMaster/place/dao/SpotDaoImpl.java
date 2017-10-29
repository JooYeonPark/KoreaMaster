package kr.or.koreaMaster.place.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.koreaMaster.place.domain.Spot;

public class SpotDaoImpl implements SpotDao {
	
	private static final String NAMESPACE = "kr.or.koreaMaster.place.mapper.SpotMapper";
	
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
	
	@Override
	public List<Integer> getSpotByCity(int cityNo){
		return sqlSession.selectList(NAMESPACE+".getSpotByCity", cityNo);
	}
	
}





