package data.mapperW;

import data.dto.GradingDto;
import data.dto.TestDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface GradingMapperInter {
    @Select("""
select t.test_content, u.user_no, u.user_name, u.user_id, l.lecture_name from sys_test t left join sys_user u on u.user_no = t.user_no
    left join sys_tutorcate tu on tu.tutorcate_no = u.tutorcate_no left join sys_lecture l
        on l.lecture_no = t.lecture_no where u.tutorcate_no = #{tutorcate_no} group by u.user_name
""")
    public List<TestDto> getTest(int tutorcate_no);

    @Select("""
    select tutorcate_no from sys_user where user_no = #{user_no}
""")
    public int getTutorcate(int user_no);

    @Select("""
    select t.test_content, u.user_no, u.user_name, u.user_id, l.lecture_name, t.test_no from sys_test t left join sys_user u on u.user_no = t.user_no
        left join sys_tutorcate tu on tu.tutorcate_no = u.tutorcate_no left join sys_lecture l
            on l.lecture_no = t.lecture_no where u.tutorcate_no = #{tutorcate_no} and u.user_no = #{user_no}
""")
    public List<TestDto> getTestUser(Map<String, Object> map);

    @Insert("""
    insert into sys_grading(test_no, grading_content, grading_grade) values(#{test_no}, #{grading_content}, #{grading_grade})
""")
    public void insertGrading(GradingDto dto);
}
