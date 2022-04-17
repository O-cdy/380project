package hkmu.comps380f.dao;

import hkmu.comps380f.model.LectureUser;
import hkmu.comps380f.model.UserMc;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserMcRepository extends JpaRepository<UserMc, String> {
    int countByQuestionAndMc(String question, String mc);
    Boolean existsByQuestion(String question);
    UserMc findByQuestion(String question);
}
