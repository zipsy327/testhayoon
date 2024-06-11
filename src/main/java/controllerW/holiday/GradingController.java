package controllerW.holiday;

import data.dto.GradingDto;
import data.dto.TestDto;
import data.serviceH.TestService;
import data.serviceH.UserService;
import data.serviceW.GradingService;
import data.serviceW.HolidayService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class GradingController {
    @Autowired
    private HolidayService holidayService;

    @Autowired
    private GradingService gradingService;
    @Autowired
    private TestService testService;

    @GetMapping("/grading/grade")
    public String grade(Model model, String user_id) {
        int user_no = holidayService.getSessionUserno(user_id);
        System.out.println(user_no);

        int tutorcate_no = gradingService.getTutorcate(user_no);
        System.out.println("ttttt" + tutorcate_no);

        List<TestDto> list = gradingService.getTest(tutorcate_no);

        model.addAttribute("list", list);
        model.addAttribute("tutorcate_no", tutorcate_no);
        return "grading/grade";
    }

    @GetMapping("/grading/score")
    public String score(Model model, int user_no, int tutorcate_no) {
        Map<String, Object> map = new HashMap<>();
        map.put("user_no", user_no);
        map.put("tutorcate_no", tutorcate_no);
        List<TestDto> list = gradingService.getTestUser(map);
        model.addAttribute("list", list);
        model.addAttribute("user_no", user_no);

        return "grading/score";
    }

    @GetMapping("/grading/check")
    public String check(Model model, int user_no, int test_no, String grading_content, String grading_grade, HttpSession session) {
        GradingDto dto = new GradingDto();
        dto.setTest_no(test_no);
        dto.setGrading_grade(grading_grade);
        dto.setGrading_content(grading_content);

        String user_id = (String) session.getAttribute("loginid");

        gradingService.insertGrading(dto);
        return "redirect:/grading/grade?user_no=" + user_no + "&user_id=" + user_id;
    }
}
