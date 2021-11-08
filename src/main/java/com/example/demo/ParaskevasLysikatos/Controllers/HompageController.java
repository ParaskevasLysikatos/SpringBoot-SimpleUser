package com.example.demo.ParaskevasLysikatos.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HompageController {
	
	@GetMapping("/")
	public ModelAndView homepage() {
		ModelAndView mv= new ModelAndView();
		mv.setViewName("homepage");
		return mv;
	}
	
	//--------------------------------------------------------//
	@GetMapping("/homepageAjax")
	public ModelAndView homepageAjax() {
		ModelAndView mv= new ModelAndView();
		mv.setViewName("homepageAjax");
		return mv;
	}
	

}
