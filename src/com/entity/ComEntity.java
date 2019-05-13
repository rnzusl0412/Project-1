package com.entity;

public class ComEntity {

	private int com_no;
	private String com_name;
	private String com_id;
	private String com_st;
	private String com_end;

	public ComEntity() {
		super();
	}

	public ComEntity(int com_no, String com_name, String com_id, String com_st, String com_end) {
		super();
		this.com_no = com_no;
		this.com_name = com_name;
		this.com_id = com_id;
		this.com_st = com_st;
		this.com_end = com_end;
	}

	public int getCom_no() {
		return com_no;
	}

	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}

	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}

	public String getCom_st() {
		return com_st;
	}

	public void setCom_st(String com_st) {
		this.com_st = com_st;
	}

	public String getCom_end() {
		return com_end;
	}

	public void setCom_end(String com_end) {
		this.com_end = com_end;
	}

	public String getCom_id() {
		return com_id;
	}

	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}

}
