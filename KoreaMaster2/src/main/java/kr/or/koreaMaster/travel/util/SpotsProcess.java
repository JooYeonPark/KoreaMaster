package kr.or.koreaMaster.travel.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import kr.or.koreaMaster.MybatisSpotDaoTest;
import kr.or.koreaMaster.spotTheme.domain.SpotTheme;

/**
 * 루트 추천을 위한 프로세스 처리 클래스
 * 
 * @author JooYeon
 *
 */
public class SpotsProcess {
	/** 회원의 성향에 따라 장소를 선택 후 저장할 변수 (장소번호,점수) */
	private Map<Integer, Integer> perSpots = null; 

	Logger logger ;
	
	/** 생성자 */ 
	public SpotsProcess(){
		perSpots = new HashMap<Integer,Integer>();
		logger = Logger.getLogger(MybatisSpotDaoTest.class);
	}
	
//	@Test
	public Map<Integer,Integer> getSpots(List<SpotTheme> spotThemeList, List<Integer> perThemes) {
		// 사용자의 테마와 장소의 테마의 일치 정도에 따라 점수를 부여함
		for (SpotTheme spotTheme : spotThemeList) {
			int score = spotTheme.getScore();
			float weight = 1.0F; //순위에 따라 다른 가중치주기 위한 변수
			
			for (Integer theme : perThemes) {
				weight -= 0.2F;
				if(theme == spotTheme.getThemeNo()) {
					score = Math.round(score+(10 * weight));
					perSpots.put(spotTheme.getSpotNo(), score);
				}
			}//end inner for
			
		}//outer for
		
//		logger.debug(perSpots);
		
		return perSpots;
	}
	
	
	
	
}
