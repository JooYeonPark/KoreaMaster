package kr.or.koreaMaster.user.session;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.or.koreaMaster.user.model.NoteList;
import kr.or.koreaMaster.user.model.TripNote;
import kr.or.koreaMaster.user.model.TripNoteDetail;

public class TripNoteListRepository {
	private String namespace = "mapper.TripNoteMapper";

	SqlSessionFactory getSqlSessionFactory() {
		InputStream in = null;

		try {
			in = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (IOException e) {
			System.out.println("mybatis 설정 실패 : " + e.getMessage());
		}

		SqlSessionFactory sessFac = new SqlSessionFactoryBuilder().build(in);
		return sessFac;
	}
	
	
	// 리스트 가져오기
	public ArrayList<NoteList> getTripNote(String id) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			return (ArrayList)sess.selectList(namespace + ".getTripNote", id);
		} finally {
			sess.close();
		}
	}
	
	public ArrayList<TripNoteDetail> noteDetail(String id, int noteNo) {
		SqlSession sess = getSqlSessionFactory().openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("noteNo", noteNo);
		try {
			return (ArrayList)sess.selectList(namespace + ".noteDetail", map);
		} finally {
			sess.close();
		}
	}
	
	// 리스트 선택 삭제
	public int delTripNote(String id, int noteNo) {
		SqlSession sess = getSqlSessionFactory().openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("noteNo", noteNo);
		
		try {
			int result = sess.delete(namespace + ".delTripNote", map);
			int result2 = sess.delete(namespace + ".delTrip", map);
			
			if (result > 0) {
				sess.commit();
			} else {
				sess.rollback();
			}

			return result;
		} finally {
			sess.close();
		}
	}

}
