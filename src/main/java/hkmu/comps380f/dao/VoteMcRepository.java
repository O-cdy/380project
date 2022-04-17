package hkmu.comps380f.dao;

import hkmu.comps380f.model.VoteMc;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VoteMcRepository extends JpaRepository<VoteMc, Integer> {
    VoteMc findByQuestionAndMc(String question,String mc);
    void deleteByQuestion(String question);
}
