package controllerH.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import data.dto.UserDto;
import data.serviceH.UserService;

@Controller
@RequestMapping("/user")
public class InsertController {
    @Autowired
    private UserService userService;

    @PostMapping("/insert")
    public String insert(@ModelAttribute UserDto dto) {
        // 데이터베이스에 회원 정보 저장

        userService.insertMember(dto);
        // 상세 페이지로 리다이렉트하며 userId를 쿼리 파라미터로 전달
        return "redirect:/";
    }
}