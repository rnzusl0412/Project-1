package careerpath.entity;

public class PmJoinEntity {
	
	private int pm_no;
	private String co_name;
	private String pm_team;
	
	public PmJoinEntity() {
		super();
	}
	
	public PmJoinEntity(int pm_no, String co_name, String pm_team) {
		super();
		this.pm_no = pm_no;
		this.co_name = co_name;
		this.pm_team = pm_team;
	}
	
	public int getPm_no() {
		return pm_no;
	}
	public void setPm_no(int pm_no) {
		this.pm_no = pm_no;
	}
	public String getCo_name() {
		return co_name;
	}
	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}
	public String getPm_team() {
		return pm_team;
	}
	public void setPm_team(String pm_team) {
		this.pm_team = pm_team;
	}
	
	
}
