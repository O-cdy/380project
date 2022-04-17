package hkmu.comps380f.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="vote_mc")
public class VoteMc implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "vote_mc_id")
    private int id;
    @Column(insertable = false, updatable = false)
    private String question;

    private String mc;

    private int count;

    @ManyToOne()
    @JoinColumn(name = "question")
    private Vote vote;

    public VoteMc() {
    }

    public VoteMc(Vote vote, String mc) {
        this.vote = vote;
        this.mc = mc;

    }

    public VoteMc(int id, String question, String mc, int count, Vote vote) {
        this.id = id;
        this.question = question;
        this.mc = mc;
        this.count = count;
        this.vote = vote;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Vote getVote() {
        return vote;
    }

    public void setVote(Vote vote) {
        this.vote = vote;
    }
}
