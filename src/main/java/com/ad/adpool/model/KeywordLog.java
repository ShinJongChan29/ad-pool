package com.ad.adpool.model;

import java.sql.Date;

public class KeywordLog {
	private int k_no;
	private String k_keyword;
	private Date k_date;
	private String k_ip;
	private int cnt;
	private int time;
	private String sec;
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getK_no() {
		return k_no;
	}
	public void setK_no(int k_no) {
		this.k_no = k_no;
	}
	public String getK_keyword() {
		return k_keyword;
	}
	public void setK_keyword(String k_keyword) {
		this.k_keyword = k_keyword;
	}
	public Date getK_date() {
		return k_date;
	}
	public void setK_date(Date k_date) {
		this.k_date = k_date;
	}
	public String getK_ip() {
		return k_ip;
	}
	public void setK_ip(String k_ip) {
		this.k_ip = k_ip;
	}
	@Override
	public String toString() {
		return "KeywordLog [k_no=" + k_no + ", k_keyword=" + k_keyword + ", k_date=" + k_date + ", k_ip=" + k_ip
				+ ", cnt=" + cnt + ", time=" + time + "]";
	}
	public String getSec() {
		return sec;
	}
	public void setSec(String sec) {
		this.sec = sec;
	}
	
	
}
