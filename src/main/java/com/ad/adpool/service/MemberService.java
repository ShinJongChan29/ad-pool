package com.ad.adpool.service;

import com.ad.adpool.model.Member;

public interface MemberService {

	int insert(Member member);

	Member select(Member member);

	//2018. 7. 3.(오후 2:17:37)
	int delete(Member member);

	//2018. 7. 3.(오후 2:27:35)
	int update(Member member);





}
