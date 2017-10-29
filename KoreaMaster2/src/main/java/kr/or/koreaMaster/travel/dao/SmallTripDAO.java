package kr.or.koreaMaster.travel.dao;

import java.util.List;

import kr.or.koreaMaster.travel.domain.SmallTrip;

/**
 * SmallTrip 데이터베이스 관련 처리
 * 
 * @author 박주연
 *
 */
public interface SmallTripDAO {
	/** 생성 */
	public void create(SmallTrip smallTrip);
	/** 조회 */
	public SmallTrip read(SmallTrip smallTrip);
	/** 전체 조회 */
	public List<SmallTrip> listAll();
	/** 수정 */
	public void update(SmallTrip smallTrip);
	/** 삭제 */
	public void delete(SmallTrip smallTrip);
}









