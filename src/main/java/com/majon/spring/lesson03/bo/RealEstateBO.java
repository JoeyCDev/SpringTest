package com.majon.spring.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majon.spring.lesson03.dao.RealEstateDAO;
import com.majon.spring.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateDAO realEstateDAO;
	
	// 1.
	
	public RealEstate getRealEstate(int id) {
		
		return realEstateDAO.selectRealEstate(id);
		
	}
	
	// 2.
	public List<RealEstate> getRealEstateList(int rentPrice){
		
		return realEstateDAO.selectRealEstateList(rentPrice);
		
		
	}
	
	// 3.
	public List<RealEstate> getRealEstateListMultipleParam(int area, int Price){
		
		return realEstateDAO.selectRealEstateListMultipleParam(area, Price);
		
	}

}
