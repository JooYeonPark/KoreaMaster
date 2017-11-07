package kr.or.koreaMaster.travel.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class findRoute {
	public static void main(String[] args) throws Exception {
		URL url = new URL(
				"https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&avoid=highway&origins=37.475983,126.870631&destinations=37.472981,126.888317&mode=transit&fare=value&key=AIzaSyD820E_vX9tr21dUgL1RKw-kjwoLkcMuKY");

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
		System.out.println(text);

	}

}
