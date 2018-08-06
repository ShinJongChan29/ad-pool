package com.ad.adpool.dao;

import java.util.List;

import com.ad.adpool.model.Ads;
import com.ad.adpool.model.Board;

public interface AdsDao {

	int insert(Ads ads);

	int select();

	
	List<Ads> selectView(Ads ads);

	//2018. 7. 16.(오후 5:47:24)
	List<Ads> selectCategory();

	//2018. 7. 16.(오후 5:47:28)
	List<Ads> selectCountry();


}
