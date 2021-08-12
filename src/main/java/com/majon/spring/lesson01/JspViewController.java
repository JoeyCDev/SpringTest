package com.majon.spring.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JspViewController {
	
	@RequestMapping("/lesson01/test03/1")
	public String view() {
		
		return "/lesson01/example3";
	}

}
