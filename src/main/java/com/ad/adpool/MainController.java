/**
 *  Create time : 2018. 6. 28. / 오후 2:26:36
	File name : com.ad.adpool.MainController.java
	Location : 
	Project Name : ad-pool
 */
package com.ad.adpool;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.ad.adpool.model.Board;
import com.ad.adpool.model.Email;
import com.ad.adpool.model.KeywordLog;
import com.ad.adpool.model.Member;
import com.ad.adpool.service.AdminService;
import com.ad.adpool.service.BoardService;
import com.ad.adpool.service.MemberService;

@Controller
public class MainController {
	@Autowired
	private MemberService ms;
	@Autowired
	private BoardService bs;
	@Autowired
	private AdminService as;
	
	// trend 게시판
	@RequestMapping("trendView")
	public String trend(String keyword, Model model) {
		KeywordLog kw = new KeywordLog();
		//kw.setTime(1);
		List<KeywordLog> keyList = as.selectKeyList(kw);
		//kw = keyList.get(0);
		String trend = "[";
		
		for (int i = 0; i < keyList.size(); i++) {
			trend +="{text:\""+keyList.get(i).getK_keyword()+"\", weight:"
					+keyList.get(i).getCnt()+", link: \"http://127.0.0.1/adpool/boardAdsView?keyword="
					+keyList.get(i).getK_keyword()+"&category=allSearch\"}"; 
			if (keyList.size()!=i-1) {
				trend += ",";
			}
					 
				
		} trend += "]";
		model.addAttribute("trend", trend);
		//model.addAttribute("keyword", keyword);
		//model.addAttribute("keywordLog", keyList.get(0));
		//System.out.println("검색어:" + kw);
		return "trendView";
	}

	// jqCloud 테스트
	@RequestMapping("jqTest2")
	public String jq() {
		return "jqTest2";
	}

	// 메인페이지
	@RequestMapping("main")
	public String main(Model model,HttpSession session) {
		List<Board> bList = bs.select9();
		model.addAttribute("bList", bList);
		KeywordLog kw = new KeywordLog();
		kw.setTime(0);
		kw.setSec("minute");
		//System.out.println(kw.getTime());
		List<KeywordLog> kwList=as.selectKeyList(kw);
		List<KeywordLog> sessionKeyword = new ArrayList<KeywordLog>();
		int kwSize=10;
		if(kwList.size()<10)
			kwSize = kwList.size();
		for(int i=0;i<kwSize;i++) {
			sessionKeyword.add(kwList.get(i));
		}
		
		session.setAttribute("sessionKeyword", sessionKeyword);
		return "main";
	}

	// 회원가입 폼
	@RequestMapping("joinForm")
	public String joinForm() {
		System.out.println("joinForm()");
		return "joinForm";
	}

	// 회원가입
	@RequestMapping("join")
	public String join(Member member, HttpServletRequest req, String phone2, String phone3) {
		System.out.println(member.getM_id());
		System.out.println("phone2:" + phone2 + ",phone3:" + phone3);
		member.setM_phone(member.getM_phone() + "-" + phone2 + "-" + phone3);
		System.out.println(member.toString());
		member.setM_ip(req.getRemoteAddr());
		member.setM_del("N");
		member.setM_grade(1);
		member.setM_picture("0");
		System.out.println(member.toString());
		int result = ms.insert(member);

		return "redirect:main";
	}

