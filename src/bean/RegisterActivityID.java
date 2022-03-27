package bean;
import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.Cascade;
@Embeddable
public class RegisterActivityID implements Serializable {
	
	@ManyToOne
	private Register re;
	
	@ManyToOne
	private Activity ac;
	
	public RegisterActivityID() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RegisterActivityID(Register re, Activity ac) {
		super();
		this.re = re;
		this.ac = ac;
	}

	public Register getRe() {
		return re;
	}

	public void setRe(Register re) {
		this.re = re;
	}

	public Activity getAc() {
		return ac;
	}

	public void setAc(Activity ac) {
		this.ac = ac;
	}
}
