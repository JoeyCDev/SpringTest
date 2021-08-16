package com.majon.spring.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.majon.spring.lesson03.bo.RealEstateBO;
import com.majon.spring.lesson03.model.RealEstate;

@Controller
@RequestMapping("/lesson03/test01")
public class RealEstateController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	// 1.id 로 select 하기
	@RequestMapping("/1")
	@ResponseBody
	public RealEstate printRealEstate(@RequestParam("id") int id) {
		
		return realEstateBO.getRealEstate(id);
		
	}
	
	// 2. 월세 조건 select
	
	@RequestMapping("/2")
	@ResponseBody
	public List<RealEstate> printRealEstateList(@RequestParam("rent") int rentPrice){
		
		return realEstateBO.getRealEstateList(rentPrice);
		
	}
	
	// 3. 복합 조건 select
	@RequestMapping("/3")
	@ResponseBody
	public List<RealEstate> printRealEstateListMultipleParam(@RequestParam("area") int area, @RequestParam("price") int price){
		return realEstateBO.getRealEstateListMultipleParam(area, price);
	}
	
	
	

}
