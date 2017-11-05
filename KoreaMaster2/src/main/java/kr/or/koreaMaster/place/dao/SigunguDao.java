package kr.or.koreaMaster.place.dao;

import java.util.List;

import kr.or.koreaMaster.place.domain.Sigungu;

/**
 * 시군구(Sigungu) 관련 Dao
 * 
 * @author 김수진
 *
 */

public interface SigunguDao {
	
	/** 신규 등록 */
	public void create(Sigungu sido);
	
	/** 전체 목록 반환 */
	public List<Sigungu> listAll();
	
	/** 번호로 조회 */
	public Sigungu read(int no);
	
	/** 수정 */
	public void update(Sigungu sido);
	
	/** 삭제 */
	public void delete(int no);
	
	/** 시도 번호로 조회 */
	public List<Sigungu> readBySido(int sidoNo);
}









