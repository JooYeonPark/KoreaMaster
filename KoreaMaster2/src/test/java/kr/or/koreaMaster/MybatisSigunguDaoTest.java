package kr.or.koreaMaster;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;

import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.dao.SigunguDao;
import kr.or.koreaMaster.place.dao.SigunguDaoImpl;
import kr.or.koreaMaster.place.domain.Sigungu;
import kr.or.koreaMaster.place.domain.Spot;

public class MybatisSigunguDaoTest {
	Logger logger = Logger.getLogger(MybatisSigunguDaoTest.class);
	
	DaoFactory factory = new MyBatisDaoFactory();
	SigunguDao dao = (SigunguDao)factory.getDao(SigunguDaoImpl.class);
	
//	@Test
	public void listAllTest() {
		List<Sigungu> list = dao.listAll();
		for (Sigungu sigungu : list) {
			logger.info(sigungu.toString());
		}
	}
	
//	@Test
	public void readTest() {
		Sigungu sigungu = dao.read(1);
		logger.info(sigungu);
	}
}
