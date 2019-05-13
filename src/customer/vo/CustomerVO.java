package customer.vo;

public class CustomerVO {
	private String c_id;
	private String c_nic_name;
	private String c_name;
	private String c_email;
	private String c_phone;
	private String c_pw;
	private String c_birth;
	private String c_sex;
	private String c_post;
	private String c_add;
	private String c_dadd;
	private String c_exadd;
	private int c_answer_type;
	private String c_answer;
	
	public CustomerVO() {
		super();
	}

	public CustomerVO(String c_id, String c_nic_name, String c_name, String c_email, String c_phone, String c_pw,
			String c_birth, String c_sex, String c_post, String c_add, String c_dadd, String c_exadd, int c_answer_type,
			String c_answer) {
		super();
		this.c_id = c_id;
		this.c_nic_name = c_nic_name;
		this.c_name = c_name;
		this.c_email = c_email;
		this.c_phone = c_phone;
		this.c_pw = c_pw;
		this.c_birth = c_birth;
		this.c_sex = c_sex;
		this.c_post = c_post;
		this.c_add = c_add;
		this.c_dadd = c_dadd;
		this.c_exadd = c_exadd;
		this.c_answer_type = c_answer_type;
		this.c_answer = c_answer;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getC_nic_name() {
		return c_nic_name;
	}

	public void setC_nic_name(String c_nic_name) {
		this.c_nic_name = c_nic_name;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_email() {
		return c_email;
	}

	public void setC_email(String c_email) {
		this.c_email = c_email;
	}

	public String getC_phone() {
		return c_phone;
	}

	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}

	public String getC_pw() {
		return c_pw;
	}

	public void setC_pw(String c_pw) {
		this.c_pw = c_pw;
	}

	public String getC_birth() {
		return c_birth;
	}

	public void setC_birth(String c_birth) {
		this.c_birth = c_birth;
	}

	public String getC_sex() {
		return c_sex;
	}

	public void setC_sex(String c_sex) {
		this.c_sex = c_sex;
	}

	public String getC_post() {
		return c_post;
	}

	public void setC_post(String c_post) {
		this.c_post = c_post;
	}

	public String getC_add() {
		return c_add;
	}

	public void setC_add(String c_add) {
		this.c_add = c_add;
	}

	public String getC_dadd() {
		return c_dadd;
	}

	public void setC_dadd(String c_dadd) {
		this.c_dadd = c_dadd;
	}

	public String getC_exadd() {
		return c_exadd;
	}

	public void setC_exadd(String c_exadd) {
		this.c_exadd = c_exadd;
	}

	public int getC_answer_type() {
		return c_answer_type;
	}

	public void setC_answer_type(int c_answer_type) {
		this.c_answer_type = c_answer_type;
	}

	public String getC_answer() {
		return c_answer;
	}

	public void setC_answer(String c_answer) {
		this.c_answer = c_answer;
	}

	@Override
	public String toString() {
		return "CustomerVO [c_id=" + c_id + ", c_nic_name=" + c_nic_name + ", c_name=" + c_name + ", c_email=" + c_email
				+ ", c_phone=" + c_phone + ", c_pw=" + c_pw + ", c_birth=" + c_birth + ", c_sex=" + c_sex + ", c_post="
				+ c_post + ", c_add=" + c_add + ", c_dadd=" + c_dadd + ", c_exadd=" + c_exadd + ", c_answer_type="
				+ c_answer_type + ", c_answer=" + c_answer + "]";
	}
	
}
