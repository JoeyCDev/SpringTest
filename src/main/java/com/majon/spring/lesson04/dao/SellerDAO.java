package com.majon.spring.lesson04.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.majon.spring.lesson04.model.Seller;

@Repository
public interface SellerDAO {
	// 1.
	public int insertLastSeller(@Param("nickname") String nickname, @Param("profileImageUrl") String profileImageUrl, @Param("temperature") double temperature);
	
	// 2.
	public Seller selectLastSeller();
	
	// 3.
	public Seller selectSellerBySearch(@Param("id") int id);
}
