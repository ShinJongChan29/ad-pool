package com.ad.adpool;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ad.adpool.model.Member;
import com.ad.adpool.model.NaverLogin;
import com.ad.adpool.service.MemberService;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import scala.util.parsing.json.JSONArray;
import scala.util.parsing.json.JSONObject;



@Controller
public class NaverHandler {
	/* NaverLoginBO */
	@Autowired
	private NaverLogin naverLoginBO;
	@Autowired
	private MemberService ms;
	/* NaverLoginBO */
	@Autowired
	private void setNaverLoginBO(NaverLogin naverLoginBO){
		this.naverLoginBO = naverLoginBO;
	}
	
    @RequestMapping("naverLogin")
    public String login(HttpSession session,Model model) {
        /* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        /* 생성한 인증 URL을 View로 전달 */
        model.addAttribute("url",naverAuthUrl);
       //("login", "url", naverAuthUrl);
        return "naverLogin";
    }
    
    @RequestMapping("callback")
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session,Model model) throws IOException, IllegalArgumentException, IllegalAccessException {
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		
		JsonParser parser = new JsonParser();
		
		JsonElement element = parser.parse(apiResult);
		JsonElement resElement = element.getAsJsonObject().get("response");
		/*JsonElement realResult = parser.parse(res);
		String id = realResult.getAsJsonObject().get("id").getAsString();
		JsonElement res1 = element.getAsJsonObject().get("response");
		*////System.out.println("name = "+name);
		//System.out.println("id = "+id);	
		String naver_id = resElement.getAsJsonObject().get("id").getAsString();
		String naver_name = resElement.getAsJsonObject().get("name").getAsString();
		String naver_picture=resElement.getAsJsonObject().get("profile_image").getAsString();
	
		System.out.println(naver_id);
		System.out.println(naver_name);
		System.out.println(naver_picture);
		System.out.println("apiResult:"+apiResult);
		
		Member vo = new Member();
		vo.setM_id("n"+naver_id);
		Member member = ms.select(vo);
		if(member == null) {
			vo.setM_id("n"+naver_id);
			vo.setM_name(naver_name);
			if(naver_picture == null || naver_picture.equals("")) {
				vo.setM_picture("naver");
			}
			vo.setM_picture(naver_picture);
			session.setAttribute("nMember", vo);
			return "naverJoinForm";
		}
		//model.addAttribute("result",apiResult);
		session.setAttribute("member", member);
		return "redirect:main";
	}
    
    @RequestMapping("naverJoin")
    public String naverJoin(HttpServletRequest req,HttpSession session,String naver_password, String naver_email,String naver_address) {
    	Member nMember =(Member)session.getAttribute("nMember");
    	Member member = new Member();
    	member.setM_id(nMember.getM_id());
    	member.setM_picture(nMember.getM_picture());
    	member.setM_name(nMember.getM_name());
    	member.setM_password(naver_password);
    	member.setM_email(naver_email);
    	member.setM_address(naver_address);
    	member.setM_grade(5);
    	member.setM_del("N");
    	member.setM_phone("010-5555-5555");
    	member.setM_ip(req.getRemoteAddr());
    	ms.insert(member);
    	if(session.getAttribute("nMember")!=null) {
    		session.removeAttribute("nMember");
    	}
    	session.setAttribute("member", member);
    	return "main";
    }
   
}
