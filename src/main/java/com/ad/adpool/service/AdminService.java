package com.ad.adpool.service;

import java.util.List;

import com.ad.adpool.model.Ads;
import com.ad.adpool.model.KeywordLog;
import com.ad.adpool.model.Member;

public interface AdminService {

	int memberTotal(Member member);

	List<Member> memberList(Member member);


	Member select(Member member);

	void admemberupdate(Member member);

	List<Ads> adsList(Ads ads);

	List<Ads> selectCom(Ads ads);

	void admemberdely(Member member);

	void detaildeldb(Member member);

	Ads selectAds(Ads ads);

	void adadsupdate(Ads ads);

	void adsdeleY(int no);

	void adsdelDB(int no);

	void adsPermit(Ads ads);

	int adadstotal(Ads ads);

	List<KeywordLog> selectKeyList(KeywordLog keyLog);

	List<KeywordLog> writeList(KeywordLog keyLog);

	Ads selectNext(Ads ads);

	Ads selectRn(Ads ads);

}
