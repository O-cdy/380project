package hkmu.comps380f.dao;

import hkmu.comps380f.model.VoteComment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VoteCommentRepository extends JpaRepository<VoteComment, Integer> {

}