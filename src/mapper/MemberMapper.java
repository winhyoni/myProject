package mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {
	
	@Select("select * from member where memberno=#{memberno}")
	Member select1(String memberno);
	
	@Update("update member set pass=#{pass},name=#{name},jumin=#{jumin}, gender=#{gender},email=#{email},tel=#{tel},picture=#{picture}, dpt=#{dpt}, position=#{position}, rank=#{rank} where memberno=#{memberno}")
	int update(Member mem);

	@Insert("insert into member (name,memberno,jumin,pass,tel,email,gender,dpt,position,picture,rank) values (#{name},#{memberno},#{jumin},#{pass},#{tel},#{email},#{gender},#{dpt},#{position},#{picture},#{rank})")
	int insert(Member mem);

	@Delete("delete from member where memberno=#{memberno}")
	int delete(Member mem);
	
}
