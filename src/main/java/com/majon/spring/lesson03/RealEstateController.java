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
public class RealEstateController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	// 1.id 로 select 하기
	@RequestMapping("/lesson03/test01/1")
	@ResponseBody
	public RealEstate printRealEstate(@RequestParam("id") int id) {
		
		return realEstateBO.getRealEstate(id);
		
	}
	
	// 2. 월세 조건 select
	
	@RequestMapping("/lesson03/test01/2")
	@ResponseBody
	public List<RealEstate> printRealEstateList(@RequestParam("rent") int rentPrice){
		
		return realEstateBO.getRealEstateList(rentPrice);
		
	}
	
	// 3. 복합 조건 select
	@RequestMapping("/lesson03/test01/3")
	@ResponseBody
	public List<RealEstate> printRealEstateListMultipleParam(@RequestParam("area") int area, @RequestParam("price") int price){
		return realEstateBO.getRealEstateListMultipleParam(area, price);
	}
	
	// 1. 객체로 insert 하기
	
	@RequestMapping("/lesson03/test02/1")
	@ResponseBody
	public String printRealEstateResultAsObject() {
		
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
			int count = realEstateBO.addRealEstateAsObject(realEstate);
			
			return "입력 성공 : " + count;
		}
	
	// 2. field 로 insert 하기
	@RequestMapping("/lesson03/test02/2")
	@ResponseBody
	public String printRealEstateResult(@RequestParam("realtorid") int realtorId) {
		
		int count = realEstateBO.addRealEstate(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		
		return "입력 성공 : " + count;
	}
	
	// 3. UPDATE 다루기
	
	@RequestMapping("lesson03/test03")
	@ResponseBody
	public String printUpdateResult(@RequestParam("id") int id, @RequestParam("type") String type, @RequestParam("price") int price) {
		
		int count = realEstateBO.updateRealEstate(id, type, price);
		
		return "수정 성공 : " + count;
		
	}
	
	// 4. DELETE 다루기
	
	@RequestMapping("lesson03/test04")
	@ResponseBody
	public String printDeleteResult(@RequestParam("id") int id) {
		
		int count = realEstateBO.deleteRealEstate(id);
		
		return "삭제 성공 : " + count;
		
	}
	
	}
	
	
	


