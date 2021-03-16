package com.hiworld.minihp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.hiworld.minihp.service.MiniHpService;

@Controller
public class MiniHpController {
	
	@Autowired
	private MiniHpService service;

}
