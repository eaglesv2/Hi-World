package com.hiworld.minihp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hiworld.minihp.service.MiniHpService;

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
		System.out.println("사진첩");
		model.addAttribute("menu",menu);
		return "MiniHP/MiniHP_Menu_Picture";
	}
	
	@GetMapping("/miniHpBoard.do")
	public String miniHpBoard(String menu, Model model) {
		System.out.println("게시판");
		model.addAttribute("menu",menu);
		return "MiniHP/MiniHP_Menu_Board";
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

}
