package kr.or.koreaMaster.Jsoup;

import java.io.IOException;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;

/**
 * 위도 경도 구하는 class
 * @author 김수진
 */
public class GeocoderLatLong {
	
	public static Float[] geoCoding(String location) {
		if (location == null)
			return null;

		Geocoder geocoder = new Geocoder();
		// setAddress : 변환하려는 주소
		// setLanguate : 인코딩 설정
		GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(location).setLanguage("ko").getGeocoderRequest();
		GeocodeResponse geocoderResponse;

		try {
			geocoderResponse = geocoder.geocode(geocoderRequest);
			if (geocoderResponse.getStatus() == GeocoderStatus.OK & !geocoderResponse.getResults().isEmpty()) {

				GeocoderResult geocoderResult = geocoderResponse.getResults().iterator().next();
				LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();

				Float[] coords = new Float[2];
				coords[0] = latitudeLongitude.getLat().floatValue();
				coords[1] = latitudeLongitude.getLng().floatValue();
				return coords;
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return null;
	}

}
