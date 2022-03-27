package bean;
import javax.persistence.*;
@Entity
@Table(name="RegisterActivity")
public class RegisterActivity {
	
	@EmbeddedId
	private RegisterActivityID pk = new RegisterActivityID();
	
	@Column(name="medal")
	private String medal;
	
	public RegisterActivity() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RegisterActivity(RegisterActivityID pk, String medal) {
		super();
		this.pk = pk;
		this.medal = medal;
	}
	public RegisterActivityID getPk() {
		return pk;
	}
	public void setPk(RegisterActivityID pk) {
		this.pk = pk;
	}
	public String getMedal() {
		return medal;
	}
	public void setMedal(String medal) {
		this.medal = medal;
	}
	
	
	
}
