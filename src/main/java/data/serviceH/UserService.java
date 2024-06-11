package data.serviceH;

import data.dto.AttendanceDto;
import data.mapperW.AttendanceMapperInter;
import data.serviceW.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import data.dto.UserDto;
import data.mapperH.UserMapperInter;

import java.util.List;
import java.util.Map;

@Service
public class UserService {
    @Autowired
    private UserMapperInter userInter;

    @Autowired
    private AttendanceMapperInter attendanceInter;

    
    public void insertMember(UserDto dto) {
        userInter.insertMember(dto);
    }

    public UserDto getDataById(String userId) {
        return userInter.getDataById(userId);
    }

    public int getIdCheckCount(String searchid)
    {
        return userInter.getIdCheckCount(searchid);
    }

    public int getIdCheckByUserId(String user_id, String user_password){
        return userInter.getIdCheckByUserId(user_id, user_password);
    }

    public UserDto getSessionULno(String userId){
        return userInter.getSessionULno(userId);
    }

    public int userCate(int user_no){
        return userInter.userCate(user_no);
    }


    public int getAttendedDays(int user_no){
        return userInter.getAttendedDays(user_no);
    }

    public List<AttendanceDto> getAttendancedto(int user_no){
        return attendanceInter.getAttendancedto(user_no);
    }


    public void updateHoliday(Map<String, Object> map){
        userInter.updateHoliday(map);
    }

    public String getLecturename(int user_no){
        return userInter.getLecturename(user_no);
    }

    public void updateIncentive(Map<String, Object> map){
        userInter.updateIncentive(map);
    }

    public int getIncentive(int user_no){
        return userInter.getIncentive(user_no);
    }

}
