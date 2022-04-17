package hkmu.comps380f.model;

import javax.persistence.*;
import java.io.Serializable;
@Entity
@Table(name="user_mc")
public class UserMc implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_mc_id")
    private int id;

    @Column(insertable = false, updatable = false)
    private String username;


    private String question;

    @Column(name="mc")
    private String mc;

    @ManyToOne
    @JoinColumn(name = "username")
    private LectureUser user;



    public UserMc() {
    }



    public UserMc(LectureUser user,String question ,String mc) {
        this.user = user;
        this.question=question;
        this.mc=mc;
    }

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

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getMc() {
        return mc;
    }

    public void setMc(String mc) {
        this.mc = mc;
    }

    public LectureUser getUser() {
        return user;
    }

    public void setUser(LectureUser user) {
        this.user = user;
    }
}
