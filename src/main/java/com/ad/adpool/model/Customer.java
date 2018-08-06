package com.ad.adpool.model;
import java.sql.Date;
public class Customer {
	
	@Override
	public String toString() {
		return "Customer [c_no=" + c_no + ", c_subject=" + c_subject + ", c_content=" + c_content + ", c_date=" + c_date
				+ ", c_name=" + c_name + ", c_count=" + c_count + ", c_mid=" + c_mid + ", c_ref=" + c_ref
				+ ", c_re_step=" + c_re_step + ", c_re_level=" + c_re_level + ", c_ip=" + c_ip + ", c_del=" + c_del
				+ ", ccat=" + ccat + ", startRow=" + startRow + ", endRow=" + endRow + ", search=" + search
				+ ", keyword=" + keyword + "]";
	}
	private int c_no; // 고객센터번호 
	private String c_subject; // 제목
	private String c_content; // 내용
	private Date c_date; // 날짜
	private String c_name; // 이름
	private int c_count; //조회수
	private String c_mid; // 댓글작성자
	private int c_ref; // 댓글
	private int c_re_step; // 댓글STEP
	private int c_re_level; // 댓글LEVEL
	private String c_ip; // 아이피주소
	private String c_del; // 삭제여부
	private String ccat; // 커스토머 카테고리
	
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_subject() {
		return c_subject;
	}
	public void setC_subject(String c_subject) {
		this.c_subject = c_subject;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public int getC_count() {
		return c_count;
	}
	public void setC_count(int c_count) {
		this.c_count = c_count;
	}
	public String getC_mid() {
		return c_mid;
	}
	public void setC_mid(String c_mid) {
		this.c_mid = c_mid;
	}
	public int getC_ref() {
		return c_ref;
	}
	public void setC_ref(int c_ref) {
		this.c_ref = c_ref;
	}
	public int getC_re_step() {
		return c_re_step;
	}
	public void setC_re_step(int c_re_step) {
		this.c_re_step = c_re_step;
	}
	public int getC_re_level() {
		return c_re_level;
	}
	public void setC_re_level(int c_re_level) {
		this.c_re_level = c_re_level;
	}
	public String getC_ip() {
		return c_ip;
	}
	public void setC_ip(String c_ip) {
		this.c_ip = c_ip;
	}
	public String getC_del() {
		return c_del;
	}
	public void setC_del(String c_del) {
		this.c_del = c_del;
	}
	public String getCcat() {
		return ccat;
	}
	public void setCcat(String ccat) {
		this.ccat = ccat;
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
	// 검색 시작
	private String search;
	private String keyword;	
	public String getSearch() {	return search;	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {	return keyword;	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	// 검색 종료
}
