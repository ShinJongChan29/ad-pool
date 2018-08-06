/**
 *  Create time : 2018. 7. 3. / 오후 3:47:22
	File name : com.ad.adpool.dao.MemberDao.java
	Location : 
	Project Name : ad-pool
 */
package com.ad.adpool.dao;

import com.ad.adpool.model.Member;

public interface MemberDao {

	//2018. 7. 3.(오후 3:47:29)
	void insert(Member member);

	//2018. 7. 3.(오후 3:47:32)
	Member select(Member member);

	//2018. 7. 3.(오후 3:47:37)
	int delete(Member member);

	//2018. 7. 3.(오후 3:47:39)
	int update(Member member);

}
