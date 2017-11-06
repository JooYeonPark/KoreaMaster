package kr.or.koreaMaster.Jsoup;

import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import kr.or.koreaMaster.Jsoup.GeocoderLatLong;
import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.dao.SidoDao;
import kr.or.koreaMaster.place.dao.SidoDaoImpl;
import kr.or.koreaMaster.place.dao.SigunguDao;
import kr.or.koreaMaster.place.dao.SigunguDaoImpl;
import kr.or.koreaMaster.place.domain.Sido;
import kr.or.koreaMaster.place.domain.Sigungu;

public class AddressParsing {
	DaoFactory factory = new MyBatisDaoFactory();

	SidoDao sidoDao = (SidoDao) factory.getDao(SidoDaoImpl.class);
	SigunguDao sigunguDao = (SigunguDao) factory.getDao(SigunguDaoImpl.class);

	public Map<String, Object> addressData(String addressDetail) {
		String sidotmp = "";
		String sigungutmp = "";

		GeocoderLatLong geo = new GeocoderLatLong();

		Map<String, Object> map = new HashMap<String, Object>();

		StringTokenizer tokenizer = new StringTokenizer(addressDetail, " ");
		sidotmp = tokenizer.nextToken();
		sigungutmp = tokenizer.nextToken();

		// 시도, 시군구 주소
		switch (sidotmp) {
		case "서울":
			sidotmp = "서울특별시";
			break;
		case "제주도":
			sidotmp = "제주특별자치도";
			break;
		case "제주":
			sidotmp = "제주특별자치도";
			break;
		case "경북":
			sidotmp = "경상북도";
			break;
		case "경남":
			sidotmp = "경상남도";
			break;
		case "경기":
			sidotmp = "경기도";
			break;
		case "충남":
			sidotmp = "충청남도";
			break;
		case "전남":
			sidotmp = "전라남도";
			break;
		case "전북":
			sidotmp = "전라북도";
			break;
		case "강원":
			sidotmp = "강원도";
			break;
		case "충북":
			sidotmp = "충청북도";
			break;
		case "부산":
			sidotmp = "부산광역시";
			break;

		default:
			break;
		}

		Sido sido = sidoDao.readByName(sidotmp);
		if (sido == null) {
			sido = new Sido(sidotmp);
			sidoDao.create(sido);
		}
		int sidoNo = sido.getNo();

		Sigungu sigungu = null;
		char[] c = sigungutmp.toCharArray();
		if (c[c.length - 1] == '구') {
			sigungu = sigunguDao.readByMap("", sigungutmp, sidoNo);
		} else {
			sigungu = sigunguDao.readByMap(sigungutmp, "", sidoNo);
		}

		if (sigungu == null) {
			if (c[c.length - 1] == '구') {
				sigungu = new Sigungu(null, sigungutmp, sidoNo);
				sigunguDao.gucreate(sigungu);
			} else {
				sigungu = new Sigungu(sigungutmp, null, sidoNo);
				sigunguDao.siguncreate(sigungu);
			}
		}
		int cityNo = sigungu.getNo();
		map.put("cityNo", cityNo);

		double latitude = 0.0;
		double longitude = 0.0;

		Float[] coords = geo.geoCoding(addressDetail);
		if (coords != null) {
			latitude = coords[0];
			longitude = coords[1];
		}
		map.put("latitude", latitude);
		map.put("longitude", longitude);

		return map;
	}
}
