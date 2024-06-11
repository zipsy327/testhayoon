package controllerW.holiday;

import data.dto.UserDto;
import data.serviceW.TutorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class TutorController {

    @Autowired
    private TutorService tutorService;

    @GetMapping("/tutor/info")
    public String info(Model model) {
        List<UserDto> list = tutorService.getAllTutor();
        model.addAttribute("list", list);
        return "tutorW/info";
    }
}
