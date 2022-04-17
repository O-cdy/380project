package hkmu.comps380f.controller;

import hkmu.comps380f.dao.AllCommentRepository;
import hkmu.comps380f.dao.CommentRepository;
import hkmu.comps380f.dao.LectureUserRepository;
import hkmu.comps380f.dao.UserMcRepository;
import hkmu.comps380f.dao.VoteCommentRepository;
import hkmu.comps380f.dao.VoteMcRepository;
import hkmu.comps380f.dao.VoteRepository;
import hkmu.comps380f.model.AllComment;
import hkmu.comps380f.model.LectureUser;
import hkmu.comps380f.model.UserMc;
import hkmu.comps380f.model.Vote;
import hkmu.comps380f.model.VoteComment;
import hkmu.comps380f.model.VoteMc;
import hkmu.comps380f.service.AllCommentService;
import hkmu.comps380f.service.CommentService;
import hkmu.comps380f.service.VoteCommentService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import javax.annotation.Resource;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;

@Controller
@RequestMapping("/vote")
public class VoteController {

    @Autowired
    private VoteCommentService votecommentService;

    @Resource
    private VoteCommentRepository votecommentUserRepo;
    @Autowired
    private AllCommentService allcommentService;
    @Resource
    private AllCommentRepository allcommentUserRepo;

    public static class Form {

        private String question;
        private String mc_a;
        private String mc_b;
        private String mc_c;
        private String mc_d;
        private String comment;

        public Form() {
        }

        public Form(String question, String mc_a, String mc_b, String mc_c, String mc_d) {
            this.question = question;
            this.mc_a = mc_a;
            this.mc_b = mc_b;
            this.mc_c = mc_c;
            this.mc_d = mc_d;
        }

        public String getQuestion() {
            return question;
        }

        public void setQuestion(String question) {
            this.question = question;
        }

        public String getMc_a() {
            return mc_a;
        }

        public void setMc_a(String mc_a) {
            this.mc_a = mc_a;
        }

        public String getMc_b() {
            return mc_b;
        }

        public void setMc_b(String mc_b) {
            this.mc_b = mc_b;
        }

        public String getMc_c() {
            return mc_c;
        }

        public void setMc_c(String mc_c) {
            this.mc_c = mc_c;
        }

        public String getMc_d() {
            return mc_d;
        }

        public void setMc_d(String mc_d) {
            this.mc_d = mc_d;
        }

        public String getComment() {
            return comment;
        }

        public void setComment(String comment) {
            this.comment = comment;
        }
    }

    public static class UserMcForm {

        private String username;
        private String question;
        private String mc;

        public UserMcForm() {
        }

        public UserMcForm(String username, String question, String mc) {
            this.username = username;
            this.question = question;
            this.mc = mc;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getQuestion() {
            return question;
        }

        public void setQuestion(String question) {
            this.question = question;
        }

        public String getMc() {
            return mc;
        }

        public void setMc(String mc) {
            this.mc = mc;
        }
    }

    @Resource
    private VoteRepository votedao;
    @Resource
    private VoteMcRepository votemcdao;

    @Resource
    private UserMcRepository usermcdao;
    @Resource
    private LectureUserRepository userdao;
    @Autowired
    private CommentService commentService;

    @Resource
    CommentRepository commentUserRepo;

    @GetMapping("/edit/{question}")
    public ModelAndView edit(@PathVariable("question") String question, Principal principal) {
        String question1 = new String(question + "?");
        System.out.println("question is :"+question);
        UserMc userMc = usermcdao.findByUsernameAndQuestion(principal.getName(), question1);
        System.out.println("usermc is :" + userMc);
        UserMcForm userMcFormnew = new UserMcForm();
        if (userMc == null) {
            //user 没有选择过
            ModelAndView modelandview = new ModelAndView("editvote", "usermcform", userMcFormnew);
            modelandview.addObject("listvote", votedao.findById(question1).orElse(null));
            modelandview.addObject("votecomments", votecommentUserRepo.findAll());
            return modelandview;
        } else {
            //user 选择过
            userMcFormnew.setUsername(userMc.getUsername());
            userMcFormnew.setQuestion(userMc.getVote().getQuestion());
            userMcFormnew.setMc(userMc.getMc());
            ModelAndView modelandview = new ModelAndView("editvote", "usermcform", userMcFormnew);
            modelandview.addObject("listvote", votedao.findById(question1).orElse(null));
            modelandview.addObject("votecomments", votecommentUserRepo.findAll());
            return modelandview;
        }
        //UserMcForm userMcFormnew=new  UserMcForm(userMc.getUsername(),userMc.getQuestion(),userMc.getMc());
        //ModelAndView modelandview=new ModelAndView("editvote","usermcform",userMcFormnew);
        //modelandview.addObject("listvote",votedao.findById(question));
        //modelandview.addObject("usermc",usermcdao.findById(username));

        //return modelandview;
    }

