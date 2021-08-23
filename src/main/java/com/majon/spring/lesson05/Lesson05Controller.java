package com.majon.spring.lesson05;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lesson05")
public class Lesson05Controller {

	@GetMapping("/test01")
	public String printResult() {
		
		return "/lesson05/CoreLibraryEx01";
	}
	
}