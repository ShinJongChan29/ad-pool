package com.ad.adpool;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ad.adpool.model.Board;
import com.ad.adpool.model.Customer;
import com.ad.adpool.model.Member;
import com.ad.adpool.model.Notice;
import com.ad.adpool.service.CsService;
import com.ad.adpool.service.PagingBean;

@Controller
public class CsController {
	@Autowired
	private CsService cs;

	// 공지사항 게시판
	@RequestMapping("noticeList")
	public String noticeList(String ncategory, String keyword, String pageNum, Customer customer, Notice notice,
			Model model,String ad) {
		System.out.println("노티스리스트의 n카테고리? :" + ncategory);
		// notice 게시판
		if (ncategory.equals("ntc")) {
			if (keyword != null && keyword != "")
				customer.setKeyword(keyword);
			if (pageNum == null || pageNum.equals(""))
				pageNum = "1";
			int currentPage = Integer.parseInt(pageNum);
			notice.setN_grade(1);
			int total = cs.n_getTotal(notice);
			int rowPerPage = 10;
			int startRow = (currentPage - 1) * rowPerPage + 1;
			int endRow = startRow + rowPerPage - 1;
			notice.setStartRow(startRow);
			notice.setEndRow(endRow);
			List<Notice> nlist = cs.nselectView(notice);
			int no = total - startRow + 1;
			PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
			String[] t = { "n_subject", "n_name", "n_content", "subcon" };
			model.addAttribute("t", t);
			model.addAttribute("notice", notice);
			model.addAttribute("no", no);
			model.addAttribute("nlist", nlist);
			model.addAttribute("pb", pb);
			model.addAttribute("ncategory", ncategory);
		}

		// faq 게시판
		if (ncategory.equals("faq")) {
			if (keyword != null && keyword != "")
				customer.setKeyword(keyword);
			if (pageNum == null || pageNum.equals(""))
				pageNum = "1";
			int currentPage = Integer.parseInt(pageNum);
			notice.setN_grade(2);
			int total = cs.n_getTotal(notice);
			int rowPerPage = 10;
			int startRow = (currentPage - 1) * rowPerPage + 1;
			int endRow = startRow + rowPerPage - 1;
			notice.setStartRow(startRow);
			notice.setEndRow(endRow);
			List<Notice> nlist = cs.nselectView(notice);
			int no = total - startRow + 1;
			PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
			String[] t = { "n_subject", "n_name", "n_content", "subcon" };
			model.addAttribute("t", t);
			model.addAttribute("notice", notice);
			model.addAttribute("no", no);
			model.addAttribute("nlist", nlist);
			model.addAttribute("pb", pb);
			model.addAttribute("ncategory", ncategory);
		}

		// 고객 게시판
		if (ncategory.equals("csm")) {
			if (keyword != null && keyword == "")
				customer.setKeyword(keyword);
			if (pageNum == null || pageNum.equals(""))
				pageNum = "1";
			int currentPage = Integer.parseInt(pageNum);
			int total = cs.getTotal(customer);
			int rowPerPage = 10;
			int startRow = (currentPage - 1) * rowPerPage + 1;
			int endRow = startRow + rowPerPage - 1;
			customer.setStartRow(startRow);
			customer.setEndRow(endRow);
			List<Customer> clist = cs.selectView(customer);
			int no = total - startRow + 1;
			PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
			String[] t = { "c_subject", "c_name", "c_content", "subcon" };
			System.out.println("헐랭킈 t:" + t);
			model.addAttribute("t", t);
			model.addAttribute("customer", customer);
			model.addAttribute("no", no);
			model.addAttribute("clist", clist);
			model.addAttribute("pb", pb);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("ncategory", ncategory);
		}
		if(ad!=null) {
			if(ad.equals("admin"))
			return "admin/adnoticeList";
		}
		System.out.println("조회완료");
		System.out.println("카테고리+노티스 : " + ncategory + " + " + notice);
		return "notice/noticeList";
	}

	// 고객센터 뷰페이지
	@RequestMapping("csView")
	public String noticeView(int no, String ncategory, String pageNum, Model model) {
		if (ncategory.equals("ntc") || ncategory.equals("faq")) {
			cs.updateN_count(no);
			Notice notice = cs.n_select(no);
			model.addAttribute("notice", notice);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("ncategory", ncategory);
		}

		if (ncategory.equals("csm")) {
			cs.updateReadcount(no);
			Customer customer = cs.select(no);
			model.addAttribute("customer", customer);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("ncategory", ncategory);
			System.out.println(customer.toString());
		}
		return "notice/csView";
	}

	// 고객센터 글 입력폼
	@RequestMapping("csInsertForm")
	public String csInsertForm(String ncategory, String pageNum, String nm, Model model, HttpServletRequest request) {
		// 공지사항, FAQ 게시판 입력
		System.out.println("인서트폼의 ncategory:" + ncategory);
		if (ncategory.equals("ntc") || ncategory.equals("faq")) {
			model.addAttribute("member", request.getSession().getAttribute("admin"));
		}

		// 고객게시판 입력
		if (ncategory.equals("csm")) {
			int c_no = 0, c_ref = 0, c_re_level = 0, c_re_step = 0;
			// 답변글인 경우
			if (nm != null && !nm.equals("")) {
				c_no = Integer.parseInt(nm);
				Customer customer = cs.select(c_no);
				c_ref = customer.getC_ref();
				c_re_level = customer.getC_re_level();
				c_re_step = customer.getC_re_step();
			}
			model.addAttribute("member", request.getSession().getAttribute("member"));
			System.out.println("멤바는?:" + request.getSession().getAttribute("member"));
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("c_no", c_no);
			model.addAttribute("c_ref", c_ref);
			model.addAttribute("c_re_level", c_re_level);
			model.addAttribute("c_re_step", c_re_step);
		}
		model.addAttribute("ncategory", ncategory);
		return "notice/csInsertForm";
	}

