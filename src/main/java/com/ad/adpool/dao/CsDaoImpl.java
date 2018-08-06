package com.ad.adpool.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ad.adpool.model.Board;
import com.ad.adpool.model.Customer;
import com.ad.adpool.model.Notice;
@Repository
public class CsDaoImpl implements CsDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int getTotal(Customer customer) {
		return sst.selectOne("customerns.getTotal", customer);
	}

	@Override
	public List<Customer> cList(Customer customer) {
		return sst.selectList("customerns.clist", customer);
	}

	@Override
	public Customer select(int no) {
		return sst.selectOne("customerns.select", no);
	}

	@Override
	public int insert(Customer customer) {
		return sst.insert("customerns.insert", customer);
	}

	@Override
	public int maxNum() {
		return sst.selectOne("customerns.maxNum");
	}

	@Override
	public void updateC_re_step(Customer customer) {
		sst.update("customerns.updateC_re_step", customer);
		
	}

	@Override
	public int n_getTotal(Notice notice) {
		return sst.selectOne("noticens.getTotal", notice);
	}

	@Override
	public List<Notice> nlist(Notice notice) {
		System.out.println("?");
		System.out.println(notice.toString());
		return sst.selectList("noticens.nlist", notice);
	}

	@Override
	public void updateReadcount(int num) {
		sst.update("customerns.updateReadcount", num);
	}

	@Override
	public Notice n_select(int num) {
		return sst.selectOne("noticens.n_select", num);
	}

	@Override
	public int update(Customer customer) {
		return sst.update("customerns.update", customer);
	}

	@Override
	public int delete(Customer customer) {
		return sst.delete("customerns.delete", customer);
	}

	@Override
	public int nmaxNum() {
		return sst.selectOne("noticens.maxNum");
	}

	@Override
	public int ninsert(Notice notice) {
		return sst.insert("noticens.insert", notice);
	}

	@Override
	public void updateN_count(int no) {
		sst.update("noticens.updateN_count", no);
	}

	@Override
	public int nupdate(Notice notice) {
		return sst.update("noticens.update", notice);
	}

	@Override
	public int ndelete(Notice notice) {
		return sst.update("noticens.ndelete", notice);
	}

}
