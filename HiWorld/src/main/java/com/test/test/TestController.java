package com.test.test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.test.vo.TestVO;

@Controller
public class TestController {
	@GetMapping("/test.do")
	public String test(TestVO vo, Model model) {
		System.out.println(vo);
		
		
		return "testPage";
	}
}
