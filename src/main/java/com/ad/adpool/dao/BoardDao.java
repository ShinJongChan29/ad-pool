package com.ad.adpool.dao;

import java.util.List;

import com.ad.adpool.model.Ads_like;
import com.ad.adpool.model.Board;
import com.ad.adpool.model.KeywordLog;
import com.ad.adpool.model.Reple;
import com.ad.adpool.model.ViewLog;

public interface BoardDao {

	int getTotal(Board board);

	List<Board> selectView(Board board);

	Board detailView(int no);

	List<Board> detailViewlist(String a_kind);

	int insertLike(Ads_like like);

	List<Ads_like> selectLike(String like_id);

	void upLike(int like_no);

	void deleteLike(int del_like);

	void downLike(int del_like);

	String checkIp(ViewLog vl);

	void insertIp(ViewLog vl);

	void upviewcount(int no);

	void deletelog();

	//2018. 7. 11.(오후 5:46:19)
	List<Board> mfavoritList(String m_id);

	void reinsert(Reple rp);

	List<Reple> getReple(Reple rp);

	void repleDel(int r_no);

	void repleUpdate(Reple rp);

	List<Board> select9();

	void insertKeyword(KeywordLog keyLog);

	KeywordLog selectKey(KeywordLog keyLog);

	List<KeywordLog> selectKeyList();

	//2018. 7. 20.(오전 10:45:03)
	int getTotal(Reple reple);
	
}
