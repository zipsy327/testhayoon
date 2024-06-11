package controllerW.holiday;

import data.dto.HdkindDto;
import data.dto.HolidayDto;
import data.dto.UserDto;
import data.serviceH.UserService;
import data.serviceW.HolidayService;
import jakarta.servlet.http.HttpSession;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class HolidayController {

    @Autowired
    private HolidayService holidayService;
    @Autowired
    private UserService userService;

    @GetMapping("/holiday/homain")
    public String homain(String user_id, Model model) {
        int user_no = holidayService.getSessionUserno(user_id);
        UserDto dto = new UserDto();
        dto = holidayService.getHoliday(user_no);
        model.addAttribute("dto", dto);
        return "holidayW/homain";
    }

    @GetMapping("/holiday/submit")
    public String submit(int user_no, Model model) {
        List<HdkindDto> list = holidayService.getHdkind();
        List<UserDto> listu = holidayService.getUser(user_no);

        System.out.println(user_no);



        java.util.Date currentDate = new java.util.Date();

        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");

        String formattedDate = sdf.format(currentDate);
        model.addAttribute("formattedDate", formattedDate);
        model.addAttribute("listu", listu);
        model.addAttribute("list", list);
        model.addAttribute("user_no", user_no);
        return "holidayW/holidaySubmit";
    }

    @PostMapping("/holiday/apply")
    @ResponseBody
    public Map<String, Object> applyHoliday(@RequestParam int hdkind_no, @RequestParam String holiday_start,
                                            @RequestParam String holiday_end, HttpSession session){
        String user_id = (String) session.getAttribute("loginid");
        int user_no = holidayService.getSessionUserno(user_id);

        System.out.println(user_id);
        System.out.println(user_no);

        int holiday = holidayService.getHolidayDays(user_no);
        System.out.println("힐리데[이 " + holiday);
        if(holiday != 0) {
            Map<String, Object> map = new HashMap<>();
            map.put("holiday", holiday);
            map.put("user_no", user_no);
            userService.updateHoliday(map);
        }

        HolidayDto dto = new HolidayDto();
        dto.setUser_no(user_no);
        dto.setHdkind_no(hdkind_no);
        dto.setHoliday_start(holiday_start);
        dto.setHoliday_end(holiday_end);

        System.out.println("ddd"+holiday_start);

        holidayService.holidayInsert(dto);

        UserDto dto2 = holidayService.getHoliday(user_no);

        String hdkind_name = holidayService.hdkindName(hdkind_no);

        Map<String, Object> map = new HashMap<>();
        map.put("user_name", dto2.getUser_name());
        map.put("user_id", dto2.getUser_id());
        map.put("holiday_start", dto.getHoliday_start());
        map.put("holiday_end", dto.getHoliday_end());
        map.put("hdkind_name", hdkind_name);
        return map;

    }

}
