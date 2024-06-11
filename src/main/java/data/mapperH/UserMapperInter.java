package data.mapperH;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import data.dto.UserDto;
import org.apache.ibatis.annotations.Update;

import java.util.Map;

@Mapper
public interface UserMapperInter {
	@Insert("""
	        INSERT INTO sys_user (user_name, user_id, user_password, user_addr1, user_addr2, user_postal,
	        user_residentno, user_email, user_category, user_gaipday, tutorcate_no)
	        VALUES (#{user_name}, #{user_id}, #{user_password}, #{user_addr1}, #{user_addr2}, #{user_postal},
	        #{user_residentno}, #{user_email}, #{user_category}, NOW(), #{tutorcate_no})
	    """)
	public void insertMember(UserDto dto);

    @Select("SELECT * FROM sys_user WHERE user_id = #{userId}")
    public UserDto getDataById(String userId);

	@Select("select count(*) from sys_user where user_id=#{searchid}")
	public int getIdCheckCount(String searchid);

	@Select("select count(*) from sys_user where user_id=#{user_id} and user_password = #{user_password}")
	public int getIdCheckByUserId(String user_id, String user_password);

	@Select("SELECT * FROM sys_user WHERE user_id = #{userId}")
	public UserDto getSessionULno(String userId);

	@Select("select user_category from sys_user where user_no = #{user_no}")
	public int userCate(int user_no);

	@Select("""
        WITH RECURSIVE DateRange AS (
            SELECT DATE(user_gaipday) AS date, user_no
            FROM sys_user
            WHERE user_no = #{user_no}
            UNION ALL
            SELECT DATE_ADD(date, INTERVAL 1 DAY), user_no
            FROM DateRange
            WHERE DATE_ADD(date, INTERVAL 1 DAY) < DATE_ADD((SELECT user_gaipday FROM sys_user WHERE user_no = #{user_no}), INTERVAL 1 MONTH)
        ),
        FilteredDates AS (
            SELECT date, user_no
            FROM DateRange
            WHERE DAYOFWEEK(date) NOT IN (1, 7)
        ),
        NonAttendanceDays AS (
            SELECT fd.date
            FROM FilteredDates fd
            LEFT JOIN sys_attendance a ON fd.date = a.attendance_day AND fd.user_no = a.user_no
            WHERE a.attendance_day IS NULL
        )
        SELECT COUNT(*) AS non_attended_days
        FROM NonAttendanceDays
    """)
	public int getAttendedDays(int user_no);

	@Update("update sys_user set user_holiday = user_holiday - #{holiday} where user_no = #{user_no}")
	public void updateHoliday(Map<String, Object> map);

	@Select("""
	select l.lecture_name from sys_lecture l left join sys_tutorcate t on l.lecture_no = t.lecture_no left join sys_user u on
    u.tutorcate_no = t.tutorcate_no where user_no = #{user_no};
""")
	public String getLecturename(int user_no);

	@Update("""
	update sys_user set user_incentive = #{user_incentive} where user_no = #{user_no}
""")
	public void updateIncentive(Map<String, Object> map);

	@Select("""
	select user_incentive from sys_user where user_no = #{user_no}
""")
	public int getIncentive(int user_no);


}
