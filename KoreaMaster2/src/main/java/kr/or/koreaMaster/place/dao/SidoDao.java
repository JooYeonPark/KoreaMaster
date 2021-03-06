package kr.or.koreaMaster.place.dao;

import java.util.List;

import kr.or.koreaMaster.place.domain.Sido;

/**
 * 시도(sido) 관련 Dao
 * 
 * @author 김수진
 *
 */

public interface SidoDao {
	
	/** 신규 등록 */
	public void create(Sido sido);
	
	/** 전체 목록 반환 */
	public List<Sido> listAll();
	
	/** 번호로 조회 */
	public Sido read(int no);
	
	/** 이름로 조회 */
	public Sido readByName(String name);
	
	/** 수정 */
	public void update(Sido sido);
	
	/** 삭제 */
	public void delete(int no);
}









