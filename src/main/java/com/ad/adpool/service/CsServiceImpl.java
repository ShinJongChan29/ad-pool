package com.ad.adpool.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ad.adpool.dao.CsDao;
import com.ad.adpool.model.Board;
import com.ad.adpool.model.Customer;
import com.ad.adpool.model.Notice;

@Service
public class CsServiceImpl implements CsService {
	@Autowired
	private CsDao cd;

	@Override
	public int getTotal(Customer customer) {
		return cd.getTotal(customer);
	}

	@Override
	public List<Customer> selectView(Customer customer) {
		return cd.cList(customer);
	}

	@Override
	public Customer select(int no) {
		return cd.select(no);
	}

	@Override
	public int insert(Customer customer) {
		return cd.insert(customer);
	}

	@Override
	public int maxNum() {
		return cd.maxNum();
	}

	@Override
	public void updateC_re_step(Customer customer) {
		cd.updateC_re_step(customer);
	}

	@Override
	public int n_getTotal(Notice notice) {
		return cd.n_getTotal(notice);
	}

	@Override
	public List<Notice> nselectView(Notice notice) {
		return cd.nlist(notice);
	}

	@Override
	public void updateReadcount(int num) {
		cd.updateReadcount(num);
	}

	@Override
	public Notice n_select(int num) {
		return cd.n_select(num);
	}

	@Override
	public int update(Customer customer) {
		return cd.update(customer);
	}

	@Override
	public int delete(Customer customer) {
		return cd.delete(customer);
	}

	@Override
	public int nmaxNum() {
		return cd.nmaxNum();
	}

	@Override
	public int ninsert(Notice notice) {
		return cd.ninsert(notice);
	}

	@Override
	public void updateN_count(int no) {
		cd.updateN_count(no);
	}

	@Override
	public int nupdate(Notice notice) {
		return cd.nupdate(notice);
	}

	@Override
	public int ndelete(Notice notice) {
		return cd.ndelete(notice);
	}

}
