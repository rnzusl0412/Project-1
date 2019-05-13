package pms.vo;

public class PmsVo {
	private String pms_id;
	private String pms_mission;
	private String pms_st;
	private String pms_end;

	public PmsVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PmsVo(String pms_id, String pms_mission, String pms_st, String pms_end) {
		super();
		this.pms_id = pms_id;
		this.pms_mission = pms_mission;
		this.pms_st = pms_st;
		this.pms_end = pms_end;
	}

	public String getPms_id() {
		return pms_id;
	}

	public void setPms_id(String pms_id) {
		this.pms_id = pms_id;
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
