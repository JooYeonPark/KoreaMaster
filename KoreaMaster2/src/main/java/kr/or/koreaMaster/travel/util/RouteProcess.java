package kr.or.koreaMaster.travel.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;

import kr.or.koreaMaster.place.domain.Spot;

public class RouteProcess {
    Logger logger = Logger.getLogger(RouteProcess.class);
    
    /** 생성자 */
    public RouteProcess() { }
    @Test
    public void findRoute(int date, List<Spot> departures) {
        
        /* #1. 
	        일자마다 4개의 장소를 추천. 
	        만약 점수가 똑같은 장소가 있을 때 조회수순으로 내림차순으로 불러오기 때문에
	        상위에 있을 수록 인기가 많다는 가정하에 일자 갯수만큼 자름 */

        //#2. 출발장소 db에 입력. 
        //더미데이터 여수 터미널
        
        //#3. 출발장소로부터 가장 가까운 장소를 찾는다
     
        //#4. 다음장소를 db에 입력
        
        //#5. 완성...!
    }
}
