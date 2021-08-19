package com.majon.spring.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majon.spring.lesson04.dao.SellerDAO;
import com.majon.spring.lesson04.model.Seller;

@Service
public class SellerBO {
	
	@Autowired
	private SellerDAO sellerDAO;
	
	
	// 1.
	
	public int addLastSeller(String nickname, String profileImageUrl, double temperature) {
		
		return sellerDAO.insertLastSeller(nickname, profileImageUrl, temperature);
		
	}
	
	// 2.
	
	public Seller selectLastSeller() {
		
		return sellerDAO.selectLastSeller();
	}
	
	// 3.
	
	public Seller selectSellerBySearch(int id) {
		
		return sellerDAO.selectSellerBySearch(id);
		
	}

}
