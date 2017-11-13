package kr.or.koreaMaster;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;

import kr.or.koreaMaster.theme.session.MyTravelTypeRepository;

public class ThemeTest {
	Logger logger = Logger.getLogger(ThemeTest.class);
	MyTravelTypeRepository rep = new MyTravelTypeRepository();
	List<Integer> themeNo = rep.getNoById("joo");
	
	@Test
	public void test() {
		logger.debug(themeNo);
	}
}
