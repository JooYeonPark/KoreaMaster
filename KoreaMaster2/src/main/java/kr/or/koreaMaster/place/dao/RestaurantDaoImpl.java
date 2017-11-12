package kr.or.koreaMaster.place.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public Restaurant readByCityNoName(String name, int cityNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("cityNo", cityNo);
		return sqlSession.selectOne(NAMESPACE+".readByCityNoName", map);
	}

	@Override
	public List<Restaurant> listPage(int page, String sort) {
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("sort", sort);
		return sqlSession.selectList(NAMESPACE+".listPage", map);
	}

	@Override
	public int maxPage() {
		return sqlSession.selectOne(NAMESPACE+".maxPage");
	}

	@Override
	public List<Restaurant> readBycityNo(int cityNo, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("cityNo", cityNo);
		map.put("no", no);
		return sqlSession.selectList(NAMESPACE+".readBycityNo", map);
	}

}
