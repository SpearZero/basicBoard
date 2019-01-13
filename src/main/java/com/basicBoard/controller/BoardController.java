package com.basicBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.basicBoard.dto.BoardDTO;
import com.basicBoard.dto.Criteria;
import com.basicBoard.dto.PageDTO;
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
	public String list(Criteria cri, Model model) {
		
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/board/board";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BoardDTO board,@ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
		
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno")int bno, @ModelAttribute("cri")Criteria cri, Model model) {
		
		model.addAttribute("board", service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardDTO board,@ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "ok");
		}
		
		return "redirect:/board/list"+cri.getListLink();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno")int bno,@ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list"+cri.getListLink();
	}
}
