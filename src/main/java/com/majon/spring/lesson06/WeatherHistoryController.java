package com.majon.spring.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.majon.spring.lesson06.bo.WeatherHistoryBO;
import com.majon.spring.lesson06.model.WeatherHistory;

@Controller
@RequestMapping("/lesson06")
public class WeatherHistoryController {

	@Autowired
	public WeatherHistoryBO weatherHistoryBO;
	
	@GetMapping("/example1")
	public String example1(Model model) {
		
		
			List<WeatherHistory> weatherHistories =  weatherHistoryBO.selectWeatherHistory();
			model.addAttribute("weatherHistories", weatherHistories);
		
		return "/lesson06/WeatherInfo";
	}
	
}