	// 고객센터 글 입력
	@RequestMapping("csInsert")
	public String csInsert(String ncategory, String pageNum, Notice notice, Customer customer, Model model,
			HttpServletRequest request) {
		// 공지사항, FAQ 게시판 입력
		if (ncategory.equals("ntc")) {
			int number = cs.nmaxNum();
			int result = cs.ninsert(notice);
			notice.setN_no(number);
			notice.setN_count(0);
			notice.setN_grade(1);
			model.addAttribute("result", result);
		}

		if (ncategory.equals("faq")) {
			int number = cs.nmaxNum();
			int result = cs.ninsert(notice);
			notice.setN_no(number);
			notice.setN_count(0);
			notice.setN_grade(2);
			model.addAttribute("result", result);
		}

		// 고객게시판 입력
		if (ncategory.equals("csm")) {
			customer.setC_ip(request.getRemoteAddr());
			int number = cs.maxNum();

			// 0이 아니면 답변글
			if (customer.getC_no() != 0) {
				cs.updateC_re_step(customer);
				customer.setC_re_level(customer.getC_re_level() + 1);
				customer.setC_re_step(customer.getC_re_step() + 1);
			} else
				customer.setC_ref(number);
			customer.setC_no(number);
			customer.setC_count(0);
			customer.setC_mid(customer.getC_mid());
			int result = cs.insert(customer);
			model.addAttribute("result", result);
			model.addAttribute("pageNum", pageNum);
		}
		model.addAttribute("ncategory", ncategory);
		return "notice/csInsert";
	}

	@RequestMapping("csUpdateForm")
	public String csUpdateForm(int no, String ncategory, String pageNum, Model model, HttpServletRequest request) {
		if (ncategory.equals("ntc")) {
			Notice notice = cs.n_select(no);
			model.addAttribute("member", request.getSession().getAttribute("admin"));
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("notice", notice);
			model.addAttribute("ncategory", ncategory);
		} else if (ncategory.equals("faq")) {
			Notice notice = cs.n_select(no);
			model.addAttribute("member", request.getSession().getAttribute("admin"));
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("notice", notice);
			model.addAttribute("ncategory", ncategory);
		} else if (ncategory.equals("csm")) {
			Customer customer = cs.select(no);
			model.addAttribute("member", request.getSession().getAttribute("member"));
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("customer", customer);
			model.addAttribute("ncategory", ncategory);
		}
		return "notice/csUpdateForm";
	}

	@RequestMapping("csUpdate")
	public String csUpdate(Customer customer, Notice notice, String ncategory, String pageNum, Model model) {
		if (ncategory.equals("ntc")) {
			int result = cs.nupdate(notice);
			model.addAttribute("ncategory", ncategory);
			model.addAttribute("result", result);
		} else if (ncategory.equals("faq")) {
			int result = cs.nupdate(notice);
			model.addAttribute("ncategory", ncategory);
			model.addAttribute("result", result);
		} else if (ncategory.equals("csm")) {
			int result = cs.update(customer);
			model.addAttribute("ncategory", ncategory);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("customer", customer);
			model.addAttribute("result", result);
		}
		return "notice/csUpdate";
	}

	@RequestMapping("csDeleteForm")
	public String csDeleteForm(int no, String ncategory, String pageNum, Member member, Model model
			, HttpServletRequest request) {
		System.out.println("삭제폼의 ncategory:" + ncategory);
		if (ncategory.equals("ntc")) {
			Notice notice = cs.n_select(no);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("notice", notice);
			model.addAttribute("ncategory", ncategory);
		} else if (ncategory.equals("faq")) {
			Notice notice = cs.n_select(no);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("notice", notice);
			model.addAttribute("ncategory", ncategory);
		} else if (ncategory.equals("csm")) {
			Customer customer = cs.select(no);
			model.addAttribute("no", no);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("customer", customer);
			model.addAttribute("ncategory", ncategory);
		}
		model.addAttribute("member", request.getSession().getAttribute("member"));
		System.out.println("비밀번호 : " + member.getM_password());
		return "notice/csDeleteForm";
	}

	@RequestMapping("csDelete")
	public String csDelete(Customer customer, Notice notice, Member member, String ncategory, String pageNum,
			Model model) {
		System.out.println("삭제의 ncategory:" + ncategory);
		if (ncategory.equals("ntc")) {
			int result = cs.ndelete(notice);
			model.addAttribute("member", member);
			model.addAttribute("result", result);
			model.addAttribute("notice", notice);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("ncategory", ncategory);
		} else if (ncategory.equals("faq")) {
			int result = cs.ndelete(notice);
			model.addAttribute("member", member);
			model.addAttribute("result", result);
			model.addAttribute("notice", notice);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("ncategory", ncategory);
		} else if (ncategory.equals("csm")) {
			int result = cs.delete(customer);
			model.addAttribute("member", member);
			model.addAttribute("result", result);
			model.addAttribute("customer", customer);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("ncategory", ncategory);
		}
		return "notice/csDelete";
	}
	
	// about us 페이지
	@RequestMapping("aboutus")
	public String aboutus() {
		return "notice/aboutus";
	}
}
