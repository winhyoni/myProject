package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.MemberMapper;

public class MemberDao {
	private static final String ns="mapper.MemberMapper.";

	public Member selectOne(String memberno) {
		SqlSession session = DBConnection.getConnection();
		try {
			return (Member)session.getMapper(MemberMapper.class).select1(memberno);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}

	public int update(Member mem) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(MemberMapper.class).update(mem);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int insert(Member mem) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(MemberMapper.class).insert(mem);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int delete(Member mem) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(MemberMapper.class).delete(mem);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public List<Member> list(int pageNum, int limit, String column, String find) {
		SqlSession session = DBConnection.getConnection();
		int startrow = (pageNum-1)*limit;
		Map map = new HashMap();
		map.put("limit", limit);
		map.put("startrow", startrow);
		map.put("column", column);
		map.put("find", find);
		try {
			return session.selectList(ns+"select", map);
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public int memberCount(String column, String find) {
		SqlSession session = DBConnection.getConnection();
		try {
			Map map = new HashMap();
			map.put("column", column);
			map.put("find", find);
			int result = session.selectOne(ns+"memberCount", map);
			return result; //현재 등록된 게시물 건수 리턴
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public List<Member> teamlist(int pageNum, int limit, String column, String find, String dpt) {
		SqlSession session = DBConnection.getConnection();
		int startrow = (pageNum-1)*limit;
		Map map = new HashMap();
		map.put("limit", limit);
		map.put("startrow", startrow);
		map.put("column", column);
		map.put("find", find);
		map.put("dpt", dpt);
		try {
			return session.selectList(ns+"select2", map);
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public int teammemberCount(String column, String find, String dpt) {
		SqlSession session = DBConnection.getConnection();
		try {
			Map map = new HashMap();
			map.put("column", column);
			map.put("find", find);
			map.put("dpt", dpt);
			int result = session.selectOne(ns+"teammemberCount", map);
			return result; //현재 등록된 게시물 건수 리턴
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
}
