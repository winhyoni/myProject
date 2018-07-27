package mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Message;

public interface MessageMapper {

	@Select("select max(no) from message")
	int maxNum();

	@Insert("insert into message (no,sendmem, receivemem, subject, content, file1, regdate, kindno, senddelete, receivedelete) values (#{no},#{sendmem},#{receivemem},#{subject},#{content},#{file1},now(),#{kindno},#{senddelete},#{receivedelete})")
	int insert(Message mes);

	@Select("select * from message where no=#{no}")
	Message select(String no);

	@Update("update message set kindno = 1 where no=#{no}")
	void update(String no);

	@Update("update message set senddelete = senddelete + 1 where no=#{no}")
	int senddelete(String no);

	@Update("update message set receivedelete = receivedelete + 1 where no=#{no}")
	int receivedelete(String no);

	@Delete("delete from message where no = #{no}")
	void delete(String no);

}
