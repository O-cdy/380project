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

    @Column(insertable = false, updatable = false)
    private String question;

    @Column(name="mc")
    private String mc;

    @ManyToOne
    @JoinColumn(name = "username")
    private LectureUser user;

    //test
    @ManyToOne
    @JoinColumn(name = "question")
    private Vote vote;



    public UserMc() {
    }



    public UserMc(LectureUser user,Vote vote ,String mc) {
        this.user = user;
        this.vote=vote;
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

    public Vote getVote() {
        return vote;
    }

    public void setVote(Vote vote) {
        this.vote = vote;
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
