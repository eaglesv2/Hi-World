package com.hiworld.minihp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hiworld.minihp.service.MiniHpBoardService;

@Controller
public class MiniHpBoardContoller {
	
	@Autowired
	private MiniHpBoardService service;
	
	@GetMapping("/miniHpBoard.do")
	public String miniHpBoard(String menu, Model model) {
		System.out.println("게시판 main");
		model.addAttribute("list",service.getAll());
		return "MiniHP/MiniHP_Menu_Board";
	}
	@GetMapping("/MiniHpBoardSide.do")
	public String miniHpBoardSide(Model model) {
		System.out.println("게시판 side");
		return "MiniHP/MiniHP_Menu_Board_Side";
	}
}
