package kr.or.koreaMaster.place.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.koreaMaster.place.domain.Restaurant;

public class RestaurantDaoImpl implements RestaurantDao {
private static final String NAMESPACE = "kr.or.koreaMaster.place.mapper.RestaurantMapper";
	
	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void create(Restaurant restaurant) {
		sqlSession.insert(NAMESPACE+".create", restaurant);
	}

	@Override
	public List<Restaurant> listAll() {
		return sqlSession.selectList(NAMESPACE+".listAll");
	}

	@Override
	public Restaurant read(int no) {
		return sqlSession.selectOne(NAMESPACE+".read", no);
	}

	@Override
	public void update(Restaurant restaurant) {
		sqlSession.update(NAMESPACE+".update", restaurant);
	}

	@Override
	public void delete(int no) {
		sqlSession.delete(NAMESPACE+".delete", no);
	}

}
