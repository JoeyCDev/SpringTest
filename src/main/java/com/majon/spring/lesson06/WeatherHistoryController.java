package com.majon.spring.lesson06;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@GetMapping("/example1/1")
	public String insertWeather() {
		
		return "/lesson06/InsertWeather";
		
	}
	
	@GetMapping("example1/insertResult")
	@ResponseBody
		public String printInsertResult(@RequestParam("date")String date, @RequestParam("weather") String weather
										,@RequestParam("microDust")String microDust, @RequestParam("temperatures") double temperatures
										,@RequestParam("precipitation")double precipitation, @RequestParam("windSpeed")double windSpeed) throws ParseException {
		
			Date date1 = new SimpleDateFormat("yyyy-mm-dd").parse(date);  
			WeatherHistory weatherHistory = new WeatherHistory();
				weatherHistory.setDate(date1);
				weatherHistory.setWeather(weather);
				weatherHistory.setMicroDust(microDust);
				weatherHistory.setTemperatures(temperatures);
				weatherHistory.setPrecipitation(precipitation);
				weatherHistory.setWindSpeed(windSpeed);
				
			int count = weatherHistoryBO.insertWeatherHistory(weatherHistory);
		
		return "입력성공 " + count;
	}
	
}
