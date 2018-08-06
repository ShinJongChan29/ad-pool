package com.ad.adpool.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ad.adpool.dao.BoardDao;
import com.ad.adpool.model.Ads_like;
import com.ad.adpool.model.Board;
import com.ad.adpool.model.KeywordLog;
import com.ad.adpool.model.Reple;
import com.ad.adpool.model.ViewLog;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	public BoardDao bd;

	@Override
	public int getTotal(Board board) {
		return bd.getTotal(board);
	}

	@Override
	public List<Board> selectView(Board board) {
		return bd.selectView(board);
	}

	@Override
	public Board detailView(int no) {
		return bd.detailView(no);
	}

	@Override
	public List<Board> detailViewlist(String a_kind) {

		return bd.detailViewlist(a_kind);
	}

	@Override
	public int insertLike(Ads_like like) {
		// TODO Auto-generated method stub
		return bd.insertLike(like);
	}

	@Override
	public List<Ads_like> selectLike(String like_id) {
		// TODO Auto-generated method stub
		return bd.selectLike(like_id);
	}

	@Override
	public void upLike(int l_lno) {
		bd.upLike(l_lno);

	}

	@Override
	public void deleteLike(int del_like) {
		bd.deleteLike(del_like);

	}

	@Override
	public void downLike(int del_like) {
		bd.downLike(del_like);
	}

	@Override
	public String checkIp(ViewLog vl) {
		// TODO Auto-generated method stub
		return bd.checkIp(vl);
	}

	@Override
	public void insertIp(ViewLog vl) {
		bd.insertIp(vl);
	}

	@Override
	public void upviewcount(int no) {
		bd.upviewcount(no);
	}

	@Override
	public void deletelog() {
		bd.deletelog();
	}

	// @see com.ad.adpool.service.BoardService#mFavoritList(java.lang.String)
	@Override
	public List<Board> mFavoritList(String m_id) {

		return bd.mfavoritList(m_id);
	}

	@Override
	public void reinsert(Reple rp) {
		bd.reinsert(rp);

	}

	@Override
	public List<Reple> getReple(Reple rp) {

		return bd.getReple(rp);
	}

	@Override
	public void repleDel(int r_no) {
		bd.repleDel(r_no);

	}

	@Override
	public void repleUpdate(Reple rp) {
		bd.repleUpdate(rp);
		
	}

	@Override
	public List<Board> select9() {
		// TODO Auto-generated method stub
		return bd.select9();
	}

	@Override
	public void insertKeyword(KeywordLog keyLog) {
		bd.insertKeyword(keyLog);
		
	}

	@Override
	public KeywordLog selectKey(KeywordLog keyLog) {
		return bd.selectKey(keyLog);
		
	}

	@Override
	public List<KeywordLog> selectKeyList() {
		// TODO Auto-generated method stub
		return bd.selectKeyList();
	}

	//@see com.ad.adpool.service.BoardService#getTotal(com.ad.adpool.model.Reple)
	@Override
	public int getTotal(Reple reple) {
		
		return bd.getTotal(reple);
	}
}
