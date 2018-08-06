package com.ad.adpool.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ad.adpool.model.Ads;
import com.ad.adpool.model.KeywordLog;
import com.ad.adpool.model.Member;

@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	SqlSessionTemplate sst;

	@Override
	public int memberTotal(Member member) {
		// TODO Auto-generated method stub
		return sst.selectOne("memberns.memberTotal",member);
	}

	@Override
	public List<Member> memberList(Member member) {
		// TODO Auto-generated method stub
		return sst.selectList("memberns.memberList",member);
	}



	@Override
	public Member select(Member member) {
		// TODO Auto-generated method stub
		return sst.selectOne("memberns.select",member);
	}

	@Override
	public void admemberupdate(Member member) {
			sst.update("memberns.admemberupdate",member);
	}

	@Override
	public List<Ads> adsList(Ads ads) {
		// TODO Auto-generated method stub
		return sst.selectList("adsns.adslist",ads);
	}

	@Override
	public List<Ads> selectCom(Ads ads) {
		
		return sst.selectList("adsns.selectCom",ads);
	}

	@Override
	public Object admemberdely(Member member) {
		// TODO Auto-generated method stub
		return sst.update("memberns.delete",member);
	}

	@Override
	public void detaildeldb(Member member) {
		sst.delete("memberns.deletedb",member);
	}

	@Override
	public Ads selectAds(Ads ads) {
		// TODO Auto-generated method stub
		return sst.selectOne("adsns.selectAds",ads);
	}

	@Override
	public void adadsupdate(Ads ads) {
			sst.update("adsns.updateAds",ads);
	}

	@Override
	public void adsdelY(int no) {
			sst.update("adsns.adsdelY",no);
	}

	@Override
	public void adsdelDB(int no) {
			sst.delete("adsns.adsdelDB",no);
	}

	@Override
	public void adsPermit(Ads ads) {
			sst.update("adsns.adsPermit",ads);
	}

	@Override
	public int adadstotal(Ads ads) {
		// TODO Auto-generated method stub
		return sst.selectOne("adsns.adadstotal",ads);
	}

	@Override
	public List<KeywordLog> selectKeyList(KeywordLog keyLog) {
		// TODO Auto-generated method stub
		return sst.selectList("keywordLogns.adKeyList",keyLog);
	}

	@Override
	public List<KeywordLog> writeList(KeywordLog keyLog) {
		// TODO Auto-generated method stub
		return sst.selectList("keywordLogns.writeList");
	}

	@Override
	public Ads selectNext(Ads ads) {
		// TODO Auto-generated method stub
		return sst.selectOne("adsns.selectNext",ads);
	}

	@Override
	public Ads selectRn(Ads ads) {
		// TODO Auto-generated method stub
		return sst.selectOne("adsns.selectRn",ads);
	}


	
}
