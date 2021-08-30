package com.majon.spring.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.majon.spring.lesson02.bo.StoreBO;
import com.majon.spring.lesson06.bo.NewReviewBO;
import com.majon.spring.lesson06.model.NewReview; 


@Controller
public class StoreController {

	@Autowired
	private StoreBO storeBO;
	@Autowired
	private NewReviewBO newReviewBO;
	
	@GetMapping("/lesson06/test06/stores")
	public String viewStoreList(Model model) {
		
		List<org.apache.catalina.Store> storeList= storeBO.getStoreList();
		
		model.addAttribute("storeList", storeList);
		
		return "/lesson06/viewStoreList";
	}
	
	@GetMapping("/test06/reviews")
	public String viewReviewList(@RequestParam(value="storeId", required=false) Integer storeId
								,@RequestParam("storeName")String storeName
								,Model model) {
		
		
		model.addAttribute("storeName", storeName);
		
		List<NewReview> selectReview = newReviewBO.selectReview(storeId);
		
		model.addAttribute("storeReview", selectReview);
	
		
		return "/lesson06/ViewReviewList";
		
		}
		
		
	}

