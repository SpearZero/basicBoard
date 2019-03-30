package com.basicBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/signup/*")
public class SignupController {
	
	@GetMapping("/register")
	public String signup() {
		
		return "signup";
	}
}
