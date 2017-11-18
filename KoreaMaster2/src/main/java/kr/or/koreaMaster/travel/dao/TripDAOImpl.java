package kr.or.koreaMaster.travel.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.koreaMaster.travel.domain.RouteInfo;
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
	public int create(Trip trip) {
		return sqlSession.insert(NAMESPACE + ".create", trip);
	}

	@Override
	public Trip read(int no) {
		return sqlSession.selectOne(NAMESPACE + ".read", no);
	}

	@Override
	public List<Trip> listAll() {
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}

	@Override
	public void update(Trip trip) {
		sqlSession.update(NAMESPACE + ".update", trip);
	}

	@Override
	public void delete(int no) {
		sqlSession.delete(NAMESPACE + ".delete", no);
	}

	@Override
	public List<RouteInfo> getTrip() {
		return sqlSession.selectList(NAMESPACE + ".getTrip");
	}

	@Override
	public RouteInfo getSpot(int no) {
		return sqlSession.selectOne(NAMESPACE+".getSpot", no);
	}
	
	@Override
	public List<RouteInfo> listPage(int page, int themeNo, List<Integer> cityNo){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("themeNo", themeNo);
		map.put("cityNo", cityNo);
		
		return sqlSession.selectList(NAMESPACE+".listPage", map);
	}
	
	@Override
	public int maxPage(List<Integer> cityNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("cityNo", cityNo);
		return sqlSession.selectOne(NAMESPACE+".maxPage", map);
	}
	
	@Override
	public RouteInfo getByTripNo(int no) {
		return sqlSession.selectOne(NAMESPACE+".getByTripNo", no);
	}

}
