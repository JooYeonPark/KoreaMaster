package kr.or.koreaMaster;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;

import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAO;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAOImpl;
import kr.or.koreaMaster.spotTheme.domain.SpotTheme;
import kr.or.koreaMaster.theme.session.MyTravelTypeRepository;

public class MybatisSpotThemeTest {
Logger logger = Logger.getLogger(MybatisSpotDaoTest.class);
	
	DaoFactory factory = new MyBatisDaoFactory();
	SpotThemeDAO dao = (SpotThemeDAO)factory.getDao(SpotThemeDAOImpl.class);
	MyTravelTypeRepository themeDao = new MyTravelTypeRepository();
	
//	@Test
	public void test() {
		logger.debug(dao.readThemeBySpot(1));
	}
	
//	@Test
	public void insertTest() {
		SpotTheme spotTheme = new SpotTheme(1, 1);
		dao.create(spotTheme);
	}
	
	@Test
	public void themeName() {
		List<Integer> themeList = dao.readThemeBySpot(2);
		for (Integer inta : themeList) {
			System.out.println((int)inta);
		}
	}
}
