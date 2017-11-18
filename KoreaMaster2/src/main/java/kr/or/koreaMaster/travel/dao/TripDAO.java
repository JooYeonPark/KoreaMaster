package kr.or.koreaMaster.travel.dao;

import java.util.HashMap;
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
	
	/** tripNo과 일치하는 routeNo, tripNo반환 */
	public RouteInfo getByTripNo(int no);

	/** 테이블에 있는 모든 route의 spot 정보 반환 */
	public RouteInfo getSpot(int no);
	
	/** 페이징 처리를 위해 필요한 데이터들을 list에 저장해 반환 */
	public List<RouteInfo> listPage(int page, int themeNo, List<Integer> cityNo);
	
	/** 페이징 처리를 위한 최대 페이지 반환 */
	public int maxPage(List<Integer> cityNo);
	
	
}
