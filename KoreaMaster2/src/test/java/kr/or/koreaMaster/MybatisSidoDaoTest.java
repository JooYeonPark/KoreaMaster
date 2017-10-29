package kr.or.koreaMaster;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;

import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.sido.dao.SidoDao;
import kr.or.koreaMaster.sido.dao.SidoDaoImpl;
import kr.or.koreaMaster.sido.domain.Sido;

public class MybatisSidoDaoTest {
	Logger logger = Logger.getLogger(MybatisSidoDaoTest.class);
	
	DaoFactory factory = new MyBatisDaoFactory();
	SidoDao dao = (SidoDao)factory.getDao(SidoDaoImpl.class);
	
//	@Test
	public void listAllTest() {
		List<Sido> list = dao.listAll();
		for (Sido sido : list) {
			logger.info(sido.toString());
		}
	}
	
//	@Test
	public void readTest() {
		Sido sido = dao.read(1);
		logger.info(sido);
	}
	
}
