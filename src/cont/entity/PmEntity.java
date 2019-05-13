package cont.entity;

public class PmEntity {
	
	
	/*
	 */
	private int pm_no;
	private int pm_cono; // 공모전 번호
	private String pm_team; //프로젝트 이름 
	private String pm_leader_id;
	private String pm_day;
	private String pm_file;
	private int pm_curm;
	private int pm_limitm; //참여인원
	private String pm_primary; // 주요기능 및 예상 결과물
	private String pm_function; // 주요기능 및 예상 결과물
	private String pm_effect; //기대효과 및 활용 분야
	private String pm_reqSkill; //필요기술 /역략
	private String pm_accSkill; //적용 기술
	private int pm_lo;
	public PmEntity() {
		super();
	}
	
	
	
	
	public PmEntity(int pm_no, int pm_cono, String pm_team, String pm_leader_id, String pm_day, String pm_primary) {
		super();
		this.pm_no = pm_no;
		this.pm_cono = pm_cono;
		this.pm_team = pm_team;
		this.pm_leader_id = pm_leader_id;
		this.pm_day = pm_day;
		this.pm_primary = pm_primary;
	}




	public PmEntity(int pm_no, int pm_cono, String pm_team, String pm_leader_id, String pm_day, String pm_file,
			int pm_curm, int pm_limitm, String pm_primary, String pm_function, String pm_effect, String pm_reqSkill,
			String pm_accSkill, int pm_lo) {
		super();
		this.pm_no = pm_no;
		this.pm_cono = pm_cono;
		this.pm_team = pm_team;
		this.pm_leader_id = pm_leader_id;
		this.pm_day = pm_day;
		this.pm_file = pm_file;
		this.pm_curm = pm_curm;
		this.pm_limitm = pm_limitm;
		this.pm_primary = pm_primary;
		this.pm_function = pm_function;
		this.pm_effect = pm_effect;
		this.pm_reqSkill = pm_reqSkill;
		this.pm_accSkill = pm_accSkill;
		this.pm_lo = pm_lo;
	}
	
	
	public int getPm_no() {
		return pm_no;
	}
	public void setPm_no(int pm_no) {
		this.pm_no = pm_no;
	}
	public int getPm_cono() {
		return pm_cono;
	}
	public void setPm_cono(int pm_cono) {
		this.pm_cono = pm_cono;
	}
	public String getPm_team() {
		return pm_team;
	}
	public void setPm_team(String pm_team) {
		this.pm_team = pm_team;
	}
	public String getPm_leader_id() {
		return pm_leader_id;
	}
	public void setPm_leader_id(String pm_leader_id) {
		this.pm_leader_id = pm_leader_id;
	}
	public String getPm_day() {
		return pm_day;
	}
	public void setPm_day(String pm_day) {
		this.pm_day = pm_day;
	}
	public String getPm_file() {
		return pm_file;
	}
	public void setPm_file(String pm_file) {
		this.pm_file = pm_file;
	}
	public int getPm_curm() {
		return pm_curm;
	}
	public void setPm_curm(int pm_curm) {
		this.pm_curm = pm_curm;
	}
	public int getPm_limitm() {
		return pm_limitm;
	}
	public void setPm_limitm(int pm_limitm) {
		this.pm_limitm = pm_limitm;
	}
	public String getPm_primary() {
		return pm_primary;
	}
	public void setPm_primary(String pm_primary) {
		this.pm_primary = pm_primary;
	}
	public String getPm_function() {
		return pm_function;
	}
	public void setPm_function(String pm_function) {
		this.pm_function = pm_function;
	}
	public String getPm_effect() {
		return pm_effect;
	}
	public void setPm_effect(String pm_effect) {
		this.pm_effect = pm_effect;
	}
	public String getPm_reqSkill() {
		return pm_reqSkill;
	}
	public void setPm_reqSkill(String pm_reqSkill) {
		this.pm_reqSkill = pm_reqSkill;
	}
	public String getPm_accSkill() {
		return pm_accSkill;
	}
	public void setPm_accSkill(String pm_accSkill) {
		this.pm_accSkill = pm_accSkill;
	}
	public int getPm_lo() {
		return pm_lo;
	}
	public void setPm_lo(int pm_lo) {
		this.pm_lo = pm_lo;
	}
	
	
}
