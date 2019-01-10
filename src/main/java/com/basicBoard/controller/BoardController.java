package com.basicBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.basicBoard.dto.BoardDTO;
import com.basicBoard.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/home")
	public String home() {
		
		return "home";
	}
	
	@GetMapping("/list")
	public String list(Model model) {
		
		model.addAttribute("list", service.getList());
		
		return "/board/board";
	}
	
	@PostMapping("/register")
	public String register(BoardDTO board, RedirectAttributes rttr) {
		
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("bno")int bno, Model model) {
		
		model.addAttribute("board", service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardDTO board, RedirectAttributes rttr) {
		
		if(service.modify(board)) {
			rttr.addAttribute("result", "ok");
		}
		
		return "redirect:/bord/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno")int bno, RedirectAttributes rttr) {
		
		if(service.remove(bno)) {
			rttr.addAttribute("result", "success");
		}
		
		return "redirect:/board/list";
	}
}
