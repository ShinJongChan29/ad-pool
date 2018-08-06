package com.ad.adpool.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ad.adpool.model.Ads;
@Repository
public class AdsDaoImpl implements AdsDao{
	@Autowired
	SqlSessionTemplate sst;

	@Override
	public int insert(Ads ads) {
		return sst.insert("adsns.insert",ads);
	}

	@Override
	public int select() {
		// TODO Auto-generated method stub
		return sst.selectOne("adsns.select");
	}

	@Override
	public List<Ads> selectView(Ads ads) {
		return sst.selectList("adsns.list",ads);
	}

	//@see com.ad.adpool.dao.AdsDao#selectCategory()
	@Override
	public List<Ads> selectCategory() {
		
		return sst.selectList("adsns.sCategory");
	}

	//@see com.ad.adpool.dao.AdsDao#selectCountry()
	@Override
	public List<Ads> selectCountry() {
		
		return sst.selectList("adsns.sCountry");
	}
	
}
