package controllerH.test;

import com.fasterxml.jackson.databind.DatabindContext;
import data.dto.UserDto;
import data.serviceH.TestService;
import data.serviceH.UserService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.Collections;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    private TestService testService;

    @GetMapping("/test/main")
    public String showTestPage(@RequestParam String user_id, Model model) {
        UserDto dto = testService.getSessionid(user_id);
        model.addAttribute("dto", dto);
        return "user/testPage";
    }
}