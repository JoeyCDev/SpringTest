package com.majon.spring.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.majon.spring.lesson04.bo.SellerBO;
import com.majon.spring.lesson04.model.Seller;

@Controller
@RequestMapping("/lesson04/test01")
public class SellerController {
	
	@Autowired
	private SellerBO sellerBO;

	// 1. seller 추가
	
	@RequestMapping("/1")
	public String sellerInsertForm() {
		
		return "/lesson04/sellerInsertForm";
	}
	
	@PostMapping("/add_seller")
	@ResponseBody
	public String insertResultPage(@RequestParam("nickname") String nickname
									,@RequestParam("profileImageUrl") String profileImageUrl
									,@RequestParam("temperature") double temperature) {
		
		int count = sellerBO.addLastSeller(nickname, profileImageUrl, temperature);
		
		return "입력 성공 : " + count;
	}
	
	// 2. seller 출력
	/*
	@RequestMapping("/seller_info")
	public String printLastSeller(Model model) {
		
		Seller lastSeller = sellerBO.selectLastSeller();
		
		model.addAttribute("result", lastSeller);
		model.addAttribute("subject", "판매자 정보");
		
		return "/lesson04/printLastSeller";
	}
	*/
	 
		// 3. seller 검색 출력 (2.3 다 되는 메소드)
			@RequestMapping("/seller_info")
			public String printLastSellerBySearch(@RequestParam(value="id", required=false) Integer id, Model model) {
				
				
				if(id==null||id.equals("")) {
					 Seller lastSeller = sellerBO.selectLastSeller();
					
					model.addAttribute("result", lastSeller);
					model.addAttribute("subject", "판매자 정보");
				} else {
					Seller lastSeller = sellerBO.selectLastSellerBySearch(id);
					
					model.addAttribute("result", lastSeller);
					model.addAttribute("subject", "판매자 정보");
				}
				
				return "/lesson04/printSeller";
			}
}


