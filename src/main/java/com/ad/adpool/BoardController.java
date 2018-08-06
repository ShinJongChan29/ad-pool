package com.ad.adpool;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ad.adpool.model.Ads_like;
import com.ad.adpool.model.Board;
import com.ad.adpool.model.KeywordLog;
import com.ad.adpool.model.Member;
import com.ad.adpool.model.Reple;
import com.ad.adpool.model.ViewLog;
import com.ad.adpool.service.BoardService;
import com.ad.adpool.service.PagingBean;

import com.sun.corba.se.spi.legacy.connection.GetEndPointInfoAgainException;

@Controller
public class BoardController {
	@Autowired
	private BoardService bs;

	@RequestMapping(value = "downlike", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String downlike(String no, String currentP) {
		System.out.println("downlike Method Start \nno = " + no + "\ncurrentP=" + currentP);
		if (no != null) {
			int del_like = Integer.parseInt(no);
			bs.deleteLike(del_like);
			bs.downLike(del_like);
		}
		return currentP;
	}

	@RequestMapping(value = "like", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String like(HttpSession session, String no, Ads_like like, String currentP) {
		System.out.println("like Method start");
		if (no != null) {
			like.setL_lno(Integer.parseInt(no));
		}
		if (session.getAttribute("member") == null) {
			return "nolike";
		} else if (session.getAttribute("member") != null) {
			Member mem = (Member) session.getAttribute("member");
			like.setL_mid(mem.getM_id());
			int result = bs.insertLike(like);
			bs.upLike(like.getL_lno());
			if (result == 1) {
			}
			return currentP;
		} else
			return "nolike";
	}

	@RequestMapping("AdsFavoritList")
	public String AdsFavoritList(HttpSession hts, Model model) {
		Member member = (Member) hts.getAttribute("member");
		List<Board> bl = bs.mFavoritList(member.getM_id());
		Map<Integer, Boolean> like_map = new HashMap<Integer, Boolean>();
		like_map = getMap(member, like_map, model);
		model.addAttribute("like_map", like_map);
		model.addAttribute("list", bl);
		model.addAttribute("category", "latest");
		return "boardAjax";
	}

	@RequestMapping(value = "boardAdsView")
	public String boardView(HttpServletRequest req, HttpSession session, String keyword, String category,
			String pageNum, Board board, Model model, String division) {
		KeywordLog keyLog = new KeywordLog();
		System.out.println("Search for Tag : " + board.getA_tag());
		if (board.getA_tag() != null) {
			String tg = "#" + board.getA_tag();
			System.out.println("Search for Tag : " + tg);
			board.setA_tag(tg);
		}
		if (category != null) {
			board.setPcat("a_date");
			if (category.equals("top")) {
				board.setPcat("top");
			}
			if (category.equals("latest")) {
				board.setPcat("a_date");
			} else if (category.equals("top")) {
				board.setPcat("a_goodcount");
			} else if (category.equals("public")) {
				board.setA_kind("Public");
				board.setPcat("a_date");
			} else if (category.equals("enterprise")) {
				board.setA_kind("Enterprise");
				board.setPcat("a_date");
			} else if (category.equals("competition")) {
				board.setComgrade(3);
			}
		}
		if (keyword != null && keyword != "") {
			board.setKeyword(keyword);
			keyLog.setK_keyword(keyword);
			keyLog.setK_ip(req.getRemoteAddr());
			System.out.println(keyLog.toString());
			KeywordLog resKey = bs.selectKey(keyLog);
			if (resKey == null) {
				bs.insertKeyword(keyLog);
			}

		}
		List<KeywordLog> keyList = bs.selectKeyList();
		model.addAttribute("keyList", keyList);
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		if (board.getA_name() != null)
			board.setKeyword("");
		PagingBean pb = getPaging(Integer.parseInt(pageNum), board);
		System.out.println(board.toString() + "\n keyword  : " + keyword);
		List<Board> list = bs.selectView(board);
		int no = pb.getTotal() - board.getStartRow() + 1;
		Map<Integer, Boolean> like_map = new HashMap<Integer, Boolean>();
		if (session.getAttribute("member") != null) {
			like_map = getMap((Member) session.getAttribute("member"), like_map, model);
			model.addAttribute("like_map", like_map);
		}

		model.addAttribute("board", board);
		model.addAttribute("no", no);
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		model.addAttribute("category", category);

		model.addAttribute("keyword", keyword);
		model.addAttribute("nowP", pb.getCurrentPage());
		if (division != null) {
			return "boardAjax";
		} else {
			return "boardAdsView";
		}
	}

	// Like
	public Map<Integer, Boolean> getMap(Member member, Map<Integer, Boolean> lmap, Model model) {
		Member m = member;
		String mid = m.getM_id();
		model.addAttribute("memId", mid);
		System.out.println(m.toString() + " and String mid = " + mid);
		List<Ads_like> like_list = bs.selectLike(m.getM_id());
		for (int i = 0; i < like_list.size(); i++) {
			lmap.put(like_list.get(i).getL_lno(), true);
		}
		return lmap;
	}

	// Paging
	public PagingBean getPaging(int pageNum, Board board) {

		int currentPage = pageNum;
		int total = bs.getTotal(board);
		// System.out.println("Total : " + total);
		int rowPerPage = 12;
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		// System.out.println("===============\n" + board.toString());
		return new PagingBean(currentPage, rowPerPage, total);
	}

	
	@RequestMapping("view")
	public String view(Model model, int no, HttpServletRequest req) {
		System.out.println("view no" + no);
		ViewLog vl = new ViewLog();
		vl.setV_ip(req.getRemoteAddr());
		vl.setV_viewNo(no);
		String checkId = bs.checkIp(vl);
		System.out.println("checkId:" + checkId);

		if (checkId == null || checkId.equals("")) {
			bs.upviewcount(no);
			bs.insertIp(vl);
		}
		Board board = bs.detailView(no);

		String tag = board.getA_tag();

		if (tag != null) {
			if (tag.contains("#")) {
				String[] tlist = tag.split("#");
				for (int i = 0; i < tlist.length; i++) {
					System.out.println(tlist.length + "개 " + tlist[i]);
					model.addAttribute("tl", tlist);
				}
			}
		}
		List<Board> list = bs.detailViewlist(board.getA_category());
		int rowPerPage = 4;
		model.addAttribute("board", board);
		model.addAttribute("tlist", list);
		return "view";
	}

	// 리플 삽입
	@RequestMapping("reinsert")
	public String reinsert(Model model, Reple rp, HttpSession hs) {
		System.out.println("Request Reply Insert  : " + rp);
		Member member = (Member) hs.getAttribute("member");
		if (member == null) {
			System.out.println("세션값 ㄴㄴ");
		}
		rp.setR_mid(member.getM_id());
		if (member.getM_picture() == null)
			rp.setR_mpicture("N");
		else
			rp.setR_mpicture(member.getM_picture());
		System.out.println("Inserting values : " + rp.toString());
		bs.reinsert(rp);
		return "repleList";
	}

	// 리플 리스트
	@RequestMapping("repleList")
	public String repleList(Model model, Reple rp, HttpSession hs, String replyPageNo) {
		System.out
				.println("----------------------------------pageNum----------------------------------\n" + replyPageNo);
		int pageNo = 0;
		if (replyPageNo == null || replyPageNo == "")
			pageNo = 1;
		else
			pageNo = Integer.parseInt(replyPageNo) + 1;

		PagingBean pb = getPagingr(pageNo, rp);
		Member member = (Member) hs.getAttribute("member");
		List<Reple> rlist = bs.getReple(rp);
		System.out.println("댓글 정보//\n" + rp.toString() + "\n" + "pageNum : " + pageNo);
		System.out.println("댓글 갯수 : " + rlist.size());
		model.addAttribute("pageNum", pageNo);
		model.addAttribute("repleList", rlist);
		model.addAttribute("member", member);
		return "repleList";
	}

	// Reply Paging
	public PagingBean getPagingr(int pageNum, Reple reple) {

		int currentPage = pageNum;
		System.out.println("Paging getTotal Reply : " + reple.toString());
		int total = bs.getTotal(reple);
		System.out.println("Total : " + total);
		int rowPerPage = 10;
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		startRow = 1;
		reple.setStartRow(startRow);
		reple.setEndRow(endRow);
		System.out.println("Start Row : " + reple.getStartRow() + "\nEnd Row : " + reple.getEndRow());
		return new PagingBean(currentPage, rowPerPage, total);
	}

	// 리플 삭제
	@RequestMapping("rDelete")
	public String repleDel(Reple rp) {
		bs.repleDel(rp.getR_no());
		return "redirect:repleList?a_no=" + rp.getA_no();
	}

	// 리플 수정
	@RequestMapping("rUpdate")
	public String repleUpdate(Reple rp) {
		bs.repleUpdate(rp);
		return "redirect:repleList?a_no=" + rp.getA_no();
	}

	// 리플에 리플 삽입
	@RequestMapping("rInsert")
	public String rInsert(Reple rp, HttpSession hs) {
		System.out.println("Insert Request Context : " + rp.toString());
		Member member = (Member) hs.getAttribute("member");
		rp.setR_mid(member.getM_id());
		if (member.getM_picture() == null)
			rp.setR_mpicture("N");
		else
			rp.setR_mpicture(member.getM_picture());
		rp.setR_ref(rp.getR_ref());
		rp.setR_re_step(rp.getR_re_step() + 1);
		rp.setR_re_level(1);
		System.out.println("Real Insert Reply : " + rp.toString());
		bs.reinsert(rp);
		return "redirect:repleList?a_no=" + rp.getA_no();
	}
}