package data.mapperH;

import data.dto.UserDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TestMapperInter {
    @Select("SELECT * FROM sys_user WHERE user_id = #{userId}")
    public UserDto getSessionid(String userId);


    @Insert("INSERT INTO sys_test (lecture_no, user_no, test_content) VALUES (#{lectureNo}, #{userno}, #{testContent})")
    public void insertTest(int lectureNo, int userno, String testContent);

}

