package com.ad.adpool;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ad.adpool.model.Ads;
import com.ad.adpool.model.Member;
import com.ad.adpool.service.AdsService;
import com.ad.adpool.service.PagingBean;

@Controller
public class AdsController {
	@Autowired
	AdsService us;

	@RequestMapping("adsuploadForm")
	public String uploadForm(HttpSession session, Model model) {
		System.out.println(session.getAttribute("admin"));
		if(session.getAttribute("admin")==null) {
			return "sessionChk";
		}
		List<Ads> cateList = us.selectCategoryList();
		List<Ads> counList = us.selectCountryList();
	
		model.addAttribute("catelist", cateList);
		model.addAttribute("counlist", counList);
		return "/ads/adsuploadForm";
	}
	@RequestMapping("personalUpForm")
	public String personalUpForm(HttpSession session) {
		System.out.println(session.getAttribute("member"));
		if(session.getAttribute("member")==null) {
			return "sessionChk";
		}
		return "/ads/personalUpForm";
	}

	@RequestMapping("adsupload")
	public String upload(@RequestParam(value = "file", required = false) MultipartFile mf, Ads ads, HttpSession session,String[]tag)
			throws IllegalStateException, IOException {
		 String upPath = "d:/Spring/ad-pool/src/main/webapp/upload/"; // 업로드 받을 경로
		//String upPath = "C:/temp0/ffmpeg/bin";
		String yId = "";
		// count-> 중복을 피하기 위해 파일이름 앞에 번호를 붙여주기 위함
		String tagName= "";

		if(tag.length>0) {
			for(int i=0;i<tag.length;i++) {
				if(!tag[i].equals("")&&tag[i]!=null)
				tagName+="#"+tag[i];
			}
			ads.setA_tag(tagName);
		}
		System.out.println(tagName);
		System.out.println(ads.getA_tag());
		
		int count = us.select();
		if (ads.getFile() != null) { // 파일이 업로드 될 때
			// 파일이름은 count_파일이름
			String fileName = count + "_" + ads.getFile().getOriginalFilename();
			int fileSize = (int) ads.getFile().getSize();
			// 업로드된 파일을 경로에 저장
			mf.transferTo(new File(upPath +"adsVideo/"+ fileName));
			//String loc = upPath +"/adsVideo"+ fileName; // 업로드된 경로+파일이름
			//이미지 추출 메소드
			extractImage(upPath,fileName);
			String imgName = fileName.split("\\.")[0];
			ads.setA_loc(imgName+".png"); // 경로 저장
			ads.setA_filename(fileName); // 파일이름 저장
		} else if (ads.getA_url() != null) { //URL이 업로드 될 때
			String pattern = "(?<=watch\\?v=|/videos/|embed\\/)[^#\\&\\?]*";
			Pattern compiledPattern = Pattern.compile(pattern);
			Matcher matcher = compiledPattern.matcher(ads.getA_url());
			if (matcher.find()) {
				yId = matcher.group();
			} else
				yId = "0";
		}
			// url 값이 없으면 0을 저장
		
		if(ads.getA_country() == null) {
			
			ads.setA_country("Korea");
			ads.setA_kind("Personal");
			ads.setA_grade(2);
		}
			if (ads.getA_url() == null) {
				ads.setA_url("0");
				// file이 없으면 0을 저장
			} else if (ads.getA_filename() == null) {
				ads.setA_filename("0");
				ads.setA_loc(yId);
			}
				ads.setA_goodcount(0);
				ads.setA_viewcount(0);
				ads.setA_del("N");
				if(session.getAttribute("admin")!=null) {
				Member mem = (Member)session.getAttribute("admin");
				}else {
				Member mem=(Member)session.getAttribute("member");
				ads.setA_name(mem.getM_id());
				}
			System.out.println(ads.toString());
			int result = us.insert(ads);

		return "main";

	}
	@RequestMapping("viewList")
	public String viewList(Ads ads, Model model) {
		List<Ads> vlist = us.selectView(ads);
		model.addAttribute("vlist", vlist);
		return "/ads/viewList";
	}

	//동영상 파일 업로드시 이미지 추출
	public void extractImage(String upPath,String fileName) {
		try {
			//upPath = "d:/Spring/ad-pool/src/main/webapp/upload/";	
			String videoFilePath = upPath+"adsVideo/"+fileName;
			String  imgName= fileName.split("\\.")[0];
			System.out.println("fileName:"+fileName);
			System.out.println("imgName:"+imgName);
			String imageFilePath = upPath+"adsImg/"+imgName+".png";

			String[] commands = { "C:\\ffmpeg\\bin\\ffmpeg.exe", "-ss", "00:00:02", "-i", videoFilePath, "-an", "-vframes", "1", "-y",
					imageFilePath };

			Process processor = Runtime.getRuntime().exec(commands);

			String line1 = null;
			BufferedReader error = new BufferedReader(new InputStreamReader(processor.getErrorStream()));
			while ((line1 = error.readLine()) != null) {
				System.out.println(line1);
			}
			processor.waitFor();
			int exitValue = processor.exitValue();
			if (exitValue != 0) {
				throw new RuntimeException("exit code is not 0 [" + exitValue + "]");
			}
			
			System.out.println(imageFilePath);
			
		} catch (IOException e) {
			throw new RuntimeException(e);
		} catch (InterruptedException e) {
			throw new RuntimeException(e);
		}
	}

}
