package controllerH.Attendance;

import data.dto.AttendanceDto;
import data.dto.HolidayDto;
import data.dto.UserDto;
import data.serviceH.UserService;
import data.serviceW.AttendanceService;
import data.serviceW.HolidayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CalendarController {
    @Autowired
    private AttendanceService attendanceService;

    @Autowired
    private UserService userService;

    @Autowired
    private HolidayService holidayService;

    @GetMapping("/Calendar/check")
    public String Calendarcheck(Model model, @RequestParam String user_id) {
        UserDto userDto = userService.getSessionULno(user_id);
        int user_no = userDto.getUser_no();

        List<AttendanceDto> list = userService.getAttendancedto(user_no);

        for (AttendanceDto dto : list) {
            System.out.println(dto.getAttendance_day());
            System.out.println(dto.getAttendance_in());
            System.out.println(dto.getAttendance_out());
        }

        model.addAttribute("list", list);



        List<HolidayDto> holidayList = holidayService.getHolidaydto(user_no);

        /*for(HolidayDto dto : holidayList){

        }*/

        model.addAttribute("holidayList", holidayList);

        return "user/Calendar";
    }
}

