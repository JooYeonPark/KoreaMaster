package kr.or.koreaMaster.Jsoup;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class CommonParsing {

	public Map<String, Object> commonData(Document document) {
		Map<String, Object> map = new HashMap<>();

		Elements titleContent = document.select("h3"); // Spot Name --
		Elements figcaptiontavleNum = document.select("figcaption li b"); // Spot address, phone, operationHour, closeDate --
		Elements figcaptiontavle = document.select("figcaption li span"); // Spot address, phone, operationHour, closeDate --
		Element imageDiv = document.select("figure img").first(); // 사진 저장 --
		Element useNumdiv = document.select("li[class='look']").first(); // useNum --

		String title = titleContent.text();

		String addressDetail = "";
		String phone = "";
		String operatingHour = "";
		String closedDate = "";

		// 주소, 전화번호, 시간, 쉬는날
		List<String> bListNum = figcaptiontavleNum.eachText();
		List<String> spanList = figcaptiontavle.eachText();
		for (int i = 0; i < bListNum.size(); i++) {
			switch (bListNum.get(i)) {
			case "위치":
				addressDetail = spanList.get(i);
				break;

			case "문의":
				phone = spanList.get(i);
				break;

			case "문의/안내":
				phone = spanList.get(i);
				break;

			case "이용시간":
				operatingHour = spanList.get(i);
				break;
				
			case "영업시간":
				operatingHour = spanList.get(i);
				break;

			case "쉬는날":
				closedDate = spanList.get(i);
				break;

			default:
				break;
			}
		}

		String img = imageDiv.attr("src");
		StringTokenizer imgtoken = new StringTokenizer(img, "/");
		String saveImageName = "";
		while (imgtoken.hasMoreElements()) {
			saveImageName = (String) imgtoken.nextElement();
		}
		Thread t = new ImageSaver(img, saveImageName);
		t.start();

		// 조회수
		char tmp[] = useNumdiv.text().toCharArray();
		String useNum = "";
		for (int i = 5; i < tmp.length; i++) {
			useNum += tmp[i];
		}
		
		map.put("title", title);
		map.put("addressDetail", addressDetail);
		map.put("phone", phone);
		map.put("operatingHour", operatingHour);
		map.put("closedDate", closedDate);
		map.put("saveImageName", saveImageName);
		map.put("useNum", useNum);

		return map;

	}
}
