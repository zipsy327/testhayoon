package data.mapperW;

import data.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TutorcateMapperInter {
    @Select("""
        select * from sys_user u left join sys_tutorcate t 
        on u.tutorcate_no = t.tutorcate_no left join sys_lecture l 
        on l.lecture_no = t.lecture_no where u.user_category = 2
""")
    public List<UserDto> getAllTutor();
}
