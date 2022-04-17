package hkmu.comps380f.dao;

import hkmu.comps380f.model.LectureUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LectureUserRepository extends JpaRepository<LectureUser, String> {
    
}
