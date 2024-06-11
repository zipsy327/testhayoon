package controllerH.index;

import data.serviceH.UserService;
import data.serviceW.AttendanceService;
import data.serviceW.HolidayService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @Autowired
    private HolidayService holidayService;

    @Autowired
    private AttendanceService attendanceService;

    @Autowired
    private UserService userService;

    @GetMapping("/index/index")
    public String index(HttpSession session, Model model) {
        String user_id = (String) session.getAttribute("loginid");
        int user_no = holidayService.getSessionUserno(user_id);
        int check = attendanceService.getCheckIn(user_no);
        int user_category = userService.userCate(user_no);
        System.out.println(user_no);
        System.out.println(user_category);
        String lecture_name = userService.getLecturename(user_no);
        model.addAttribute("lecture_name", lecture_name);
        model.addAttribute("check", check);
        model.addAttribute("user_category", user_category);
        return "home/index";
    }

}