	@RequestMapping(value = "idChk", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String idChk(Member member) throws Exception {
		System.out.println("idChk() 실행");
		System.out.println(member.getM_id());
		Member mem = ms.select(member);
		String msg = "";
		if (mem == null) {
			msg = "0";
		} else {
			msg = "1";
		}
		System.out.println(msg);
		return msg;
	}

	// 로그인 폼
	@RequestMapping("loginForm")
	public String loginForm() {

		return "loginForm";
	}

	// 로그인
	@RequestMapping(value = "login", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String login(Member member, HttpSession session) {
		System.out.println("login() 실행");
		System.out.println(member.toString());
		System.out.println(member.getM_password());
		Member mem = ms.select(member);
		String msg = " ";
		if (mem == null) {
			msg = "일치하는 정보가 없습니다";
			return msg;
		} else if (mem.getM_del().equals("Y")) {
			msg = "삭제 된 계정 입니다.";
			return msg;
		} else if (!member.getM_password().equals(mem.getM_password())) {
			msg = "비밀번호가 일치하지 않습니다";
			return msg;
		} else if (member.getM_password().equals(mem.getM_password())) {
			if (mem.getM_grade() == 0) {
				System.out.println("master");
				session.setAttribute("member", mem);
				session.setAttribute("admin", mem);
				return "1";
			} else {
				System.out.println("member로그인");
				session.setAttribute("member", mem);
			}
			return "1";
		} else
			msg = "다시 입력하세요";
		return msg;
		/*
		 * if(member.getM_password().equals(mem.getM_password())) {
		 * session.setAttribute("member",mem); return "redirect:main"; }else { return
		 * "loginForm"; }
		 */

	}

	@RequestMapping("jusoPopup")
	public String juso() {
		return "jusoPopup";
	}

	@RequestMapping("addressAPI")
	public String adressAPI() {
		return "addressAPI";
	}

	@RequestMapping("logOut")
	public String logOut(HttpServletRequest req) {
		/*
		 * if(req.getSession().getAttribute("member")!=null) { Member member
		 * =(Member)req.getSession().getAttribute("member"); if(member.getM_grade()==4)
		 * { return"logoutKakao"; } }
		 */

		req.getSession().invalidate();
		return "redirect:main";
	}

	@RequestMapping("myPageForm")
	public String myPageForm() {
		return "myPageForm";

	}

	@RequestMapping(value = "pwChk", produces = "applicaiton/text;charset=utf-8")
	@ResponseBody
	public String pwChk(Member member) {
		Member mem = ms.select(member);
		String msg;
		if (member.getM_password().equals(mem.getM_password())) {
			msg = mem.getM_password();
		} else
			msg = "비밀번호가 일치하지 않습니다";
		return msg;
	}

	@RequestMapping(value = "mDel", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String mdel(HttpServletRequest req) {
		Member member = (Member) req.getSession().getAttribute("member");
		System.out.println(member.toString());
		int result = ms.delete(member);
		if (result == 1)
			return "main";
		else
			return "myPageForm";
	}

	@RequestMapping("mUpdate")
	public String mUpdate(Model model, HttpSession session, Member member,
			@RequestParam(value = "m_file", required = false) MultipartFile mf, SessionStatus sStatus)
			throws IllegalStateException, IOException {
		System.out.println("UPLOAD FILE NAME : " + member.getM_file().getOriginalFilename());
		// 프로필 사진을 변경할 경우.
		// file이 null이 아니고 default name값이 아닐경우
		if (member.getM_file().getOriginalFilename() != null && !member.getM_file().getOriginalFilename().equals("")) {
			// 로컬 경로
			String localPath = "C:\\spring\\springSrc\\ad-pool\\src\\main\\webapp\\upload\\profile\\";
			String fileName = member.getM_file().getOriginalFilename();
			int fileSize = (int) member.getM_file().getSize();
			System.out.println("fileName : " + fileName + " / fileSize : " + fileSize);
			System.out.println("localPath : " + localPath);
			// 서버에 파일 저장.
			File f = new File(localPath + fileName);
			System.out.println(f.getPath());
			mf.transferTo(f);
			member.setM_picture(fileName);
		}
		System.out.println(member.toString());
		ms.update(member);
		Member mem = ms.select(member);
		sStatus.setComplete();
		session.setAttribute("member", mem);
		System.out.println(mem);
		return "redirect:main";
	}

	@Autowired
	private JavaMailSenderImpl jms;

	@RequestMapping("emailForm")
	public String emailForm() {
		return "email/emailForm";
	}

	@RequestMapping("email")
	public String email(Email email, Model model) {
		MimeMessage mm = jms.createMimeMessage();
		try {
			MimeMessageHelper mmh = new MimeMessageHelper(mm, true, "utf-8");
			mmh.setSubject(email.getTitle());
			mmh.setText("보내는사람:" + email.getEmail() + "\r\n내용:" + email.getContent());
			mmh.setTo("hocs153@naver.com");
			mmh.setFrom("hocs153@naver.com");
			jms.send(mm);
			model.addAttribute("message", "메일보내기 성공");
			return"redirect:main";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("message", "뷁 실패");
		}
		return "email/email";
	}
}
