package mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Calender;

public interface CalenderMapper {

	@Select("select max(no) from calender")
	int maxNum();

	@Insert("insert into calender (no, subject, content, regdate, kindno, memberno) values (#{no},#{subject},#{content},#{regdate},#{kindno},#{memberno})")
	int insert(Calender cal);

	@Select("select * from calender where no=#{no}")
	Calender select(int no);

	@Update("update calender set subject=#{subject}, content=#{content}, regdate=#{regdate} where no=#{no}")
	int update(Calender cal);

	@Delete("delete from calender where no = #{no}")
	int delete(String no);

}
