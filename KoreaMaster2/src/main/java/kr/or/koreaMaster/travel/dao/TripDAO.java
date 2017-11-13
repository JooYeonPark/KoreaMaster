package kr.or.koreaMaster.travel.dao;

import java.util.List;
import java.util.Map;

import kr.or.koreaMaster.travel.domain.RouteInfo;
import kr.or.koreaMaster.travel.domain.Trip;

/**
 * Trip 데이터베이스 관련 처리
 * 
 * @author JooYeon
 *
 */
public interface TripDAO {
	/** 생성 */
	public int create(Trip trip);

	/** 조회 */
	public Trip read(int no);

	/** 전체 조회 */
	public List<Trip> listAll();

	/** 수정 */
	public void update(Trip trip);

	/** 삭제 */
	public void delete(int no);

	/** 현재 trip의 모든 list의 routeNo, tripNo반환 */
	public List<RouteInfo> getTrip();

	/** 테이블에 있는 모든 route의 spot 정보 반환 */
	public List<RouteInfo> getSpot();
}
