package com.majon.spring.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.majon.spring.lesson04.bo.RealtorBO;
import com.majon.spring.lesson04.model.Realtor;

@Controller
@RequestMapping("/lesson04/test02")
public class RealtorController {
	
	@Autowired
	private RealtorBO realtorBO;
	
	@GetMapping("/1")
	public String addRealtor() {
		
		return "/lesson04/addRealtor";
		
	}
	
	@GetMapping("/add_realtor")
	public String printRealtorInfo(
			@ModelAttribute Realtor realtor, Model model) {
		
		 realtorBO.addRealtor(realtor);
		 
		 model.addAttribute("result", realtor);
		
		return "/lesson04/printRealtorInfo";
	}

}
