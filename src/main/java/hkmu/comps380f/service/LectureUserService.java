package hkmu.comps380f.service;

import hkmu.comps380f.Exception.LectureNotFound;
import hkmu.comps380f.Exception.LectureUserNotFound;
import hkmu.comps380f.dao.LectureUserRepository;
import hkmu.comps380f.model.LectureUser;
import hkmu.comps380f.model.UserRole;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LectureUserService implements UserDetailsService {

    @Resource
    LectureUserRepository lectureUserRepo;

    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        LectureUser lectureUser = lectureUserRepo.findById(username).orElse(null);
        if (lectureUser == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (UserRole role : lectureUser.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(role.getRole()));
        }
        return new User(lectureUser.getUsername(), lectureUser.getPassword(), authorities);
    }

}
