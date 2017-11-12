package kr.or.koreaMaster.place.dao;

import java.util.List;

import kr.or.koreaMaster.place.domain.Restaurant;

/**
 * 식당(Restaurant) 관련 Dao
 * 
 * @author 김수진
 *
 */

public interface RestaurantDao {
	
	/** 신규 등록 */
	public void create(Restaurant restaurant);
	
	/** 전체 목록 반환 */
	public List<Restaurant> listAll();
	
	/** 페이지별 목록 반환 */
	public List<Restaurant> listPage(int page, String sort);
	
	/** 번호로 조회 */
	public Restaurant read(int no);
	
	/** 시도번호, 이름으로 조회 */
	public Restaurant readByCityNoName(String name, int cityNo);
	
	/** 수정 */
	public void update(Restaurant restaurant);
	
	/** 삭제 */
	public void delete(int no);
	
	/** 페이지 전체 수 반환 */
	public int maxPage();
	
	/** readByCityNo */
	public List<Restaurant> readBycityNo(int cityNo, int no);
}









