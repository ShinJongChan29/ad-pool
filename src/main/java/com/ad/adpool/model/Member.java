package com.ad.adpool.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_address;
	private String m_email;
	private Date m_date;
	private String m_del;
	private int m_grade;
	private String m_ip;
	private String m_picture;
	private MultipartFile m_file;
	private String m_phone;
	private String am_keyword;
	public String getAm_keyword() {
		return am_keyword;
	}
	public void setAm_keyword(String am_keyword) {
		this.am_keyword = am_keyword;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public MultipartFile getM_file() {
		return m_file;
	}
	private int startRow;
	private int endRow;
	
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public void setM_file(MultipartFile m_file) {
		this.m_file = m_file;
	}
	public String getM_picture() {
		return m_picture;
	}
	public void setM_picture(String m_picture) {
		this.m_picture = m_picture;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public String getM_del() {
		return m_del;
	}
	public void setM_del(String m_del) {
		this.m_del = m_del;
	}
	public int getM_grade() {
		return m_grade;
	}
	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}
	public String getM_ip() {
		return m_ip;
	}
	public void setM_ip(String m_ip) {
		this.m_ip = m_ip;
	}
	@Override
	public String toString() {
		return "Member [m_id=" + m_id + ", m_password=" + m_password + ", m_name=" + m_name + ", m_address=" + m_address
				+ ", m_email=" + m_email + ", m_date=" + m_date + ", m_del=" + m_del + ", m_grade=" + m_grade
				+ ", m_ip=" + m_ip + ", m_picture=" + m_picture + ", m_file=" + m_file + ", m_phone=" + m_phone
				+ ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
	
	
}
