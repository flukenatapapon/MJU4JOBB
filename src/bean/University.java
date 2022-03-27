package bean;
import java.util.*;
import javax.persistence.*;
@Entity
@Table(name="University")
public class University {
	@Id
	private String username;
	@Column(name="password")
	private String password;
	@Column(name="universityName")
	private String universityName;
	@Column(name="loginDate")
	private Calendar loginDate;
	@Column(name="maxPerson")
	private int maxPerson;
	
	@OneToMany(mappedBy = "university", cascade = CascadeType.ALL)
	private List<Faculty> faculty = new ArrayList<>();

	public University() {
		super();
		// TODO Auto-generated constructor stub
	}

	public University(String username, String password, String universityName, Calendar loginDate, int maxPerson) {
		super();
		this.username = username;
		this.password = password;
		this.universityName = universityName;
		this.loginDate = loginDate;
		this.maxPerson = maxPerson;
	}

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

	public String getUniversityName() {
		return universityName;
	}

	public void setUniversityName(String universityName) {
		this.universityName = universityName;
	}

	public Calendar getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Calendar loginDate) {
		this.loginDate = loginDate;
	}

	public int getMaxPerson() {
		return maxPerson;
	}

	public void setMaxPerson(int maxPerson) {
		this.maxPerson = maxPerson;
	}

	public List<Faculty> getFaculty() {
		return faculty;
	}

	public void setFaculty(List<Faculty> faculty) {
		this.faculty = faculty;
	}
	
	
	
	
}
