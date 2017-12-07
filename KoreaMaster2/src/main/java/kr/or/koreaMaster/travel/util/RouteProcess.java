package kr.or.koreaMaster.travel.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.junit.Test;

import kr.or.koreaMaster.place.domain.Spot;
import kr.or.koreaMaster.spotTheme.domain.SpotThemeJoin;

public class RouteProcess {

	/** 생성자 */
	public RouteProcess() {}

	public List<Integer> findRoute(int date, List<Spot> departures, List<SpotThemeJoin> spotThemeJoinList) {

		/** 장소번호를 저장하여 루트를 저장할 변수 (dayNo, spotNo) */
		List<Integer> routeSpots = new ArrayList<Integer>();
		
		/*
		 * #1. 일자마다 4개의 장소를 추천. 만약 점수가 똑같은 장소가 있을 때 조회수순으로 내림차순으로 불러오기 때문에 상위에 있을 수록 인기가
		 * 많다는 가정하에 일자 갯수만큼 자름
		 */
		int cnt = date * 4;
		//장소간의 거리를 구하기 위한 변수
		String start = null;
		String end = null;
		//가장 가까운 거리를 찾기위해 장소번호와 가는 시간을 저장하는 변수
		int min = 0; 
		int spotNo = 0;
		int size = -1; //RouteThemeJoin의 인덱스 번호 식별자
		
		int duration = 0;
		int day = 1; 
		
		// #2. 출발장소로부터 가장 가까운 장소를 찾는다
		for (Spot departure : departures) {
			size = -1;//초기화
			//출발장소 루트에 추가
			routeSpots.add(departure.getNo());
			start = departure.getLatitude( ) + ","+departure.getLongitude();
			start = start.trim(); //혹시 모를 때를 대비해 공백 제거
			
			//4개의 장소로 하루의 루트가 다 짜지면 break
			while(routeSpots.size() < 5) {
				
				//시작장소
				if(size!=-1) {
					start = spotThemeJoinList.get(size).getLatitude()+ "," + spotThemeJoinList.get(size).getLongitude();
					start = start.trim();
				}
				
				//다음장소
				for(int i=0; i<cnt; i++) { //cnt = 4. 4개의 장소
					if(i == 0) { //초기화
						min = 100000; //임의 값
						spotNo = 0;
						size = 0;
					}
					if(spotThemeJoinList.get(i).getPass() == false) { //pass = true : 이미 루트에 저장되어 있는 장소 
						end = spotThemeJoinList.get(i).getLatitude() + "," + spotThemeJoinList.get(i).getLongitude();
						end = end.trim(); //혹시 모를 때를 대비해 공백 제거
						
						
						//두 장소 사이의 소요시간을 구함
						start = start.trim();
						end = end.trim();
						duration = getDistance(start,end);
						
						
						//현재 장소와 가장 가까운 장소를 구함
						if(min > duration) { 
							min = duration;
							spotNo = spotThemeJoinList.get(i).getSpotNo();
							size = i;
						} 
					}// end if
				}//end for
				
				routeSpots.add(spotNo);
				 spotThemeJoinList.get(size).setPass(true);
			}
			
			
			++day;
		}


		// #5. 완성!!
		return routeSpots;
	}

	public int getDistance(String start, String end) { //출발장소 위경도, 도착장소 위경도 (절대 공백이 있으면 안됨!! 주의!!)
		String result = null;
		String[] arr = null;
		try {
			String strUrl = "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&avoid=highway&origins=";
			strUrl += start;
			strUrl += "&destinations="+end;
			strUrl += "&mode=transit&fare=value&key=AIzaSyD820E_vX9tr21dUgL1RKw-kjwoLkcMuKY";
			
			URL url = new URL(strUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			StringBuffer sb = new StringBuffer();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			for (;;) {
				String line = br.readLine();
				if (line == null)
					break;
				sb.append(line + "\n");

			}

			br.close();
			conn.disconnect();

			
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(sb.toString());
			JSONObject jsonObject = (JSONObject) obj;

			JSONArray rowsArr = (JSONArray) jsonObject.get("rows");

			JSONObject elementsObj = (JSONObject) rowsArr.get(0);
			JSONArray elementsArr = (JSONArray) elementsObj.get("elements");

			JSONObject duration = (JSONObject) elementsArr.get(0);
			JSONObject durationObj = (JSONObject) duration.get("duration");

			String text = (String) durationObj.get("text");
			result = text;
			
			arr = text.split(" ");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return Integer.parseInt(arr[0]);
	}
}
