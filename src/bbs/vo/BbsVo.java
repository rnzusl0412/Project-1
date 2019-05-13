package bbs.vo;

public class BbsVo {
	
	private String bbs_tit;
	private String bbs_con;
	private String bbs_file;
	
	public BbsVo() {
		super();
	}
	
	public BbsVo(String bbs_tit, String bbs_con, String bbs_file) {
		super();
		this.bbs_tit = bbs_tit;
		this.bbs_con = bbs_con;
		this.bbs_file = bbs_file;
	}
	
	public String getBbs_tit() {
		return bbs_tit;
	}
	public void setBbs_tit(String bbs_tit) {
		this.bbs_tit = bbs_tit;
	}
	public String getBbs_con() {
		return bbs_con;
	}
	public void setBbs_con(String bbs_con) {
		this.bbs_con = bbs_con;
	}
	public String getBbs_file() {
		return bbs_file;
	}
	public void setBbs_file(String bbs_file) {
		this.bbs_file = bbs_file;
	}
	
	
	
	
	
}
