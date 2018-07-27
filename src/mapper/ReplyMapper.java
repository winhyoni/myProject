package mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Reply;

public interface ReplyMapper {

	@Select("select max(replyno) from reply")
	int maxNum();

	@Insert("insert into reply (replyno, name, content, regdate, ref, reflevel, refstep, memberno, no) values (#{replyno}, #{name}, #{content}, now(), #{ref}, #{reflevel}, #{refstep}, #{memberno}, #{no})")
	void insert(Reply reply);

	@Select("select * from reply where replyno=#{replyno}")
	Reply select(String replyno);

	@Delete("delete from reply where replyno = #{replyno}")
	void delete(String replyno);

	@Update("update reply set content=#{content} where replyno=#{replyno}")
	void update(Reply reply);

	@Update("update reply set refstep = refstep+1 where ref=#{ref} and refstep > #{refstep}")
	void reply(Reply reply);

	@Delete("delete from reply where no = #{no}")
	void boredelete(int no);

	

}
