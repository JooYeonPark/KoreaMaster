package kr.or.koreaMaster.place.dao;

import java.util.List;
import java.util.Map;

import kr.or.koreaMaster.place.domain.Spot;

/**
 * 장소 관련 Dao
 * 
 * @author 김수진
 *
 */

public interface SpotDao {
	
	/** 신규 등록 */
	public void create(Spot spot);
	
	/** 전체 목록 반환 */
	public List<Spot> listAll();
	
	/** 장소 번호로 장소 조회 */
	public Spot read(int no);
	
	/** 장소 수정 */
	public void update(Spot spot);
	
	/** 장소명, 도시번호로 장소 조회 */
	public Spot readByNameCity(String name, int cityNo);
	
	/** 도시에 따른 목록 반환 */
	public List<Integer> getSpotByCity(int cityNo);
	
	/** 페이지에 따른 장소리트스 반환 */
	public List<Spot> listPage(int page, int themeNo, String sort);
	
	/** 도시별 장소 반환 */
	public List<Spot> readBycityNo(int cityNo, int spotNo);
	
	/** 마지막 페이지 수 반환 */
	public int maxPage();
	
}









