package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.BoardMapper;

public class BoardDao {
	private static final String ns="mapper.BoardMapper.";

	public int boardCount(String column, String find, int kindno) {
		SqlSession session = DBConnection.getConnection();
		try {
			Map map = new HashMap();
			map.put("column", column);
			map.put("find", find);
			map.put("kindno", kindno);
			int result = session.selectOne(ns+"boardCount", map);
			return result; //현재 등록된 게시물 건수 리턴
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public List<Board> boardlist(int pageNum, int limit, String column, String find, int kindno) {
		SqlSession session = DBConnection.getConnection();
		int startrow = (pageNum-1)*limit;
		Map map = new HashMap();
		map.put("limit", limit);
		map.put("startrow", startrow);
		map.put("column", column);
		map.put("find", find);
		map.put("kindno", kindno);
		try {
			return session.selectList(ns+"boardlist", map);
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public int maxNum(Board board) {
		SqlSession session = DBConnection.getConnection();
		try {
			int result = session.getMapper(BoardMapper.class).maxNum(board);
			return result;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int insert(Board board) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).insert(board);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public Board selectOne(String no) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).select(no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}

	public void addReadCnt(String no) {
		SqlSession session = DBConnection.getConnection();
		try {
			session.getMapper(BoardMapper.class).addReadCnt(no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
	}

	public int update(Board board) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).update(board);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int delete(int no) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).delete(no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
}
