package re.entity;

public class ReEntity {

	private int re_no;
	private int re_bno;
	private String re_exp;
	private String re_id;
	private String re_day;

	public ReEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReEntity(int re_no, int re_bno, String re_exp, String re_id, String re_day) {
		super();
		this.re_no = re_no;
		this.re_bno = re_bno;
		this.re_exp = re_exp;
		this.re_id = re_id;
		this.re_day = re_day;
	}

	public int getRe_no() {
		return re_no;
	}

	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}

	public int getRe_bno() {
		return re_bno;
	}

	public void setRe_bno(int re_bno) {
		this.re_bno = re_bno;
	}

	public String getRe_exp() {
		return re_exp;
	}

	public void setRe_exp(String re_exp) {
		this.re_exp = re_exp;
	}

	public String getRe_id() {
		return re_id;
	}

	public void setRe_id(String re_id) {
		this.re_id = re_id;
	}

	public String getRe_day() {
		return re_day;
	}

	public void setRe_day(String re_day) {
		this.re_day = re_day;
	}

	@Override
	public String toString() {
		return "ReEntity [re_no=" + re_no + ", re_bno=" + re_bno + ", re_exp=" + re_exp + ", re_id=" + re_id
				+ ", re_day=" + re_day + "]";
	}

}
