package com.ad.adpool;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ad.adpool.model.KakaoLogin;
import com.ad.adpool.model.Member;
import com.ad.adpool.service.MemberService;
import com.fasterxml.jackson.databind.JsonNode;

@Controller
public class KakaoHandler {
	@Autowired
	KakaoLogin service;
	@Autowired
	MemberService ms;
	
	@RequestMapping("kakaLogin")
	public String startLogin() {
		return "kakaLogin";
		
	}
	@RequestMapping(value = "/kakaoLogin" , produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(@RequestParam("code") String code , HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{

	  JsonNode token = KakaoLogin.getAccessToken(code);
	  JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
	  System.out.println("profile:"+profile);
	  Member vo = KakaoLogin.changeData(profile);
	  vo.setM_id("k"+vo.getM_id());
	  
	 // System.out.println(session);
	 // session.setAttribute("login", vo);
	  System.out.println(vo.toString());
	  Member member = ms.select(vo);
	  if(member==null) {
	//	  session.setAttribute("kToken", code);
		  session.setAttribute("vo", vo);
		  return "kakaoJoinForm";
	  }else 
		  if(!member.getM_picture().equals(vo.getM_picture())){
			  member.setM_picture(vo.getM_picture());
			  ms.update(member);
		  }
		  session.setAttribute("member", member);  
	  return "main";
	}
	/*@RequestMapping(value="/logoutKakao", method= {RequestMethod.POST,RequestMethod.GET})
	public String kakaoLogout(HttpServletRequest request,  HttpSession session) {
		String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
		final HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(RequestUrl);
		if(session.getAttribute("kToken")!=null) {
		System.out.println("로그아웃");
			String autorize_code = (String)session.getAttribute("kToken");
		
		post.addHeader("Authorization", "Bearer " + autorize_code);
		
		HttpResponse response;
		try {
			response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Post parameters : " + post);
			System.out.println("Response Code : " + responseCode);
			return "main";
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		return "main";
	}*/
	
	@RequestMapping("kakaoJoin")
	public String kakaoJoin(HttpSession session,String kakao_password, String kakao_email,String kakao_address,HttpServletRequest req) {
		
		Member vo = (Member)session.getAttribute("vo");
		System.out.println(vo.toString());
		System.out.println(kakao_address);
		
		Member member = new Member();
		member.setM_id(vo.getM_id());
		member.setM_picture(vo.getM_picture());
		member.setM_name(vo.getM_name());
		
		member.setM_password(kakao_password);
		member.setM_address(kakao_address);
		member.setM_email(kakao_email);
		
		member.setM_del("N");
		member.setM_ip(req.getRemoteAddr());
		member.setM_grade(4);
		member.setM_phone("010-7777-7777");
		ms.insert(member);
		if(session.getAttribute("vo")!=null) {
			session.removeAttribute("vo");
		}
		session.setAttribute("member", member);
		return "main";
	}
}
