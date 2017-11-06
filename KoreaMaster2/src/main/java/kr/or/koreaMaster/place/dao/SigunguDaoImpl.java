package kr.or.koreaMaster.place.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.koreaMaster.place.domain.Sigungu;

public class SigunguDaoImpl implements SigunguDao {
	
	private static final String NAMESPACE = "kr.or.koreaMaster.place.mapper.SigunguMapper";
	
	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void siguncreate(Sigungu sigungu) {
		sqlSession.insert(NAMESPACE+".siguncreate", sigungu);
	}
	
	@Override
	public void gucreate(Sigungu sigungu) {
		sqlSession.insert(NAMESPACE+".gucreate", sigungu);
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
	
	@Override
	/** 시도 번호로 조회 */
	public List<Sigungu> readBySido(int sidoNo) {
		return sqlSession.selectList(NAMESPACE+".readBySido", sidoNo);
	}
	
	@Override
	public Sigungu readByMap(String sigunName, String guName, int sidoNum) {
		Map<String, Object> map = new HashMap<>();
		map.put("sigunName", sigunName);
		map.put("guName", guName);
		map.put("sidoNum", sidoNum);
		
		return sqlSession.selectOne(NAMESPACE+".readByMap", map);
	}

	
}





