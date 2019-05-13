package bbs.entity;

import java.sql.Date;

public class BbsEntity {

	private int bbs_co;
	private int bbs_no;
	private String bbs_tit;
	private String bbs_user;
	private Date bbs_date;
	private String bbs_con;
	private int bbs_lo;
	private String bbs_file;

	public BbsEntity() {
		super();
	}

	public BbsEntity(int bbs_co, int bbs_no, String bbs_tit, String bbs_user, Date bbs_date, String bbs_con, int bbs_lo,
			String bbs_file) {
		super();
		this.bbs_co = bbs_co;
		this.bbs_no = bbs_no;
		this.bbs_tit = bbs_tit;
		this.bbs_user = bbs_user;
		this.bbs_date = bbs_date;
		this.bbs_con = bbs_con;
		this.bbs_lo = bbs_lo;
		this.bbs_file = bbs_file;
	}

	public int getBbs_co() {
		return bbs_co;
	}

	public void setBbs_co(int bbs_co) {
		this.bbs_co = bbs_co;
	}

	public int getBbs_no() {
		return bbs_no;
	}

	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
	}

	public String getBbs_tit() {
		return bbs_tit;
	}

	public void setBbs_tit(String bbs_tit) {
		this.bbs_tit = bbs_tit;
	}

	public String getBbs_user() {
		return bbs_user;
	}

	public void setBbs_user(String bbs_user) {
		this.bbs_user = bbs_user;
	}

	public Date getBbs_date() {
		return bbs_date;
	}

	public void setBbs_date(Date bbs_date) {
		this.bbs_date = bbs_date;
	}

	public String getBbs_con() {
		return bbs_con;
	}

	public void setBbs_con(String bbs_con) {
		this.bbs_con = bbs_con;
	}

	public int getBbs_lo() {
		return bbs_lo;
	}

	public void setBbs_lo(int bbs_lo) {
		this.bbs_lo = bbs_lo;
	}

	public String getBbs_file() {
		return bbs_file;
	}

	public void setBbs_file(String bbs_file) {
		this.bbs_file = bbs_file;
	}

	

	
}
