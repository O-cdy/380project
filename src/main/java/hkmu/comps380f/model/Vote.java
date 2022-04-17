package hkmu.comps380f.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="vote")
public class Vote implements Serializable {

    @Id
    private String question;

    @OneToMany(mappedBy = "vote", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    private List<VoteMc> mc = new ArrayList<>();

    

    public Vote(String question,List<String> mcs) {
        this.question = question;
        for (String mc : mcs) {
            this.mc.add(new VoteMc(this, mc));
        }
    }

    public Vote() {
    }


    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<VoteMc> getMc() {
        return mc;
    }

    public void setMc(List<VoteMc> mc) {
        this.mc = mc;
    }
}
