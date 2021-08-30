package com.majon.spring.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majon.spring.lesson06.dao.NewReviewDAO;
import com.majon.spring.lesson06.model.NewReview;

@Service
public class NewReviewBO {
	
	@Autowired
	private NewReviewDAO newReviewDAO;
	
	public List<NewReview>selectReview(int storeId){
		return newReviewDAO.selectReview(storeId);
	}
}
