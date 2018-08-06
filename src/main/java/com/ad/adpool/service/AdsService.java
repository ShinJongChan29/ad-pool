package com.ad.adpool.service;

import java.util.List;

import com.ad.adpool.model.Ads;
import com.ad.adpool.model.Board;

public interface AdsService {

	int insert(Ads ads);

	int select();

	List selectView(Ads ads);

	//2018. 7. 16.(오후 5:46:18)
	List<Ads> selectCategoryList();

	//2018. 7. 16.(오후 5:46:40)
	List<Ads> selectCountryList();
	
}
