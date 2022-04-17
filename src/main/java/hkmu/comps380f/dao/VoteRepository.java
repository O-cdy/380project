package hkmu.comps380f.dao;

import hkmu.comps380f.model.Vote;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VoteRepository extends JpaRepository<Vote, String> {
    Vote findByQuestion(String question);
}
