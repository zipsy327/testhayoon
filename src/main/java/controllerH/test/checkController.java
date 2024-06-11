package controllerH.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class checkController {
    @GetMapping("/test/check")
    public String checkTestPage() {

        return "user/testCheck";
    }


}
