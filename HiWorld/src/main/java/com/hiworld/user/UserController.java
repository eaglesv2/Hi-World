package com.hiworld.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hiworld.user.service.UserService;
import com.hiworld.user.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {
	
	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String SignUp(@ModelAttribute("userVO") UserVO userVO, HttpServletResponse res) {
		
		userService.insertSawon(userVO);
		return "home";
	}
	
}