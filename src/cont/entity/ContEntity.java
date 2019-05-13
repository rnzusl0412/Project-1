package cont.entity;

public class ContEntity {
	
	/*CO_NO NUMBER(20) PRIMARY KEY, 
	CO_NAME VARCHAR2(30) NOT NULL, 
	CO_EXP VARCHAR2(4000) NOT NULL,
	CO_URL VARCHAR2(100), 
	CO_ST DATE, 
	CO_END DATE, 
	CO_LO NUMBER(20), 
	 */
	
	private int co_no; 
	private String co_name;
	private String co_exp;
	private String co_url;
	private String co_st;
	private String co_end;
	private int co_lo;
	
	public ContEntity() {
		super();
	}

	public ContEntity(int co_no, String co_name, String co_exp, String co_url, String co_st, String co_end, int co_lo) {
		super();
		this.co_no = co_no;
		this.co_name = co_name;
		this.co_exp = co_exp;
		this.co_url = co_url;
		this.co_st = co_st;
		this.co_end = co_end;
		this.co_lo = co_lo;
	}

	public int getCo_no() {
		return co_no;
	}

	public void setCo_no(int co_no) {
		this.co_no = co_no;
	}

	public String getCo_name() {
		return co_name;
	}

	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}

	public String getCo_exp() {
		return co_exp;
	}

	public void setCo_exp(String co_exp) {
		this.co_exp = co_exp;
	}

	public String getCo_url() {
		return co_url;
	}

	public void setCo_url(String co_url) {
		this.co_url = co_url;
	}

	public String getCo_st() {
		return co_st;
	}

	public void setCo_st(String co_st) {
		this.co_st = co_st;
	}

	public String getCo_end() {
		return co_end;
	}

	public void setCo_end(String co_end) {
		this.co_end = co_end;
	}

	public int getCo_lo() {
		return co_lo;
	}

	public void setCo_lo(int co_lo) {
		this.co_lo = co_lo;
	}
	
	

}
