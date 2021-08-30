package com.majon.spring.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.majon.spring.lesson06.model.NewReview;

@Repository
public interface NewReviewDAO {

	public List<NewReview>selectReview(@Param("storeId")int storeId);
	
}
