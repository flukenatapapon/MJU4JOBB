package bean;
import javax.persistence.*;
import java.util.*;

@Entity
@Table(name="Register")
public class Register {
	@Id
	@Column(name="idRegister")
	private String idRegister;
	@Column(name="type")
	private int type;
	@Column(name="gender")
	private String gender;
	@Column(name="position")
	private String position;
	@Column(name="prefix")
	private String prefix;
	@Column(name="fullName")
	private String fullName;
	@Column(name="nickName")
	private String NickName;
	@Column(name="phone")
	private String phone;
	@Column(name="facebook")
	private String facebook;
	@Column(name="travel")
	private String travel;
	@Column(name="traveling")
	private String traveling;
	@Column(name="travelDetail")
	private String travelDetail;
	@Column(name="returns")
	private String returns;
	@Column(name="returning")
	private String returning;
	@Column(name="returndetail")
	private String returndetail;
	@Column(name="foodtype")
	private String foodtype;
	@Column(name="foodallergy")
	private String foodallergy;
	@Column(name="image")
	private String image;
	@Column(name="chinesetable")
	private String chinesetable;
	@Column(name="khantokTable")
	private String khantokTable;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="idFaculty")
	private Faculty faculty;
	
	@OneToMany(cascade = {CascadeType.ALL},mappedBy = "pk.re")
	private List<RegisterActivity> registerAc = new ArrayList<>();
	

	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Register(String idRegister) {
		super();
		this.idRegister = idRegister;
		// TODO Auto-generated constructor stub
	}
	public Register(String idRegister, int type, String gender, String position, String prefix, String fullName,
			String nickName, String phone, String facebook, String travel, String traveling, String travelDetail,
			String returns, String returning, String returndetail, String foodtype, String foodallergy, String image,
			String chinesetable, String khantokTable, Faculty faculty) {
		super();
		this.idRegister = idRegister;
		this.type = type;
		this.gender = gender;
		this.position = position;
		this.prefix = prefix;
		this.fullName = fullName;
		NickName = nickName;
		this.phone = phone;
		this.facebook = facebook;
		this.travel = travel;
		this.traveling = traveling;
		this.travelDetail = travelDetail;
		this.returns = returns;
		this.returning = returning;
		this.returndetail = returndetail;
		this.foodtype = foodtype;
		this.foodallergy = foodallergy;
		this.image = image;
		this.chinesetable = chinesetable;
		this.khantokTable = khantokTable;
		this.faculty = faculty;
	}

	public String getIdRegister() {
		return idRegister;
	}

	public void setIdRegister(String idRegister) {
		this.idRegister = idRegister;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getNickName() {
		return NickName;
	}

	public void setNickName(String nickName) {
		NickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getTravel() {
		return travel;
	}

	public void setTravel(String travel) {
		this.travel = travel;
	}

	public String getTraveling() {
		return traveling;
	}

	public void setTraveling(String traveling) {
		this.traveling = traveling;
	}

	public String getTravelDetail() {
		return travelDetail;
	}

	public void setTravelDetail(String travelDetail) {
		this.travelDetail = travelDetail;
	}

	public String getReturns() {
		return returns;
	}

	public void setReturns(String returns) {
		this.returns = returns;
	}

	public String getReturning() {
		return returning;
	}

	public void setReturning(String returning) {
		this.returning = returning;
	}

	public String getReturndetail() {
		return returndetail;
	}

	public void setReturndetail(String returndetail) {
		this.returndetail = returndetail;
	}

	public String getFoodtype() {
		return foodtype;
	}

	public void setFoodtype(String foodtype) {
		this.foodtype = foodtype;
	}

	public String getFoodallergy() {
		return foodallergy;
	}

	public void setFoodallergy(String foodallergy) {
		this.foodallergy = foodallergy;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getChinesetable() {
		return chinesetable;
	}

	public void setChinesetable(String chinesetable) {
		this.chinesetable = chinesetable;
	}

	public String getKhantokTable() {
		return khantokTable;
	}

	public void setKhantokTable(String khantokTable) {
		this.khantokTable = khantokTable;
	}

	public Faculty getFaculty() {
		return faculty;
	}

	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}

	public List<RegisterActivity> getRegisterAc() {
		return registerAc;
	}

	public void setRegisterAc(List<RegisterActivity> registerAc) {
		this.registerAc = registerAc;
	}
	
	
	

	
	
	
}
