package controllerW.holiday;

import data.serviceW.AttendanceService;
import data.serviceW.HolidayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AttendanceController {
    @Autowired
    private AttendanceService attendanceService;

    @Autowired
    private HolidayService holidayService;

    @GetMapping("/attendance/in")
    public String attendacnceIn(Model model, String user_id) {
        int user_no = holidayService.getSessionUserno(user_id);
        attendanceService.insertAttendanceIn(user_no);
        return "redirect:/index/index";
    }

    @GetMapping("/attendance/out")
    public String attendacnceOut(Model model, String user_id) {
        int user_no = holidayService.getSessionUserno(user_id);
        int attendance_no = attendanceService.getAttendanceNo(user_no);
        attendanceService.updateAttendanceOut(attendance_no);
        return "redirect:/index/index";
    }
}
