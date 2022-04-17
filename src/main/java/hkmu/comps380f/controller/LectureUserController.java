package hkmu.comps380f.controller;

import hkmu.comps380f.Exception.LectureUserNotFound;
import hkmu.comps380f.dao.LectureUserRepository;
import hkmu.comps380f.model.LectureUser;
import java.io.IOException;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/user")
public class LectureUserController {

    @Resource
    LectureUserRepository lectureUserRepo;

    @GetMapping({"", "/list"})
    public String list(ModelMap model) {
        model.addAttribute("lectureUsers", lectureUserRepo.findAll());
        return "listUser";
    }

    public static class Form {

        private String username;
        private String password;
        private String fullname;
        private String phone;
        private String address;
        private String[] roles;
        // ... getters and setters for each of the properties

        public Form() {
        }

        public Form(String username, String password, String fullname, String phone, String address) {
            this.username = username;
            this.password = password;
            this.fullname = fullname;
            this.phone = phone;
            this.address = address;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String getFullname() {
            return fullname;
        }

        public void setFullname(String fullname) {
            this.fullname = fullname;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        public String[] getRoles() {
            return roles;
        }

        public void setRoles(String[] roles) {
            this.roles = roles;
        }

    }

    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("addUser", "lectureUser", new Form());
    }

    @GetMapping("/register")
    public ModelAndView register() {
        return new ModelAndView("register", "lectureUser", new Form());
    }

    @PostMapping("/create")
    public View create(Form form) throws IOException {
        LectureUser user = new LectureUser(form.getUsername(), form.getPassword(),
                form.getFullname(), form.getPhone(), form.getAddress(), form.getRoles());
        lectureUserRepo.save(user);
        return new RedirectView("/user/list", true);
    }

    @PostMapping("/register")
    public View register(Form form) throws IOException {
        LectureUser user = new LectureUser(form.getUsername(), form.getPassword(),
                form.getFullname(), form.getPhone(), form.getAddress(), new String[]{"ROLE_USER"});
        lectureUserRepo.save(user);
        return new RedirectView("/olelogin?success", true);
    }

    @GetMapping("/delete/{username}")
    public View deleteUser(@PathVariable("username") String username) {
        lectureUserRepo.delete(lectureUserRepo.findById(username).orElse(null));
        return new RedirectView("/user/list", true);
    }

    @GetMapping("/edit/{username}")
    public String showEdit(@PathVariable("username") String username, ModelMap model) throws LectureUserNotFound {
        LectureUser user = lectureUserRepo.findById(username).orElse(null);
        if (user == null) {
            throw new LectureUserNotFound();
        }
        model.addAttribute("user", user);
        Form userForm = new Form(user.getUsername(), user.getPassword().substring(6),
                user.getFullname(), user.getPhone(), user.getAddress());
        model.addAttribute("userForm", userForm);
        return "editUser";
    }

    @PostMapping("/edit/{username}")
    public View editUser(Form form) throws IOException, LectureUserNotFound {
        LectureUser updatedLectureUser = lectureUserRepo.findById(form.username).orElse(null);
        if (updatedLectureUser == null) {
            throw new LectureUserNotFound();
        }
        if (form.password != "") {
            updatedLectureUser.setPassword("{noop}" + form.password);
        }
        if (form.fullname != "") {
            updatedLectureUser.setFullname(form.fullname);
        }
        if (form.phone != "") {
            updatedLectureUser.setPhone(form.phone);
        }
        if (form.address != "") {
            updatedLectureUser.setAddress(form.address);
        }

        lectureUserRepo.save(updatedLectureUser);
        return new RedirectView("/user/list", true);
    }
}
