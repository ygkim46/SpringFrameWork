package com.web.dto.board;

import com.sun.jmx.snmp.Timestamp;

public class BoardInfo {
	private int seq;
	private String title;
	private String mbr_no;
	private String reg_dtime;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMbr_no() {
		return mbr_no;
	}
	public void setMbr_no(String mbr_no) {
		this.mbr_no = mbr_no;
	}
	public String getReg_dtime() {
		return reg_dtime;
	}
	public void setReg_dtime(String reg_dtime) {
		this.reg_dtime = reg_dtime;
	}
	
}