    @PostMapping("/edit/{question}")
    public View edit(@PathVariable("question") String question, UserMcForm usermcform, Principal principal) {
        String question1 = new String(question + "?");
        System.out.println("the mc from form is :" + usermcform.getMc());
        LectureUser user = userdao.findById(principal.getName()).orElse(null);
        UserMc userMc = usermcdao.findByUsernameAndQuestion(principal.getName(), question1);
        //VoteMc votemc_before_edit = votemcdao.findVoteMcByQuestionAndMc(question, userMc.getMc());
        //VoteMc votemc_after_edit = votemcdao.findVoteMcByQuestionAndMc(question, usermcform.getMc());
        if (userMc==null) {
            //用户没有选择过,usermc为空
            System.out.println("user is:" + user);
            System.out.println("question is:" + question1);
            System.out.println("mc is :" + usermcform.getMc());
            Vote vote=votedao.findById(question1).orElse(null);
            UserMc usermc = new UserMc(user, vote, usermcform.getMc());
            usermcdao.save(usermc);
            System.out.println("question is :" + question1);
            System.out.println("getmc is :" + usermcform.getMc());
            VoteMc votemc_after_edit = votemcdao.findByQuestionAndMc(question1, usermcform.getMc());

            votemc_after_edit.setCount(votemc_after_edit.getCount() + 1);
            votemcdao.save(votemc_after_edit);
        } else {
            //用户选择过
            if (userMc.getMc() == usermcform.getMc()) {
                //如果一样 直接return
                return new RedirectView("/lecture/list/", true);
            } else {
                //如果不一样
                VoteMc votemc_before_edit = votemcdao.findByQuestionAndMc(question1, userMc.getMc());
                VoteMc votemc_after_edit = votemcdao.findByQuestionAndMc(question1, usermcform.getMc());
                votemc_before_edit.setCount(votemc_before_edit.getCount() - 1);
                userMc.setMc(usermcform.getMc());
                votemc_after_edit.setCount(votemc_after_edit.getCount() + 1);
                votemcdao.save(votemc_before_edit);
                votemcdao.save(votemc_after_edit);
                usermcdao.save(userMc);
            }
        }
        return new RedirectView("/lecture/list/", true);

    }

    @GetMapping("/add")
    public ModelAndView add() {
        return new ModelAndView("addVote", "Vote", new Form());

    }

    @PostMapping("/add")
    public View create(Form form) throws IOException {
        List<String> list = new ArrayList<String>();
        if (form.getMc_a() != "") {
            list.add(form.getMc_a());
        }
        if (form.getMc_b() != "") {
            list.add(form.getMc_b());
        }
        if (form.getMc_c() != "") {
            list.add(form.getMc_c());
        }
        if (form.getMc_d() != "") {
            list.add(form.getMc_d());
        }
        Vote vote = new Vote(form.getQuestion(), list);
        votedao.save(vote);
        return new RedirectView("/lecture/list", true);

    }

    @GetMapping("/delete/{question}")
    public View deleteUser(@PathVariable("question") String question,Principal principal) {
        String question1=new String(question+"?");
        System.out.println(question1);
        //votemcdao.deleteByQuestion(question1);
        //usermcdao.deleteByQuestion(question1);
        //votedao.delete(votedao.findById(question1).orElse(null));
        //votedao.deleteById(question1);
        votedao.delete(votedao.findById(question1).orElse(null));
        //usermcdao.delete(usermcdao.findByUsernameAndQuestion(principal.getName(), question1));


        return new RedirectView("/lecture/list", true);
    }

    @GetMapping("/deletecomment/{id}")
    public View deleteComment(@PathVariable("id") int id) {
        votecommentUserRepo.delete(votecommentUserRepo.findById(id).orElse(null));
        return new RedirectView("/lecture/list", true);
    }

    @GetMapping("/create/comment")
    public ModelAndView createVoteComment(Principal principal) {
        ModelAndView mav = new ModelAndView("addVoteComment", "Form", new VoteController.Form());
        mav.addObject("principal", principal);
        return mav;
    }

    @PostMapping("/create/comment")
    public View createVoteComment(VoteController.Form form, Principal principal) throws IOException {
        votecommentService.storeVoteComment(principal.getName(), form.getComment());
        allcommentService.storeAllComment(principal.getName(), form.getComment());
        return new RedirectView("/lecture/list", true);
    }

    @GetMapping(value = {"/historyComment"})
    public String historyComment(ModelMap model) {
//        model.addAttribute("lectureDatabase", lectureDatabase);
        model.addAttribute("allcomments", allcommentService.getAllComments());
        return "historyComment";
    }

}
