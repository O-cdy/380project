package hkmu.comps380f.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping
    public String index() {
        return "redirect:/lecture/list";
//        return "redirect:/user/register";
    }

    @GetMapping("/olelogin")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String register() {
        return "redirect:/user/register";
    }

}
