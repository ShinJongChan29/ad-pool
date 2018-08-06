package com.ad.adpool.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ad.adpool.model.Ads_like;
import com.ad.adpool.model.Board;
import com.ad.adpool.model.KeywordLog;
import com.ad.adpool.model.Reple;
import com.ad.adpool.model.ViewLog;
@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate sst;

	
	@Override
	public int getTotal(Board board) {
		return sst.selectOne("boardns.getTotal", board);
	}

	@Override
	public List<Board> selectView(Board board) {
		return sst.selectList("boardns.list", board);
	}

	@Override
	public Board detailView(int no) {
		return sst.selectOne("boardns.detail", no);
	}

	@Override
	public List<Board> detailViewlist(String a_kind) {
		return sst.selectList("boardns.detailList",a_kind);
	}

	@Override
	public int insertLike(Ads_like like) {
		// TODO Auto-generated method stub
		return sst.insert("likens.insertLike",like);
	}

	@Override
	public List<Ads_like> selectLike(String like_id) {
		// TODO Auto-generated method stub
		return sst.selectList("likens.selectLike",like_id);
	}

	@Override
	public void upLike(int like_no) {
		sst.update("boardns.upLike",like_no);
	}

	@Override
	public void deleteLike(int del_like) {
		sst.delete("likens.deleteLike", del_like);
	}

	@Override
	public void downLike(int del_like) {
		sst.update("boardns.downLike",del_like);
	}

	@Override
	public String checkIp(ViewLog vl) {
		// TODO Auto-generated method stub
		return sst.selectOne("viewLogns.checkip", vl);
	}

	@Override
	public void insertIp(ViewLog vl ) {
		sst.insert("viewLogns.insertip",vl);
		
	}

	@Override
	public void upviewcount(int no) {
		sst.insert("boardns.upviewcount",no);
	}

	@Override
	public void deletelog() {
		sst.delete("viewLogns.deletelog");
	}

	//@see com.ad.adpool.dao.BoardDao#mfavoritList(java.lang.String)
	@Override
	public List<Board> mfavoritList(String m_id) {
		
		return sst.selectList("boardns.mFavoritList", m_id);
	}


	@Override
	public List<Board> select9() {
		// TODO Auto-generated method stub
		return sst.selectList("boardns.select9");
	}

	@Override
	public void insertKeyword(KeywordLog keyLog) {
		sst.insert("keywordLogns.insertKeyword",keyLog);
	}

	@Override
	public KeywordLog selectKey(KeywordLog keyLog) {
		// TODO Auto-generated method stub
		return sst.selectOne("keywordLogns.selectKey",keyLog);
	}

	@Override
	public List<KeywordLog> selectKeyList() {
		// TODO Auto-generated method stub
		return sst.selectList("keywordLogns.selectKeyList");
	}
	@Override
	public void reinsert(Reple rp) {
		sst.insert("replens.reinsert", rp);
		
	}
	
	@Override
	public List<Reple> getReple(Reple rp) {
		
		return sst.selectList("replens.repleList",rp);
	}
	
	@Override
	public void repleDel(int r_no) {
		sst.update("replens.repleDel",r_no);
		
	}
	
	@Override
	public void repleUpdate(Reple rp) {
		sst.update("replens.repleUpdate",rp);
		
	}

	//@see com.ad.adpool.dao.BoardDao#getTotal(com.ad.adpool.model.Reple)
	@Override
	public int getTotal(Reple reple) {
		
		return sst.selectOne("replens.regetTotal",reple);
	}
}
