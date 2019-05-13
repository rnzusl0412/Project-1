package cont.vo;

public class ContVo {
	/*CO_NO NUMBER(20) PRIMARY KEY, 
	CO_CL VARCHAR2(30), 
	CO_NAME VARCHAR2(30) NOT NULL, 
	CO_EXP VARCHAR2(4000) NOT NULL,
	CO_URL VARCHAR2(100), 
	CO_ST DATE, 
	CO_END DATE, 
	CO_LO NUMBER(20), 
	CO_CH VARCHAR2(30)
*/
	private String co_name;
	private String co_exp;
	private String co_st;
	private String co_end;
	private String co_url;
	
	public ContVo() {
		super();
	}
	
	public ContVo(String co_name, String co_exp, String co_st, String co_end, String co_url) {
		super();
		this.co_name = co_name;
		this.co_exp = co_exp;
		this.co_st = co_st;
		this.co_end = co_end;
		this.co_url = co_url;
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
	public String getCo_url() {
		return co_url;
	}
	public void setCo_url(String co_url) {
		this.co_url = co_url;
	}
	
	
	
}
