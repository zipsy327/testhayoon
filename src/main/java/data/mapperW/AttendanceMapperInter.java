package data.mapperW;

import data.dto.AttendanceDto;
import data.dto.UserDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

@Mapper
public interface AttendanceMapperInter {
    @Insert("insert into sys_attendance(attendance_in, attendance_day, user_no) values(now(), now(), #{user_no})")
    public void insertAttendanceIn(int user_no);

    @Update("update sys_attendance set attendance_out = now() where attendance_no = #{attendance_no}")
    public void updateAttendanceOut(int attendance_no);

    @Select("""
    SELECT
        CASE
            WHEN COUNT(*) = 0 THEN 1
            ELSE 0
            END AS result
    FROM sys_attendance
    WHERE user_no = #{user_no}
      AND DATE(attendance_day) = CURRENT_DATE
""")
    public int getCheckIn(int user_no);

    @Select("SELECT attendance_no FROM sys_attendance WHERE user_no = #{user_no} AND attendance_day = CURDATE()")
    public int getAttendanceNo(int user_no);


    @Select("Select * FROM sys_attendance WHERE user_no = #{user_no}")
    public List<AttendanceDto> getAttendancedto(int user_no);





}
