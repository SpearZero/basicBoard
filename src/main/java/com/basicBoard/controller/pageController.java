package com.basicBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/*")
public class pageController {
	
	@GetMapping("/board")
	public String board() {
		
		return "/board/board";
	}
	
	@GetMapping("/main")
	public String main() {
		
		return "/home";
	}
}
