package com.ad.adpool;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ad.adpool.model.Ads;
import com.ad.adpool.model.KeywordLog;
import com.ad.adpool.model.Member;
import com.ad.adpool.service.AdminService;
import com.ad.adpool.service.MemberService;
import com.ad.adpool.service.PagingBean;

@Controller
public class AdminController {

	@Autowired
	AdminService as;
	@Autowired
	MemberService ms;
	@RequestMapping("testView")
	public String testView() {
		
		return "admin/testView";
	}
	
	@RequestMapping("adminPage")
	public String adminPage() {
		return "/admin/adminPage";
	}

	@RequestMapping("memberList")
	public String memberList(String pageNum, Model model, Member member) {
		List<Member> memList;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		String keyword = null;
		if (member.getAm_keyword() != null) {
			keyword = member.getAm_keyword();
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = as.memberTotal(member);
		int rowPerPage = 10;
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int no = total - startRow + 1;
		member.setStartRow(startRow);
		member.setEndRow(endRow);
		memList = as.memberList(member);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		model.addAttribute("mList", memList);
		model.addAttribute("pb", pb);
		model.addAttribute("keyword", keyword);
		System.out.println("memberTotal:"+total+",memberEndpage:"+pb.getEndPage());
		return "/admin/memberList";
	}

	@RequestMapping("memberDetail2")
	public String memberDetail2(Member member, Model model) {
		Member mList = as.select(member);
		model.addAttribute("mList", mList);
		System.out.println(mList.toString());
		return "/admin/memberDetail2";
	}
	
	@RequestMapping("mainAdsList")
	public String mainAdsList(Model model, Ads ads,String divi, String para, String pageNum,String keyword) {
		List<Ads> adsList;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		ads.setOrderby("desc");
		if (para != null) {
			if(para.equals(ads.getParam())) {
				ads.setOrderby("asc");
			}
			if (para.equals("name")) {
				ads.setParam("a_name");
			} else if (para.equals("category")) {
				ads.setParam("a_category");
			} else if (para.equals("kind")) {
				ads.setParam("a_kind");
			} else if (para.equals("good")) {
				ads.setParam("a_goodcount");
			} else if (para.equals("view")) {
				ads.setParam("a_viewcount");
			}

		}
		System.out.println("divi:"+divi);
		if (divi != null && !divi.equals("")) {
			if(divi.equals("0")) {
				divi = "5";
			}
			int division = Integer.parseInt(divi);
			ads.setDivision(division);
			ads.setA_grade(division);
		}
		System.out.println(ads.getDivision());
		System.out.println("pageNum:"+pageNum);
		int currentPage = Integer.parseInt(pageNum);
		System.out.println("ads:"+ads.toString());
		int total = as.adadstotal(ads);
		System.out.println(total);
		int rowPerPage = 10;
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		ads.setStartRow(startRow);
		ads.setEndRow(endRow);
	
		adsList = as.adsList(ads);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		System.out.println(adsList.size()+":adsList.size()"+"end:"+pb.getEndPage()+",totalPage:"+pb.getTotalPage());
		model.addAttribute("aList",adsList);
		model.addAttribute("pb",pb);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("keyword",keyword);
		if(divi !=null && !divi.equals("")) {
			model.addAttribute("divi",divi);
			return "/admin/adcomList";
		}
		return "/admin/mainAdsList";
	}
	
	
	@RequestMapping("adminKeyword")
	public String adminKeyword(Model model, String day,String writeText) {
		KeywordLog keyLog = new KeywordLog();
		keyLog.setTime(0);
		if(day!=null && day!="") {
			if(day.equals("Day")) {
				keyLog.setTime(1);
			}else if(day.equals("Week")){
				keyLog.setTime(7);
			}else if(day.equals("Month")) {
				keyLog.setTime(30);
			}else if(day.equals("Year")) {
				keyLog.setTime(365);	
			}else if(day.equals("WriteText")) {
				String statistics="";
				List<KeywordLog> writeList = as.writeList(keyLog);
				statistics ="writeText";
				writeText(writeList,statistics);
			}
		}
		List<KeywordLog> keyList = as.selectKeyList(keyLog); 
		System.out.println(keyList.size());
		int chart=0;
		for(int i=0;i<keyList.size();i++) {
			 chart+= keyList.get(i).getCnt();
		}
		int [] intArr = new int[keyList.size()];
		double [] doubleArr = new double[keyList.size()];
		String [] btnArr = {"ALL","Year","Month","Week","Day","WriteText"};
		for(int i=0;i<keyList.size();i++) {
		double ctemp = keyList.get(i).getCnt()*1.0;	
		double ktem =  ctemp*100.0/chart;
		double tem = (double)(Math.round(ktem*100))/100;
		int temp = (int)tem*3;
		doubleArr[i]=tem;
		intArr[i] = temp;
		}
		model.addAttribute("doubleArr",doubleArr);
		model.addAttribute("intArr",intArr);
		model.addAttribute("keyList",keyList);
		model.addAttribute("btnArr",btnArr);
		model.addAttribute("temp",day);
		return "/admin/adkeyList";
		
	}
	public void writeText(List<KeywordLog> keyList, String statistics) {
		String txt = "" ;
        if(statistics!=null) {
        if(statistics.equals("writeText")) {
         	for(int i=0;i<keyList.size();i++) {
            	txt +=(keyList.get(i).getK_keyword()+" "); 
         	}
        }else if(statistics.equals("statistics"))
        	for(int i=0;i<keyList.size();i++) {
        	txt +=(keyList.get(i).getK_keyword()+":"+keyList.get(i).getCnt()+"\r\n"); 
        }
        }
        
        
        String fileName = "C:\\temp\\keyword.txt" ;
        try{
            // BufferedWriter 와 FileWriter를 조합하여 사용 (속도 향상)
            BufferedWriter fw = new BufferedWriter(new FileWriter(fileName));
             
            // 파일안에 문자열 쓰기
            fw.write(txt);
            fw.flush();
 
            // 객체 닫기
            fw.close();
            System.out.println("텍스트쓰기"); 
             
        }catch(Exception e){
            e.printStackTrace();
        }


	}
	@RequestMapping("adcomList")
	public String adcomList(Model model, Ads ads, String divi) {
		System.out.println("???");
		System.out.println("divi:" + divi);
		List<Ads> cList;
		if (divi != null && !divi.equals("")) {
			int division = Integer.parseInt(divi);
			ads.setDivision(division);
			ads.setA_grade(division);
			cList = as.selectCom(ads);
			model.addAttribute("cList", cList);
		}
		return "/admin/adcomList";

	}

	@RequestMapping("detailUpdate")
	public String detailUpdate(Member member) {
		as.admemberupdate(member);
		return "/admin/memberDetail2";
	}

	@RequestMapping("detaildely")
	public String detaildely(Member member) {
		System.out.println("dely" + member.toString());
		as.admemberdely(member);
		return "/admin/memberDetail2";
	}

	@RequestMapping("detaildeldb")
	public String detaildeldb(Member member) {
		System.out.println("detaildeldb" + member.toString());
		as.detaildeldb(member);
		return "/admin/memberDetail2";
	}

	@RequestMapping("adsDetail")
	public String adsDetail(Ads ads, Model model, String no) {
		System.out.println("no:" + no);
		if (no != null) {
			ads.setA_no(Integer.parseInt(no));
		}
		Ads selectRowNum = as.selectRn(ads);
		
		System.out.println(ads.getA_no());
		Ads selectAds = as.selectAds(ads);
		model.addAttribute("selAds", selectAds);
		return "/admin/adsDetail";
	}
	@RequestMapping("nextDetail")
	public String nextDetail(Ads ads,Model model,String preNext) {
		System.out.println("no:"+ads.getA_no()+",grade:"+ads.getA_grade());
		Ads selectRowNum = as.selectRn(ads); 
		int rowNumber = selectRowNum.getRn();
		if(preNext!=null && !preNext.equals("")) {
			if(preNext.equals("next")) {
				ads.setRn(rowNumber+1);
			}else if(preNext.equals("previous")) {
				ads.setRn(rowNumber-1);
			}
				
		}
		Ads selectNextAds= as.selectNext(ads);
		
		model.addAttribute("selAds",selectNextAds);
		return "/admin/adsDetail";
	}

	@RequestMapping("adsdetailUpdate")
	public String adsdetailUpdate(Ads ads) {
		System.out.println("adsDetail:" + ads.toString());

		as.adadsupdate(ads);
		return "/admin/adsDetail";
	}

	@RequestMapping("adsdel")
	public String adsdel(int no, String division) {
		System.out.println("division:" + division);
		System.out.println("no:" + no);
		if (division != null) {
			if (division.equals("Y")) {
				as.adsdeleY(no);
			} else if (division.equals("DB")) {
				as.adsdelDB(no);
			}
		}
		return "/admin/adsDetail";
	}

	@RequestMapping("adsPermit")
	public String adsPermit(int no, String division) {
		Ads ads = new Ads();
		ads.setA_no(no);
		System.out.println("division:" + division);
		System.out.println(no);
		if (division != null) {
			if (division.equals("agree")) {
				ads.setA_grade(3);
			} else if (division.equals("disagree")) {
				ads.setA_grade(2);
			}
			as.adsPermit(ads);
		}
		return "/admin/adsDetail";
	}
}
