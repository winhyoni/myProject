package mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.Reply;

public interface BoardMapper {

	@Select("select max(no) from board")
	int maxNum(Board board);

	@Insert("insert into board (no,name, pass, subject, content, file1, regdate, readcnt, kindno, memberno) values (#{no},#{name},#{pass},#{subject},#{content},#{file1},now(),0,#{kindno},#{memberno})")
	int insert(Board board);

	@Select("select * from board where no=#{no}")
	Board select(String num);

	@Update("update board set readcnt = readcnt + 1 where no=#{no}")
	void addReadCnt(String no);

	@Update("update board set subject=#{subject}, content=#{content}, file1=#{file1} where no=#{no}")
	int update(Board board);

	@Delete("delete from board where no = #{no}")
	int delete(int no);

}
