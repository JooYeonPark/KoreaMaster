package kr.or.koreaMaster.travel.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.junit.Test;

import kr.or.koreaMaster.MybatisSpotDaoTest;
import kr.or.koreaMaster.spotTheme.domain.SpotTheme;
import kr.or.koreaMaster.spotTheme.domain.SpotThemeJoin;

/**
 * 루트 추천을 위한 프로세스 처리 클래스
 * 
 * @author JooYeon
 *
 */
public class SpotsProcess {
	private List<SpotThemeJoin> list = null;
    
    public List<SpotThemeJoin> getSpots(List<SpotThemeJoin> spotThemeJoinList, List<Integer> perThemes) {
    	
        // 사용자의 테마와 장소의 테마의 일치 정도에 따라 점수를 부여함
        for (SpotThemeJoin spotThemeJoin : spotThemeJoinList) {
            int score = spotThemeJoin.getScore();
            float weight = 1.0F; //순위에 따라 다른 가중치주기 위한 변수
            
            for (Integer theme : perThemes) {
                weight -= 0.2F;
                if(theme == spotThemeJoin.getThemeNo()) {
                    score = Math.round(score+(10 * weight));
                    spotThemeJoin.setScore(score);
                }
            }//end inner for
        }//outer for
        
        //점수에 따라 정렬
        quickSort(spotThemeJoinList, 0, spotThemeJoinList.size()-1);
        
        
        return spotThemeJoinList;
    }
    
    
    public static int partition(List<SpotThemeJoin> list, int left, int right) {

		int pivot = list.get((left + right) / 2).getScore() + list.get((left + right) / 2).getHitcount();
		
		while (left < right) {
			while ((list.get(left).getScore() +  list.get(left).getHitcount()  > pivot) && (left < right))
				left++;
			while ((list.get(right).getScore() +  list.get(right).getHitcount()  <= pivot) && (left < right))
				right--;

			if (left < right) {
				SpotThemeJoin leftDomain = list.get(left); 
				SpotThemeJoin rightDomain = list.get(right); 
				
				list.set(right, leftDomain);
				list.set(left, rightDomain);
			}
		}

		return left;
	}

	public static void quickSort(List<SpotThemeJoin> list, int left, int right) {

		if (left < right) {
			int pivotNewIndex = partition(list, left, right);

			quickSort(list, left, pivotNewIndex - 1);
			quickSort(list, pivotNewIndex + 1, right);
		}

	}
    
}
