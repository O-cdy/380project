package hkmu.comps380f.model;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Id;

@Entity
@Table(name = "users")
public class LectureUser implements Serializable {

    @Id
    private String username;
    private String password;
    private String fullname;
    private String phone;
    private String address;
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)

    private List<UserRole> roles = new ArrayList<>();



    public LectureUser() {
    }

    public LectureUser(String username, String password, String fullname,
            String phone, String address, String[] roles) {
        this.username = username;
        this.password = "{noop}" + password;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        for (String role : roles) {
            this.roles.add(new UserRole(this, role));
        }
    }
    // getters and setters of all properties

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<UserRole> getRoles() {
        return roles;
    }

    public void setRoles(List<UserRole> roles) {
        this.roles = roles;
    }


}
