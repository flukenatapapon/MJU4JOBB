package bean;
import java.util.*;
import javax.persistence.*;
@Entity
@Table(name="Activity")
public class Activity {
	@Id
	private String activityID;
	@Column(name="type")
	private String type;
	@Column(name="activityName")
	private String activityName;
	@Column(name="matchDate")
	private Calendar matchDate;
	@Column(name="place")
	private String place;
	@Column(name="maxPerson")
	private int maxPerson;
	@Column(name="male")
	private int male;
	@Column(name="female")
	private int female;

	@OneToMany(cascade = {CascadeType.ALL}, mappedBy = "pk.ac")
	private List<RegisterActivity> registerAcs = new ArrayList<>();
	
	
	public Activity() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public Activity(String activityID, String type, String activityName, Calendar matchDate, String place,
			int maxPerson, int male, int female) {
		super();
		this.activityID = activityID;
		this.type = type;
		this.activityName = activityName;
		this.matchDate = matchDate;
		this.place = place;
		this.maxPerson = maxPerson;
		this.male = male;
		this.female = female;
	}



	public String getActivityID() {
		return activityID;
	}

	public void setActivityID(String activityID) {
		this.activityID = activityID;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public Calendar getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(Calendar matchDate) {
		this.matchDate = matchDate;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public int getMaxPerson() {
		return maxPerson;
	}

	public void setMaxPerson(int maxPerson) {
		this.maxPerson = maxPerson;
	}

	public List<RegisterActivity> getRegisterAcs() {
		return registerAcs;
	}

	public void setRegisterAcs(List<RegisterActivity> registerAcs) {
		this.registerAcs = registerAcs;
	}



	public int getMale() {
		return male;
	}



	public void setMale(int male) {
		this.male = male;
	}



	public int getFemale() {
		return female;
	}



	public void setFemale(int female) {
		this.female = female;
	}
	
	
	
	
}
