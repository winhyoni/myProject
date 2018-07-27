package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.BoardMapper;
import mapper.CalenderMapper;

public class CalenderDao {
	private static final String ns="mapper.CalenderMapper.";

	public int insert(Calender cal) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(CalenderMapper.class).insert(cal);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int maxNum() {
		SqlSession session = DBConnection.getConnection();
		try {
			int result = session.getMapper(CalenderMapper.class).maxNum();
			return result;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public List<Calender> calenderlist(String memberno) {
		SqlSession session = DBConnection.getConnection();
		Map map = new HashMap();
		map.put("memberno", memberno);
		try {
			return session.selectList(ns+"calenderlist", map);
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public Calender selectOne(int no) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(CalenderMapper.class).select(no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}

	public int update(Calender cal) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(CalenderMapper.class).update(cal);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int delete(String no) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(CalenderMapper.class).delete(no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
}
