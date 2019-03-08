package com.basicBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	@GetMapping("/test/member")
	public String test() {
		
		return "test";
	}
	
	@GetMapping("/login")
	public void login(String error, String logout, Model model) {
		
		if(error != null) {
			model.addAttribute("error", "error");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "logout");
		}
	}
}
