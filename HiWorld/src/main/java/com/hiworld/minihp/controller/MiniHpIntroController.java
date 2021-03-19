package com.hiworld.minihp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.minihp.service.MiniHpIntroService;
import com.hiworld.minihp.vo.MiniHpIntroVO;

@Controller
public class MiniHpIntroController {
	
	@Autowired
	MiniHpIntroService service;
	
	@ResponseBody
	@GetMapping("/miniHp_getIntroInfo.do")
	public String miniHpGetIntroInfo(HttpServletRequest request) {
		String UserID = request.getParameter("UserID");
		
		return service.getIntroInfo(UserID);
	}
	
	@GetMapping("/miniHp_updateIntroInfo.do")
	public String miniHpUpdateIntroInfo(MiniHpIntroVO introVO) {
		
		service.updateIntroInfo(introVO);
		
		return "MiniHP/MiniHP_Left";
	}
}
