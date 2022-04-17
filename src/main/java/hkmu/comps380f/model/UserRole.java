package hkmu.comps380f.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Id;

@Entity
@Table(name = "user_roles")
public class UserRole implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_role_id")
    private int id;

    @Column(insertable = false, updatable = false)
    private String username;
    private String role;

    @ManyToOne()
    @JoinColumn(name = "username")
    private LectureUser user;

    public UserRole() {
    }

    public UserRole(LectureUser user, String role) {
        this.user = user;
        this.role = role;
    }

    // getters and setters of all properties
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public LectureUser getUser() {
        return user;
    }

    public void setUser(LectureUser user) {
        this.user = user;
    }

}
