/**
 *  Create time : 2018. 7. 3. / 오후 3:47:50
	File name : com.ad.adpool.dao.MemberDaoImpl.java
	Location : 
	Project Name : ad-pool
 */
package com.ad.adpool.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ad.adpool.model.Member;
@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate sst;
	//@see com.ad.adpool.dao.MemberDao#insert(com.ad.adpool.model.Member)
	@Override
	public void insert(Member member) {
		sst.insert("memberns.insert", member);
	}

	//@see com.ad.adpool.dao.MemberDao#select(com.ad.adpool.model.Member)
	@Override
	public Member select(Member member) {
		
		return sst.selectOne("memberns.select", member);
	}

	//@see com.ad.adpool.dao.MemberDao#delete(com.ad.adpool.model.Member)
	@Override
	public int delete(Member member) {
		
		return sst.update("memberns.delete", member);
	}

	//@see com.ad.adpool.dao.MemberDao#update(com.ad.adpool.model.Member)
	@Override
	public int update(Member member) {
		return sst.update("memberns.update",member);
	}

}
