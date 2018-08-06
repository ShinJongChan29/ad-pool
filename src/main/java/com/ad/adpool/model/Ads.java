package com.ad.adpool.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Ads {

	private int a_no;// 광고번호
	private String a_subject;// 제목
	private String a_name;// 제작자명
	private String a_content;// 내용
	private String a_category;// 카테고리
	private String a_country;// 나라
	private String a_kind;// 기업인지 개인인지;
	private int a_grade;// 시청등급
	private MultipartFile file; // 파일정보
	private int a_goodcount;// 좋아요
	private int a_viewcount;// 조회수
	private Date a_date;// 생성일
	private String a_url;// URL주소
	private String a_filename;// UPLOAD 경로
	private String a_del; // 삭제여부
	private String a_loc;
	private String a_tag;
	
	private int rn;
	private String param;
	private String orderby;
	private String keyword;
	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	private int division;
	
	public String getA_tag() {
		return a_tag;
	}

	public void setA_tag(String a_tag) {
		this.a_tag = a_tag;
	}

	

	public int getDivision() {
		return division;
	}

	public void setDivision(int division) {
		this.division = division;
	}

	// paging
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

	public String getA_loc() {
		return a_loc;
	}

	public void setA_loc(String a_loc) {
		this.a_loc = a_loc;
	}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public String getA_subject() {
		return a_subject;
	}

	public void setA_subject(String a_subject) {
		this.a_subject = a_subject;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public String getA_url() {
		return a_url;
	}

	public void setA_url(String a_url) {
		this.a_url = a_url;
	}

	public String getA_filename() {
		return a_filename;
	}

	public void setA_filename(String a_filename) {
		this.a_filename = a_filename;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getA_category() {
		return a_category;
	}

	public void setA_category(String a_category) {
		this.a_category = a_category;
	}

	public String getA_country() {
		return a_country;
	}

	public void setA_country(String a_country) {
		this.a_country = a_country;
	}

	public String getA_kind() {
		return a_kind;
	}

	public void setA_kind(String a_kind) {
		this.a_kind = a_kind;
	}

	public int getA_grade() {
		return a_grade;
	}

	public void setA_grade(int a_grade) {
		this.a_grade = a_grade;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public int getA_goodcount() {
		return a_goodcount;
	}

	public void setA_goodcount(int a_goodcount) {
		this.a_goodcount = a_goodcount;
	}

	public int getA_viewcount() {
		return a_viewcount;
	}

	public void setA_viewcount(int a_viewcount) {
		this.a_viewcount = a_viewcount;
	}

	public Date getA_date() {
		return a_date;
	}

	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}

	public String getA_del() {
		return a_del;
	}

	public void setA_del(String a_del) {
		this.a_del = a_del;
	}

	@Override
	public String toString() {
		return "Ads [a_no=" + a_no + ", a_subject=" + a_subject + ", a_name=" + a_name + ", a_content=" + a_content
				+ ", a_category=" + a_category + ", a_country=" + a_country + ", a_kind=" + a_kind + ", a_grade="
				+ a_grade + ", file=" + file + ", a_goodcount=" + a_goodcount + ", a_viewcount=" + a_viewcount
				+ ", a_date=" + a_date + ", a_url=" + a_url + ", a_filename=" + a_filename + ", a_del=" + a_del
				+ ", a_loc=" + a_loc + ", a_tag=" + a_tag + ", division=" + division + ", startRow=" + startRow
				+ ", endRow=" + endRow + "]";
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	

	

/*	public int compareTo(Ads a) {
		if (this.a_viewcount > a.a_viewcount) {
			return -1;
		} else if (this.a_viewcount < a.a_viewcount) {
			return 1;
		} else
			return 0;
	}

	public int compareTo(Ads a,String division) {
				if(division.equals("good")){
					if(this.a_goodcount > a.a_goodcount) {
						return -1;
					}else if(this.a_goodcount < a.a_goodcount) { 
						return 1;
					}else { 
						return 0;
					}	
					
				}else if(division.equals("view")){
					if (this.a_viewcount > a.a_viewcount) {
						return -1;
					} else if (this.a_viewcount < a.a_viewcount) {
						return 1;
					} else {
						return 0;
					}
				}else return 0;			
				}*/
}
