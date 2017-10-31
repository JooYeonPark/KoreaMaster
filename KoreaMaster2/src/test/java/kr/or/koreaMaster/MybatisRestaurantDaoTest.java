package kr.or.koreaMaster;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;

import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.dao.RestaurantDao;
import kr.or.koreaMaster.place.dao.RestaurantDaoImpl;
import kr.or.koreaMaster.place.domain.Restaurant;


public class MybatisRestaurantDaoTest {
	Logger logger = Logger.getLogger(MybatisRestaurantDaoTest.class);
	
	DaoFactory factory = new MyBatisDaoFactory();
	RestaurantDao dao = (RestaurantDao)factory.getDao(RestaurantDaoImpl.class);
	
//	@Test
	public void listAllTest() {
		List<Restaurant> list = dao.listAll();
		for (Restaurant restaurant : list) {
			logger.info(restaurant.toString());
		}
	}
	
//	@Test
	public void readTest() {
		Restaurant restaurant = dao.read(1);
		logger.info(restaurant);
	}
	
}
