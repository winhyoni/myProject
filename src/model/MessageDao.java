package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.BoardMapper;
import mapper.MessageMapper;



public class MessageDao {
	private static final String ns="mapper.MessageMapper.";

	public int maxNum() {
		SqlSession session = DBConnection.getConnection();
		try {
			int result = session.getMapper(MessageMapper.class).maxNum();
			return result;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int insert(Message mes) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(MessageMapper.class).insert(mes);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int sendmessageCount(String column, String find, String memberno) {
		SqlSession session = DBConnection.getConnection();
		try {
			Map map = new HashMap();
			map.put("column", column);
			map.put("find", find);
			map.put("memberno", memberno);
			int result = session.selectOne(ns+"sendmessageCount", map);
			return result; //현재 등록된 게시물 건수 리턴
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public List<Message> sendmessagelist(int pageNum, int limit, String column, String find, String memberno) {
		SqlSession session = DBConnection.getConnection();
		int startrow = (pageNum-1)*limit;
		Map map = new HashMap();
		map.put("limit", limit);
		map.put("startrow", startrow);
		map.put("column", column);
		map.put("find", find);
		map.put("memberno", memberno);
		try {
			return session.selectList(ns+"sendmessagelist", map);
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public int receivemessageCount(String column, String find, String memberno) {
		SqlSession session = DBConnection.getConnection();
		try {
			Map map = new HashMap();
			map.put("column", column);
			map.put("find", find);
			map.put("memberno", memberno);
			int result = session.selectOne(ns+"receivemessageCount", map);
			return result; //현재 등록된 게시물 건수 리턴
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public List<Message> receivemessagelist(int pageNum, int limit, String column, String find, String memberno) {
		SqlSession session = DBConnection.getConnection();
		int startrow = (pageNum-1)*limit;
		Map map = new HashMap();
		map.put("limit", limit);
		map.put("startrow", startrow);
		map.put("column", column);
		map.put("find", find);
		map.put("memberno", memberno);
		try {
			return session.selectList(ns+"receivemessagelist", map);
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public Message selectOne(String no) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(MessageMapper.class).select(no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}

	public void update(String no) {
		SqlSession session = DBConnection.getConnection();
		try {
			session.getMapper(MessageMapper.class).update(no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
	}

	public int senddelete(String no) {
		SqlSession session = DBConnection.getConnection();
		try {
			int result = session.getMapper(MessageMapper.class).senddelete(no);
			return result;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int receivedelete(String no) {
		SqlSession session = DBConnection.getConnection();
		try {
			int result = session.getMapper(MessageMapper.class).receivedelete(no);
			return result;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public void delete(String no) {
		SqlSession session = DBConnection.getConnection();
		try {
			session.getMapper(MessageMapper.class).delete(no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
	}
}
