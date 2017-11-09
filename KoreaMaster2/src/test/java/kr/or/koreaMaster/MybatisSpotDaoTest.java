package kr.or.koreaMaster;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;

import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.dao.SpotDao;
import kr.or.koreaMaster.place.dao.SpotDaoImpl;
import kr.or.koreaMaster.place.domain.Spot;

public class MybatisSpotDaoTest {
	Logger logger = Logger.getLogger(MybatisSpotDaoTest.class);
	
	DaoFactory factory = new MyBatisDaoFactory();
	SpotDao dao = (SpotDao)factory.getDao(SpotDaoImpl.class);
	
//	@Test
	public void listAllTest() {
		List<Spot> list = dao.listAll();
		for (Spot spot : list) {
			logger.info(spot.toString());
		}
	}
	
//	@Test
	public void readTest() {
		Spot spot = dao.read(1);
		logger.info(spot);
	}
	
//	@Test
	public void listByCity() {
		/*List<Spot> list = dao.listByCity(2);
		logger.debug(list);*/
	}
	
//	@Test
	public void listPageTest() {
		List<Spot> list = dao.listPage(1);
		for (Spot spot : list) {
			logger.info(spot.toString());
		}
	}
}
