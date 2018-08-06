package com.ad.adpool.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ad.adpool.dao.AdsDao;
import com.ad.adpool.model.Ads;
import com.ad.adpool.model.Board;
@Service
public class AdsServiceImpl implements AdsService{
	@Autowired
	AdsDao ud;

	@Override
	public int insert(Ads ads) {
		// TODO Auto-generated method stub
		return ud.insert(ads);
	}

	@Override
	public int select() {
		// TODO Auto-generated method stub
		return ud.select();
	}

	@Override
	public List<Ads> selectView(Ads ads) {
		// TODO Auto-generated method stub
		return ud.selectView(ads);
	}

	//@see com.ad.adpool.service.AdsService#selectCategoryList()
	@Override
	public List<Ads> selectCategoryList() {
		
		return ud.selectCategory();
	}

	//@see com.ad.adpool.service.AdsService#selectCountryList()
	@Override
	public List<Ads> selectCountryList() {
		
		return ud.selectCountry();
	}

	
}
