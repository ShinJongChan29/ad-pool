package com.ad.adpool.model;

import java.sql.Date;

public class Reple {
	private int r_no;
	private int a_no;
	private String r_mid;
	private String r_content;
	private String r_del;
	private String r_mpicture;
	private Date r_date;
	private int r_ref;
	private int r_re_level;
	private int r_re_step;
	private int r_grade;
	private String r_name;
	
	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public int getR_grade() {
		return r_grade;
	}

	public void setR_grade(int r_grade) {
		this.r_grade = r_grade;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public int getR_ref() {
		return r_ref;
	}

	public void setR_ref(int r_ref) {
		this.r_ref = r_ref;
	}

	public int getR_re_level() {
		return r_re_level;
	}

	public void setR_re_level(int r_re_level) {
		this.r_re_level = r_re_level;
	}

	public int getR_re_step() {
		return r_re_step;
	}

	public void setR_re_step(int r_re_step) {
		this.r_re_step = r_re_step;
	}

	public String getR_mpicture() {
		return r_mpicture;
	}

	public void setR_mpicture(String r_mpicture) {
		this.r_mpicture = r_mpicture;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public String getR_mid() {
		return r_mid;
	}

	public void setR_mid(String r_mid) {
		this.r_mid = r_mid;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_del() {
		return r_del;
	}

	public void setR_del(String r_del) {
		this.r_del = r_del;
	}

	// paging 시작
		private int startRow;
		private int endRow;	
		public int getStartRow() {	return startRow;	}
		public void setStartRow(int startRow) {
			this.startRow = startRow;
		}
		public int getEndRow() {	return endRow;	}
		public void setEndRow(int endRow) {
			this.endRow = endRow;
		}
		// paging 종료

		//@see java.lang.Object#toString()
		@Override
		public String toString() {
			return "Reple [r_no=" + r_no + ", a_no=" + a_no + ", r_mid=" + r_mid + ", r_content=" + r_content
					+ ", r_del=" + r_del + ", r_mpicture=" + r_mpicture + ", r_date=" + r_date + ", r_ref=" + r_ref
					+ ", r_re_level=" + r_re_level + ", r_re_step=" + r_re_step + ", r_grade=" + r_grade + ", startRow="
					+ startRow + ", endRow=" + endRow + "]";
		}
}
