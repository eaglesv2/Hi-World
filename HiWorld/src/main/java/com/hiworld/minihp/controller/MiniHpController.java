package com.hiworld.minihp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.minihp.service.MiniHpService;
import com.hiworld.minihp.vo.MiniHP_ProfileVO;

@Controller
public class MiniHpController {
	

	@Autowired
	private MiniHpService service;
	

	@RequestMapping("/MiniHP_Home.do")
	public String miniHp_Home() {
		
		return "MiniHP/MiniHP_Home";
	}
	
	@RequestMapping("/MiniHP_TopTitle.do")
	public String miniHp_TopTitle() {
		return "MiniHP/MiniHP_TopTitle";
	}
	
	@RequestMapping("/MiniHP_Left.do")
	public String miniHp_Left() {
		return "MiniHP/MiniHP_Left";
	}
	
	@RequestMapping("/MiniHP_Right.do")
	public String miniHp_Right() {
		return "MiniHP/MiniHP_Right";
	}
	
	
	@GetMapping("/miniHpProfile.do")
	public String miniHpProfile(String menu, Model model) {
		System.out.println("프로필 화면");
		model.addAttribute("menu",menu);
		return "MiniHP/MiniHP_Menu_Profile";
	}
	
	@GetMapping("/miniHpPicture.do")
	public String miniHpPicture(String menu, Model model) {
		System.out.println("사진첩1");
		model.addAttribute("menu",menu);
		return "MiniHP/MiniHP_Menu_Picture";
	}
	@GetMapping("/MiniHpPicutreSide.do")
	public String miniHpPictureSide(Model model) {
		System.out.println("사진첩2");
		return "MiniHP/MiniHP_Menu_Picture_Side";
	}
	
	
	
	@GetMapping("/miniHpVideo.do")
	public String miniHpVideo(String menu, Model model) {
		System.out.println("비디오");
		model.addAttribute("menu",menu);
		return "MiniHP/MiniHP_Menu_Video";
	}
	
	@GetMapping("/miniHpGuest.do")
	public String miniHpGuest(String menu, Model model) {
		System.out.println("방명록");
		model.addAttribute("menu",menu);
		return "MiniHP/MiniHP_Menu_Guest";
	}
	
	@GetMapping("/miniHpSetting.do")
	public String miniHpSetting(String menu, Model model) {
		System.out.println("관리");
		model.addAttribute("menu",menu);
		return "MiniHP/MiniHP_Menu_Setting";
	}
	
	@ResponseBody
	@GetMapping("/miniHp_check_profile.do")
	public String miniHpCheckProfile(HttpServletRequest request) {
		System.out.println("프로필 확인 컨트롤러");
		String id = request.getParameter("userId");
		System.out.println(id);
		String result = service.checkProfile(id);
		System.out.println("프로필 확인 서비스 갔다옴");
		System.out.println(result);
		return result;
	}
	
	@ResponseBody
	@GetMapping(value = "/miniHp_get_profile.do", produces ="application/text;charset=utf8")
	public String miniHpGetProfile(HttpServletRequest request) {
		System.out.println("프로필 가져오기 컨트롤러");
		String id = request.getParameter("userId");
		String result = service.getProfile(id);
		return result;
	}
	
	@ResponseBody
	@GetMapping("/miniHp_insert_profile.do")
	public String miniHpInsertProfile(MiniHP_ProfileVO profileVO) {
		System.out.println("프로필 작성 컨트롤러");
		int result = service.insertProfile(profileVO);
		
		System.out.println("프로필 작성 서비스 갔다옴");
		String check = "";
		
		if(result == 0) {
			check = "fail";
		} else if(result == -1) {
			check = "error";
		} else {
			check = "success";
		}
		
		return check;
	}
	
	@ResponseBody
	@GetMapping("/miniHp_update_profile.do")
	public String miniHpUpdateProfile(MiniHP_ProfileVO profileVO) {
		System.out.println("프로필 수정 컨트롤러");
		int result = service.updateProfile(profileVO);
		System.out.println(result);
		
		System.out.println("프로필 수정 서비스 갔다옴");
		String check = "";
		
		if(result == 0) {
			check = "fail";
		} else if(result == -1) {
			check = "error";
		} else {
			check = "success";
		}
		
		return check;
	}
}
