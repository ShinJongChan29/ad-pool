package com.ad.adpool.dao;
import java.util.List;
import com.ad.adpool.model.Board;
import com.ad.adpool.model.Customer;
import com.ad.adpool.model.Notice;
public interface CsDao {
	int getTotal(Customer customer);
	List<Customer> cList(Customer customer);
	Customer select(int no);
	int insert(Customer customer);
	int maxNum();
	void updateC_re_step(Customer customer);
	void updateReadcount(int num);
	int update(Customer customer);
	int delete(Customer customer);
	
	int n_getTotal(Notice notice);
	List<Notice> nlist(Notice notice);
	Notice n_select(int num);
	int nmaxNum();
	int ninsert(Notice notice);
	void updateN_count(int no);
	int nupdate(Notice notice);
	int ndelete(Notice notice);
}
