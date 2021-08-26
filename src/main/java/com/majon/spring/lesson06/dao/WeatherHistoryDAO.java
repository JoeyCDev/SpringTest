package com.majon.spring.lesson06.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.majon.spring.lesson06.model.WeatherHistory;

@Repository
public interface WeatherHistoryDAO {

	public List<WeatherHistory> selectWeatherHistory();
	
}
