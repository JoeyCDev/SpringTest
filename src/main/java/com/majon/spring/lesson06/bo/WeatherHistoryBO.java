package com.majon.spring.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majon.spring.lesson06.dao.WeatherHistoryDAO;
import com.majon.spring.lesson06.model.WeatherHistory;

@Service
public class WeatherHistoryBO {

	@Autowired
	public WeatherHistoryDAO weatherHistoryDAO;
	
	public List<WeatherHistory> selectWeatherHistory() {
		
		return weatherHistoryDAO.selectWeatherHistory();
		
	}
	
}
