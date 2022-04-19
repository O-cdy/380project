package hkmu.comps380f.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.persistence.Id;

@Entity
@Table(name = "allcomment")
public class AllComment implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String username;
    private String comment;

    public AllComment() {
    }

    public AllComment(String username, String comment) {
        this.username = username;
        this.comment = comment;
    }
    // getters and setters of all properties

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;

    }
}
