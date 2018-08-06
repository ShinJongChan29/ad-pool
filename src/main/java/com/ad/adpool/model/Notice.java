package com.ad.adpool.model;

import java.sql.Date;

public class Notice {
	private int n_no; // 게시글번호
	private String n_name; // 작성자
	private String n_subject; // 제목
	private String n_content; // 내용
	private Date n_date; // 게시글 날짜
	private int n_count; // 조회수
	private int n_grade; // 게시글 등급 : 1.공지사항 2.FAQ
	private String n_del; // 게시글 삭제여부

	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public String getN_name() {
		return n_name;
	}

	public void setN_name(String n_name) {
		this.n_name = n_name;
	}

	public String getN_subject() {
		return n_subject;
	}

	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Date getN_date() {
		return n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}

	public int getN_count() {
		return n_count;
	}

	public void setN_count(int n_count) {
		this.n_count = n_count;
	}

	public int getN_grade() {
		return n_grade;
	}

	public void setN_grade(int n_grade) {
		this.n_grade = n_grade;
	}

	public String getN_del() {
		return n_del;
	}

	public void setN_del(String n_del) {
		this.n_del = n_del;
	}

	// paging 시작
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

	// paging 종료
	// 검색 시작
	private String search;
	private String keyword;

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	// 검색 종료

	@Override
	public String toString() {
		return "Notice [n_no=" + n_no + ", n_name=" + n_name + ", n_subject=" + n_subject + ", n_content=" + n_content
				+ ", n_date=" + n_date + ", n_count=" + n_count + ", n_grade=" + n_grade + ", startRow=" + startRow
				+ ", endRow=" + endRow + ", search=" + search + ", keyword=" + keyword + "]";
	}

}
