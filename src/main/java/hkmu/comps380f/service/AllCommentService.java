package hkmu.comps380f.service;

import hkmu.comps380f.dao.AllCommentRepository;
import hkmu.comps380f.model.AllComment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AllCommentService {

    @Resource
    private AllCommentRepository allcomment;

    @Transactional
    public List<AllComment> getAllComments() {
        return allcomment.findAll();

    }
 public void storeAllComment(String username, String comment) {
        AllComment newcomment = new AllComment();
        newcomment.setUsername(username);
        newcomment.setComment(comment);
        allcomment.save(newcomment);

    }
}
