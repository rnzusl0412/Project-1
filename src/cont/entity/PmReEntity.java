package cont.entity;

public class PmReEntity {
	
	private int pmre_no;
	private int pmre_pmno;
	private String pmre_id;
	private String pmre_exp;
	private String pmre_day;
	
	public PmReEntity() {
		super();
	}
	
	public PmReEntity(int pmre_no, int pmre_pmno, String pmre_id, String pmre_exp, String pmre_day) {
		super();
		this.pmre_no = pmre_no;
		this.pmre_pmno = pmre_pmno;
		this.pmre_id = pmre_id;
		this.pmre_exp = pmre_exp;
		this.pmre_day = pmre_day;
	}

	public int getPmre_no() {
		return pmre_no;
	}

	public void setPmre_no(int pmre_no) {
		this.pmre_no = pmre_no;
	}

	public int getPmre_pmno() {
		return pmre_pmno;
	}

	public void setPmre_pmno(int pmre_pmno) {
		this.pmre_pmno = pmre_pmno;
	}

	public String getPmre_id() {
		return pmre_id;
	}

	public void setPmre_id(String pmre_id) {
		this.pmre_id = pmre_id;
	}

	public String getPmre_exp() {
		return pmre_exp;
	}

	public void setPmre_exp(String pmre_exp) {
		this.pmre_exp = pmre_exp;
	}

	public String getPmre_day() {
		return pmre_day;
	}

	public void setPmre_day(String pmre_day) {
		this.pmre_day = pmre_day;
	}
	
	
	
	
}
