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

    @Column(name = "username")
    private String username;

    @Column(insertable = false, updatable = false)
    private String question;

    @Column(name="mc")
    private String mc;



    //test
    @ManyToOne
    @JoinColumn(name = "question")
    private Vote vote;



    public UserMc() {
    }



    public UserMc(String username,Vote vote ,String mc) {
        this.username = username;
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



    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }
}
