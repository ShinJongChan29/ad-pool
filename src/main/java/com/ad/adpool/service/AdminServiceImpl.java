package com.ad.adpool.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ad.adpool.dao.AdminDao;
import com.ad.adpool.model.Ads;
import com.ad.adpool.model.KeywordLog;
import com.ad.adpool.model.Member;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired	
	AdminDao ad;

	@Override
	public int memberTotal(Member member) {
		// TODO Auto-generated method stub
		return ad.memberTotal(member);
	}

	@Override
	public List<Member> memberList(Member member) {
		// TODO Auto-generated method stub
		return ad.memberList(member);
	}



	@Override
	public Member select(Member member) {
		// TODO Auto-generated method stub
		return ad.select(member);
	}

	@Override
	public void admemberupdate(Member member) {
		ad.admemberupdate(member);
	}

	@Override
	public List<Ads> adsList(Ads ads) {
		// TODO Auto-generated method stub
		return ad.adsList(ads);
	}

	@Override
	public List<Ads> selectCom(Ads ads) {
		// TODO Auto-generated method stub
		return ad.selectCom(ads);
	}

	@Override
	public void admemberdely(Member member) {
		 ad.admemberdely(member);
	}

	@Override
	public void detaildeldb(Member member) {
		ad.detaildeldb(member);
	}

	@Override
	public Ads selectAds(Ads ads) {
		// TODO Auto-generated method stub
		return ad.selectAds(ads);
	}

	@Override
	public void adadsupdate(Ads ads) {
		ad.adadsupdate(ads);
	}

	@Override
	public void adsdeleY(int no) {
		ad.adsdelY(no);
	}

	@Override
	public void adsdelDB(int no) {
		ad.adsdelDB(no);
	}

	@Override
	public void adsPermit(Ads ads) {
		ad.adsPermit(ads);
	}

	@Override
	public int adadstotal(Ads ads) {
		// TODO Auto-generated method stub
		return ad.adadstotal(ads);
	}

	@Override
	public List<KeywordLog> selectKeyList(KeywordLog keyLog) {
		// TODO Auto-generated method stub
		return ad.selectKeyList(keyLog);
	}

	@Override
	public List<KeywordLog> writeList(KeywordLog keyLog) {
		// TODO Auto-generated method stub
		return ad.writeList(keyLog);
	}

	@Override
	public Ads selectNext(Ads ads) {
		// TODO Auto-generated method stub
		return ad.selectNext(ads);
	}

	@Override
	public Ads selectRn(Ads ads) {
		// TODO Auto-generated method stub
		return ad.selectRn(ads);
	}
}
