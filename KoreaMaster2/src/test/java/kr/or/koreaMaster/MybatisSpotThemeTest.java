package kr.or.koreaMaster;

import org.apache.log4j.Logger;
import org.junit.Test;

import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAO;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAOImpl;
import kr.or.koreaMaster.spotTheme.domain.SpotTheme;

public class MybatisSpotThemeTest {
Logger logger = Logger.getLogger(MybatisSpotDaoTest.class);
	
	DaoFactory factory = new MyBatisDaoFactory();
	SpotThemeDAO dao = (SpotThemeDAO)factory.getDao(SpotThemeDAOImpl.class);
	
//	@Test
	public void test() {
		logger.debug(dao.readThemeBySpot(1));
	}
	
	@Test
	public void insertTest() {
		SpotTheme spotTheme = new SpotTheme(1, 1);
		dao.create(spotTheme);
	}
}
