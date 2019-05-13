package com.vo;

public class ComVo {

	private String com_name;
	private String com_st;
	private String com_end;

	public ComVo() {
		super();
	}

	public ComVo(String com_name, String com_st, String com_end) {
		super();
		this.com_name = com_name;
		this.com_st = com_st;
		this.com_end = com_end;
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

}
