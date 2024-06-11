package data.mapperW;

import data.dto.AttendanceDto;
import data.dto.HdkindDto;
import data.dto.HolidayDto;
import data.dto.UserDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface HolidayMapperInter {

    @Select("select user_no from sys_user where user_id=#{user_id}")
    public int getSessionUserno(String user_id);

    @Select("select * from sys_user where user_no = #{user_no}")
    public UserDto getHoliday(int user_no);

    @Select("select * from sys_hdkind")
    public List<HdkindDto> getHdkind();

    @Insert("insert into sys_holiday(user_no, hdkind_no, holiday_start, holiday_end) values(#{user_no}, #{hdkind_no}, #{holiday_start}, #{holiday_end})")
    public void holidayInsert(HolidayDto dto);

    @Select("select hdkind_name from sys_hdkind where hdkind_no = #{hdkind_no}")
    public String getHdkindName(int hdkind_no);

    @Select("select * from sys_user u right join sys_holiday h on u.user_no = h.user_no right join sys_hdkind hd on hd.hdkind_no = h.hdkind_no where u.user_no = #{user_no}")
    public List<UserDto> getUser(int user_no);

    @Select("SELECT COALESCE(SUM(DATEDIFF(holiday_end, holiday_start)), 0) AS holiday_days FROM sys_holiday WHERE user_no = #{user_no}")
    public int getHolidayDays(int user_no);


    @Select("Select * FROM sys_holiday WHERE user_no = #{user_no}")
    public List<HolidayDto> getHolidaydto(int user_no);



}

