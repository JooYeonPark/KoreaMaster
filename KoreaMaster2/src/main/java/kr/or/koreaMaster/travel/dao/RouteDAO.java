package kr.or.koreaMaster.travel.dao;

import java.util.List;

import kr.or.koreaMaster.travel.domain.Route;
import kr.or.koreaMaster.travel.domain.Trip;

/**
 * @author JooYeon
 *
 */
public interface RouteDAO {
	/** 생성 */
	public void create(Route route);
	/** 조회 */
	public Route read(int no);
	/** 전체 조회 */
	public List<Route> listAll();
	/** 수정 */
	public void update(Route route);
	/** 삭제 */
	public void delete(int no);
	
	/** next_route_no에 따른 조회*/
	public Route getByNext(int next_no);
}
