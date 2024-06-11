package controllerH.test;

import data.serviceH.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

@Controller
public class registerController {
    @Autowired
    private TestService testService;
    @PostMapping("/user/registerTest")
    public String registerTest(
            @RequestParam("formId") int formId,
            @RequestParam("userno") int userno,
            @RequestParam("answer1") String answer1,
            @RequestParam("answer2") String answer2
            ) {


        testService.insertTest(formId,userno,answer1);
        testService.insertTest(formId,userno,answer2);


        return "user/registerTest"; // user/registerTest.jsp로 이동
    }
}
