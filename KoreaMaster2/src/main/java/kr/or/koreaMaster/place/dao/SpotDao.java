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
	
	/** 도시에 따른 목록 반환 */
	public List<Integer> getSpotByCity(int cityNo);
	
}









