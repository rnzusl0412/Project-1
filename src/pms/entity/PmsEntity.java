package pms.entity;

public class PmsEntity {

	private int pms_no;
	private String pms_id;
	private int pms_pmno;
	private String pms_mission;
	private String pms_st;
	private String pms_end;

	public PmsEntity() {
		super();
	}

	public PmsEntity(int pms_no, String pms_id, int pms_pmno, String pms_mission, String pms_st, String pms_end) {
		super();
		this.pms_no = pms_no;
		this.pms_id = pms_id;
		this.pms_pmno = pms_pmno;
		this.pms_mission = pms_mission;
		this.pms_st = pms_st;
		this.pms_end = pms_end;
	}

	public int getPms_no() {
		return pms_no;
	}

	public void setPms_no(int pms_no) {
		this.pms_no = pms_no;
	}

	public String getPms_id() {
		return pms_id;
	}

	public void setPms_id(String pms_id) {
		this.pms_id = pms_id;
	}

	public int getPms_pmno() {
		return pms_pmno;
	}

	public void setPms_pmno(int pms_pmno) {
		this.pms_pmno = pms_pmno;
	}

	public String getPms_mission() {
		return pms_mission;
	}

	public void setPms_mission(String pms_mission) {
		this.pms_mission = pms_mission;
	}

	public String getPms_st() {
		return pms_st;
	}

	public void setPms_st(String pms_st) {
		this.pms_st = pms_st;
	}

	public String getPms_end() {
		return pms_end;
	}

	public void setPms_end(String pms_end) {
		this.pms_end = pms_end;
	}
}
