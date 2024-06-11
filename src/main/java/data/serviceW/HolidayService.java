package data.serviceW;

import data.dto.AttendanceDto;
import data.dto.HdkindDto;
import data.dto.HolidayDto;
import data.dto.UserDto;
import data.mapperW.HolidayMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HolidayService {

    @Autowired
    private HolidayMapperInter holidayInter;

    public int getSessionUserno(String user_id) {
        System.out.println("서비스옴");
        return holidayInter.getSessionUserno(user_id);
    }

    public UserDto getHoliday(int user_no) {

        return holidayInter.getHoliday(user_no);
    }

    public List<HdkindDto> getHdkind() {
        return holidayInter.getHdkind();
    }

    public void holidayInsert(HolidayDto dto) {
        holidayInter.holidayInsert(dto);
    }

    public String hdkindName(int hdkind_no) {
        return holidayInter.getHdkindName(hdkind_no);
    }

    public List<UserDto> getUser(int user_no) {
        return holidayInter.getUser(user_no);
    }

    public int getHolidayDays(int user_no) {
        return holidayInter.getHolidayDays(user_no);
    }

    /*public int getHolidayCount(int user_no){
        return holidayInter.getHolidayCount(user_no);
    }

   /* public HolidayDto getHolidayByUserNo(int user_no){
        return holidayInter.getHolidayByUserNo(user_no);
    }*/
    public List<HolidayDto> getHolidaydto(int user_no) {
        return holidayInter.getHolidaydto(user_no);
    }


}