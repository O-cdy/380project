package hkmu.comps380f.service;

import hkmu.comps380f.dao.VoteCommentRepository;
import hkmu.comps380f.model.VoteComment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class VoteCommentService {

    @Resource
    private VoteCommentRepository votecomment;

    @Transactional
    public List<VoteComment> getComments() {
        return votecomment.findAll();
    }

    public void storeVoteComment(String username, String comment) {
        VoteComment newcomment = new VoteComment();
        newcomment.setUsername(username);
        newcomment.setComment(comment);
        votecomment.save(newcomment);

    }
}
