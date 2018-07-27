package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.BoardMapper;
import mapper.ReplyMapper;

public class ReplyDao {
	private static final String ns="mapper.ReplyMapper.";

	public List<Reply> replylist(String no) {
		SqlSession session = DBConnection.getConnection();
		Map map = new HashMap();
		map.put("no", no);
		try {
			return session.selectList(ns+"replylist", map);
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public int maxreplyno() {
		SqlSession session = DBConnection.getConnection();
		try {
			int result = session.getMapper(ReplyMapper.class).maxNum();
			return result;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public void insert(Reply reply) {
		SqlSession session = DBConnection.getConnection();
		try {
			session.getMapper(ReplyMapper.class).insert(reply);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
	}

	public Reply select(String replyno) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(ReplyMapper.class).select(replyno);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}

	public void delete(String replyno) {
		SqlSession session = DBConnection.getConnection();
		try {
			session.getMapper(ReplyMapper.class).delete(replyno);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
	}

	public void update(Reply reply) {
		SqlSession session = DBConnection.getConnection();
		try {
			session.getMapper(ReplyMapper.class).update(reply);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
	}

	public void replyreg(Reply reply) {
		SqlSession session = DBConnection.getConnection();
		int replyno = this.maxreplyno();
		int ref = reply.getRef();
		int reflevel = reply.getReflevel();
		int refstep = reply.getRefstep();
		try {
			session.getMapper(ReplyMapper.class).reply(reply);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		reply.setRef(ref); // 원글의 ref와 같아야 하므로 변경 할 필요가 없다.
		reply.setReflevel(++reflevel);
		reply.setRefstep(++refstep);
		reply.setReplyno(++replyno);
		this.insert(reply);
		
	}

	public void boredelete(int no) {
		SqlSession session = DBConnection.getConnection();
		try {
			session.getMapper(ReplyMapper.class).boredelete(no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
	}

}
