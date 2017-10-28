package kr.or.koreaMaster.spot.dao;

import java.util.List;

import kr.or.koreaMaster.spot.domain.Spot;

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
	
}









