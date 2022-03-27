package bean;
import javax.persistence.*;
import java.util.*;
@Entity
@Table(name="faculty")
public class Faculty {
	@Id
	private String idFaculty;
	@Column(name="facultyName")
	private String FacultyName;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="username")
	private University university;
	
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "faculty")
	private Set<Register> register = new HashSet<Register>();
	
	public Faculty() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Faculty(String idFaculty, String facultyName, University university) {
		super();
		this.idFaculty = idFaculty;
		FacultyName = facultyName;
		this.university = university;
	}

	public String getIdFaculty() {
		return idFaculty;
	}

	public void setIdFaculty(String idFaculty) {
		this.idFaculty = idFaculty;
	}

	public String getFacultyName() {
		return FacultyName;
	}

	public void setFacultyName(String facultyName) {
		FacultyName = facultyName;
	}

	public University getUniversity() {
		return university;
	}

	public void setUniversity(University university) {
		this.university = university;
	}

	public Set<Register> getRegister() {
		return register;
	}

	public void setRegister(Set<Register> register) {
		this.register = register;
	}
	
	

}
