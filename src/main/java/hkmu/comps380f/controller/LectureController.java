package hkmu.comps380f.controller;

import hkmu.comps380f.Exception.AttachmentNotFound;
import hkmu.comps380f.Exception.LectureNotFound;
import hkmu.comps380f.dao.AllCommentRepository;
import hkmu.comps380f.dao.CommentRepository;
import hkmu.comps380f.model.AllComment;
import hkmu.comps380f.model.Attachment;
import hkmu.comps380f.model.Comment;
import hkmu.comps380f.model.Lecture;
import hkmu.comps380f.service.AllCommentService;
import hkmu.comps380f.service.AttachmentService;
import hkmu.comps380f.service.CommentService;
import hkmu.comps380f.service.LectureService;
import hkmu.comps380f.service.VoteService;
import hkmu.comps380f.view.DownloadingView;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/lecture")
public class LectureController {

    @Autowired
    private LectureService lectureService;
    @Autowired
    private AttachmentService attachmentService;

    @Autowired
    private VoteService voteService;
    @Autowired
    private CommentService commentService;

    @Resource
    private CommentRepository commentUserRepo;
    @Autowired
    private AllCommentService allcommentService;
    @Resource
    private AllCommentRepository allcommentUserRepo;

    private volatile long LECTURE_ID_SEQUENCE = 1;
    private Map<Long, Lecture> lectureDatabase = new ConcurrentHashMap<>();

    // Controller methods, Form object, ...
    @GetMapping(value = {"", "/list"})
    public String list(ModelMap model, Principal principal) {
//        model.addAttribute("lectureDatabase", lectureDatabase);
        model.addAttribute("lectureDatabase", lectureService.getLectures());
        model.addAttribute("principal", principal);
        model.addAttribute("votes", voteService.listallvote());
        return "list";
    }

    @GetMapping("/create")
    public ModelAndView create(Principal principal) {
        ModelAndView mav = new ModelAndView("add", "lectureForm", new Form());
        mav.addObject("principal", principal);
        return mav;
    }

    public static class Form {

        private String lectureTitle;
        private List<MultipartFile> lectureAttachments;
        private List<MultipartFile> tutorialAttachments;
        private String comment;

        public String getLectureTitle() {
            return lectureTitle;
        }

        public void setLectureTitle(String lectureTitle) {
            this.lectureTitle = lectureTitle;
        }

        public List<MultipartFile> getLectureAttachments() {
            return lectureAttachments;
        }

        public void setLectureAttachments(List<MultipartFile> lectureAttachments) {
            this.lectureAttachments = lectureAttachments;
        }

        public List<MultipartFile> getTutorialAttachments() {
            return tutorialAttachments;
        }

        public void setTutorialAttachments(List<MultipartFile> tutorialAttachments) {
            this.tutorialAttachments = tutorialAttachments;
        }

        public String getComment() {
            return comment;
        }

        public void setComment(String comment) {
            this.comment = comment;
        }

    }

    @PostMapping("/create")
    public String create(Form form, Principal principal) throws IOException {
        long lectureId = lectureService.createLecture(form.getLectureTitle(),
                principal.getName(), form.getLectureAttachments(), form.getTutorialAttachments());
        return "redirect:/lecture/view/" + lectureId;
    }

    private synchronized long getNextLectureId() {
        return this.LECTURE_ID_SEQUENCE++;
    }

    @GetMapping("/view/{lectureId}")
    public String view(@PathVariable("lectureId") long lectureId,
            ModelMap model) {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null) {
            return "redirect:/lecture/list";
        }
//        model.addAttribute("lectureId", lectureId);
        model.addAttribute("lecture", lecture);
        model.addAttribute("comments", commentService.getComments());
        return "view";
    }

    @GetMapping("/{lectureId}/attachment/{attachment:.+}")
    public View download(@PathVariable("lectureId") long lectureId,
            @PathVariable("attachment") String name) {
        Attachment attachment = attachmentService.getAttachment(lectureId, name);
        if (attachment != null) {
            return new DownloadingView(attachment.getName(),
                    attachment.getMimeContentType(), attachment.getContents());
        }

        return new RedirectView("/lecture/list", true);
    }

    @GetMapping("/delete/{lectureId}")
    public String deleteLecture(@PathVariable("lectureId") long lectureId)
            throws LectureNotFound {
        lectureService.delete(lectureId);
        return "redirect:/lecture/list";
    }

    @GetMapping("/{lectureId}/delete/{attachment:.+}")
    public String deleteAttachment(@PathVariable("lectureId") long lectureId,
            @PathVariable("attachment") String name) throws AttachmentNotFound {
        lectureService.deleteAttachment(lectureId, name);
        return "redirect:/lecture/edit/" + lectureId;
    }

    @GetMapping("/edit/{lectureId}")
    public ModelAndView showEdit(@PathVariable("lectureId") long lectureId,
            Principal principal, HttpServletRequest request) {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null
                || (!request.isUserInRole("ROLE_ADMIN")
                && !principal.getName().equals(lecture.getLecturer()))) {
            return new ModelAndView(new RedirectView("/lecture/list", true));
        }
        ModelAndView mav = new ModelAndView("edit");
//        mav.addObject("lectureId", Long.toString(lectureId));
        mav.addObject("lecture", lecture);

        Form lectureForm = new Form();
        lectureForm.setLectureTitle(lecture.getLectureTitle());
        mav.addObject("lectureForm", lectureForm);

        return mav;
    }

    @PostMapping("/edit/{lectureId}")
    public String edit(@PathVariable("lectureId") long lectureId, Form form,
            Principal principal, HttpServletRequest request)
            throws IOException, LectureNotFound {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null
                || (!request.isUserInRole("ROLE_ADMIN")
                && !principal.getName().equals(lecture.getLecturer()))) {
            return "redirect:/lecture/list";
        }

        lectureService.updateLecture(lectureId, form.getLectureTitle(),
                principal.getName(), form.getLectureAttachments(), form.getTutorialAttachments());

        return "redirect:/lecture/view/" + lectureId;
    }

    @GetMapping("/deletecomment/{username}")
    public View deleteComment(@PathVariable("username") String username) {
        commentUserRepo.delete(commentUserRepo.findById(username).orElse(null));
        return new RedirectView("/lecture/list", true);
    }

    @GetMapping("/create/comment")
    public ModelAndView createComment(Principal principal) {
        ModelAndView mav = new ModelAndView("addComment", "lectureForm", new Form());
        mav.addObject("principal", principal);
        return mav;
    }

    @PostMapping("/create/comment")
    public View createComment(Form form, Principal principal) throws IOException {
        Comment comment = new Comment(principal.getName(), form.getComment());
        AllComment allcomment = new AllComment(principal.getName(), form.getComment());
        commentUserRepo.save(comment);
        allcommentUserRepo.save(allcomment);
        return new RedirectView("/lecture/list", true);
    }

    @GetMapping(value = {"/historyComment"})
    public String historyComment(ModelMap model) {
//        model.addAttribute("lectureDatabase", lectureDatabase);
        model.addAttribute("allcomments", allcommentService.getAllComments());
        return "historyComment";
    }

}
