package com.ad.adpool.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ad.adpool.dao.MemberDao;
import com.ad.adpool.model.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao md;
	public int insert(Member member) {
		md.insert(member);
		return 0;
	}
	public Member select(Member member) {
	
		return md.select(member);
	}
	//@see com.ad.adpool.service.MemberService#delete(com.ad.adpool.model.Member)
	@Override
	public int delete(Member member) {
		
		return md.delete(member);
	}
	//@see com.ad.adpool.service.MemberService#update(com.ad.adpool.model.Member)
	@Override
	public int update(Member member) {
		
		return md.update(member);
	}

}
